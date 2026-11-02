#!/bin/sh
# Usage: ./build.sh mytest.S   ->  produces mytest.mem
# Needs a RISC-V GCC (e.g. apt install gcc-riscv64-unknown-elf)
set -e
name="${1%.S}"
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -nostartfiles \
    -Wl,-Ttext=0 -Wl,--no-relax -o "$name.elf" "$1"
riscv64-unknown-elf-objcopy -O binary "$name.elf" "$name.bin"
python3 - "$name" << 'PY'
import sys
n = sys.argv[1]
d = open(n + ".bin", "rb").read()
d += b"\0" * (-len(d) % 4)
with open(n + ".mem", "w") as f:
    for i in range(0, len(d), 4):
        f.write("%08X\n" % int.from_bytes(d[i:i+4], "little"))
PY
rm -f "$name.elf" "$name.bin"
echo "wrote $name.mem"
