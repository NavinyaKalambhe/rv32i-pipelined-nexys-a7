# hazard_test.S - directed pipeline hazard tests. Self-checking.
# LED = 0xAAAA when everything passes, otherwise LED = number of the failing test.
        .macro CHECK reg, val, code
        li   x31, \val
        beq  \reg, x31, 1f
        li   x30, \code
        j    fail
1:
        .endm

        .globl _start
_start:
        li   x10, 0x10000000          # I/O base
        li   x20, 0x200               # scratch RAM base

        # 1: forwarding from EX/MEM (distance 1)
        li   x1, 5
        addi x2, x1, 1
        addi x3, x2, 1
        CHECK x3, 7, 1
        # 2: forwarding from MEM/WB (distance 2)
        li   x1, 10
        li   x5, 0
        add  x2, x1, x1
        CHECK x2, 20, 2
        # 3: register file write-through (distance 3)
        li   x1, 3
        li   x5, 0
        li   x6, 0
        add  x2, x1, x1
        CHECK x2, 6, 3
        # 4: operands forwarded from different stages
        li   x1, 4
        li   x2, 6
        add  x3, x1, x2
        CHECK x3, 10, 4
        # 5: newest write wins
        li   x1, 1
        li   x1, 2
        add  x2, x1, x1
        CHECK x2, 4, 5
        # 6: x0 must never be forwarded
        li   x1, 2
        addi x0, x1, 5
        add  x2, x0, x0
        CHECK x2, 0, 6
        # 7: load-use stall
        li   x1, 0x1234
        sw   x1, 0(x20)
        lw   x2, 0(x20)
        addi x3, x2, 1
        CHECK x3, 0x1235, 7
        # 8: load result used as store data
        lw   x2, 0(x20)
        sw   x2, 4(x20)
        lw   x4, 4(x20)
        CHECK x4, 0x1234, 8
        # 9: load result used as load address
        li   x1, 0x204
        sw   x1, 8(x20)
        li   x5, 0x55
        sw   x5, 4(x20)
        lw   x3, 8(x20)
        lw   x4, 0(x3)
        CHECK x4, 0x55, 9
        # 10: load feeding a branch
        li   x3, 0x1234
        lw   x2, 0(x20)
        beq  x2, x3, 1f
        li   x30, 10
        j    fail
1:
        # 11: taken branch flushes the wrong path
        li   x1, 1
        beq  x0, x0, 2f
        li   x1, 99
        li   x1, 98
2:      CHECK x1, 1, 11
        # 12: not-taken branch falls through
        li   x1, 1
        bne  x0, x0, 3f
        addi x1, x1, 1
3:      CHECK x1, 2, 12
        # 13: JAL flush and link value
        li   x2, 0
        auipc x3, 0
        jal  x1, 4f
        li   x2, 99
4:      sub  x4, x1, x3
        CHECK x4, 8, 13
        CHECK x2, 0, 14
        # 15: JALR flush and link value
        li   x2, 0
        la   x5, 5f
        jalr x1, 0(x5)
        li   x2, 99
5:      CHECK x2, 0, 15
        # 16: tight loop with a dependent branch
        li   x1, 0
        li   x2, 3
6:      addi x1, x1, 1
        bne  x1, x2, 6b
        CHECK x1, 3, 16
        # 17: long dependency chain
        li   x1, 1
        add  x1, x1, x1
        add  x1, x1, x1
        add  x1, x1, x1
        add  x1, x1, x1
        CHECK x1, 16, 17
        # 18: store followed by load of the same address
        li   x1, 0x77
        sw   x1, 12(x20)
        lw   x2, 12(x20)
        CHECK x2, 0x77, 18
        # 19: LUI + ADDI forwarding
        lui  x1, 0x12345
        addi x2, x1, 0x678
        CHECK x2, 0x12345678, 19
        # 20/21: byte store and loads
        li   x1, 0xFF
        sb   x1, 16(x20)
        lb   x2, 16(x20)
        CHECK x2, -1, 20
        lbu  x3, 16(x20)
        CHECK x3, 255, 21
        # 22: load immediately after load to the same register
        li   x1, 0x111
        sw   x1, 20(x20)
        lw   x2, 20(x20)
        lw   x2, 20(x20)
        addi x3, x2, 1
        CHECK x3, 0x112, 22
        # 23: back-to-back taken branches
        li   x1, 0
        beq  x0, x0, 7f
        li   x1, 50
7:      beq  x0, x0, 8f
        li   x1, 60
8:      CHECK x1, 0, 23
        # 24: FENCE is a NOP
        li   x1, 9
        fence
        addi x1, x1, 1
        CHECK x1, 10, 24

pass:   li   x1, 0xAAAA
        sw   x1, 0(x10)
        j    pass
fail:   sw   x30, 0(x10)
        j    fail
