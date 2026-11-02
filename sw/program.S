# program.S - demo for the single-cycle core (RARS / Venus compatible)
# Sums 1..10 (= 55), writes it to the LEDs and RAM, then forever shows
# (switches + 55) on the LEDs.
        .globl _start
_start:
        addi x1, x0, 0          # sum = 0
        addi x2, x0, 1          # i = 1
        addi x3, x0, 11         # limit
loop:   add  x1, x1, x2         # sum += i
        addi x2, x2, 1          # i++
        bne  x2, x3, loop
        lui  x4, 0x10000        # x4 = 0x10000000 (I/O base)
        sw   x1, 0(x4)          # LEDs = 55
        sw   x1, 0(x0)          # RAM[0] = 55
        lw   x5, 0(x0)          # x5 = RAM[0]
show:   lw   x6, 4(x4)          # x6 = switches
        add  x6, x6, x5         # x6 += 55
        sw   x6, 0(x4)          # LEDs = x6
        j    show
