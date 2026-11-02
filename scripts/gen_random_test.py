#!/usr/bin/env python3
"""Random RV32I program generator for differential testing.

usage: gen_random_test.py SEED [SLOTS] [OUT.S]

Generates straight-line code with forward branches/jumps only (so it always terminates),
heavy register reuse (to provoke hazards), and aligned loads/stores to a scratch area.
Ends with EBREAK (the cores spin on it).
"""
import random, sys

seed  = int(sys.argv[1])
slots = int(sys.argv[2]) if len(sys.argv) > 2 else 900
out   = sys.argv[3] if len(sys.argv) > 3 else f"random_{seed}.S"
r = random.Random(seed)

REGS = list(range(1, 16))            # x1..x15 are the working registers
BASE = 20                            # x20 = scratch RAM base (0x200)
TMP  = 16                            # x16 used by the JALR sequence
recent = []

def src():
    if recent and r.random() < 0.6:
        return r.choice(recent[-3:])
    return r.choice(REGS + [0])

def dst():
    d = 0 if r.random() < 0.05 else r.choice(REGS)
    if d:
        recent.append(d)
    return d

def imm12():
    return r.choice([0, 1, -1, 2047, -2048, r.randint(-2048, 2047), r.randint(-64, 64)])

R_OPS = ["add", "sub", "sll", "slt", "sltu", "xor", "srl", "sra", "or", "and"]
I_OPS = ["addi", "slti", "sltiu", "xori", "ori", "andi"]
SH_OPS = ["slli", "srli", "srai"]
LOADS = [("lb", 1), ("lbu", 1), ("lh", 2), ("lhu", 2), ("lw", 4)]
STORES = [("sb", 1), ("sh", 2), ("sw", 4)]
BRANCHES = ["beq", "bne", "blt", "bge", "bltu", "bgeu"]

consts = [0, 1, -1, 0x7FFFFFFF, -0x80000000, 0x12345678, -0x12345678, 0xFF, 0x8000]

lines = [f"        .globl _start", "_start:", f"        li x{BASE}, 0x200"]
for k, x in enumerate(REGS):
    c = consts[k] if k < len(consts) else r.randint(-2**31, 2**31 - 1)
    lines.append(f"        li x{x}, {c}")
for k, x in enumerate(REGS):
    lines.append(f"        sw x{x}, {4*k}(x{BASE})")

targets = {}          # slot index -> label
body = []             # list of lists of lines (one entry per slot)

def label_for(slot):
    targets.setdefault(slot, f"L{slot}")
    return targets[slot]

for i in range(slots):
    kind = r.choices(["r", "i", "sh", "lui", "ld", "st", "br", "jal", "jalr"],
                     weights=[30, 18, 7, 5, 12, 10, 10, 4, 3])[0]
    if kind == "r":
        rs1, rs2 = src(), src()
        body.append([f"        {r.choice(R_OPS)} x{dst()}, x{rs1}, x{rs2}"])
    elif kind == "i":
        rs1 = src()
        body.append([f"        {r.choice(I_OPS)} x{dst()}, x{rs1}, {imm12()}"])
    elif kind == "sh":
        rs1 = src()
        body.append([f"        {r.choice(SH_OPS)} x{dst()}, x{rs1}, {r.randint(0, 31)}"])
    elif kind == "lui":
        if r.random() < 0.5:
            body.append([f"        lui x{dst()}, {r.randint(0, 0xFFFFF)}"])
        else:
            body.append([f"        auipc x{dst()}, {r.randint(0, 0xFFFFF)}"])
    elif kind == "ld":
        op, size = r.choice(LOADS)
        off = r.randrange(0, 256, size)
        body.append([f"        {op} x{dst()}, {off}(x{BASE})"])
    elif kind == "st":
        op, size = r.choice(STORES)
        off = r.randrange(0, 256, size)
        body.append([f"        {op} x{src()}, {off}(x{BASE})"])
    elif kind == "br":
        tgt = i + r.randint(2, 5)
        body.append([f"        {r.choice(BRANCHES)} x{src()}, x{src()}, {label_for(tgt)}"])
    elif kind == "jal":
        tgt = i + r.randint(2, 4)
        body.append([f"        jal x{dst()}, {label_for(tgt)}"])
    else:   # jalr: jump over exactly one instruction using auipc + addi
        body.append([f"        auipc x{TMP}, 0",
                     f"        addi x{TMP}, x{TMP}, 16",
                     f"        jalr x{dst()}, 0(x{TMP})",
                     f"        addi x{r.choice(REGS)}, x{r.choice(REGS)}, 1"])

for i, chunk in enumerate(body):
    if i in targets:
        lines.append(f"{targets[i]}:")
    lines.extend(chunk)
for t, name in sorted(targets.items()):
    if t >= slots:
        lines.append(f"{name}:")          # all targets past the end land here
lines.append("        ebreak")
open(out, "w").write("\n".join(lines) + "\n")
print(f"wrote {out}: {slots} slots")
