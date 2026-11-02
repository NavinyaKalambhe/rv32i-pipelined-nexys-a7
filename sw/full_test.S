        .globl _start
_start:
        li   x10, 0x10000000
        li   x1, 10
        li   x2, 3
        sub  x3, x1, x2
        li   x4, 7
        bne  x3, x4, fail
        li   x1, -16
        srai x3, x1, 2
        li   x4, -4
        bne  x3, x4, fail
        srli x3, x1, 28
        li   x4, 15
        bne  x3, x4, fail
        slli x3, x2, 4
        li   x4, 48
        bne  x3, x4, fail
        li   x1, -1
        li   x2, 1
        slt  x3, x1, x2
        li   x4, 1
        bne  x3, x4, fail
        sltu x3, x1, x2
        bne  x3, x0, fail
        li   x1, 0xF0F0
        li   x2, 0x0FF0
        and  x3, x1, x2
        li   x4, 0xF0
        bne  x3, x4, fail
        or   x3, x1, x2
        li   x4, 0xFFF0
        bne  x3, x4, fail
        xor  x3, x1, x2
        li   x4, 0xFF00
        bne  x3, x4, fail
        li   x5, 0x100
        li   x1, 0x80
        sb   x1, 1(x5)
        lb   x3, 1(x5)
        li   x4, -128
        bne  x3, x4, fail
        lbu  x3, 1(x5)
        li   x4, 128
        bne  x3, x4, fail
        li   x1, 0x8001
        sh   x1, 2(x5)
        lh   x3, 2(x5)
        li   x4, 0xFFFF8001
        bne  x3, x4, fail
        lhu  x3, 2(x5)
        li   x4, 0x8001
        bne  x3, x4, fail
        lw   x3, 0(x5)
        li   x4, 0x80018000
        bne  x3, x4, fail
        li   x6, 0
        jal  x1, func
        li   x4, 1
        bne  x6, x4, fail
        j    next
func:   li   x6, 1
        jalr x0, 0(x1)
next:   auipc x3, 0
        auipc x4, 0
        sub  x4, x4, x3
        li   x5, 4
        bne  x4, x5, fail
        li   x1, -1
        li   x2, 1
        blt  x1, x2, ok1
        j    fail
ok1:    bltu x2, x1, ok2
        j    fail
ok2:    bge  x2, x1, ok3
        j    fail
ok3:    bgeu x1, x2, ok4
        j    fail
ok4:    beq  x1, x1, ok5
        j    fail
ok5:    lui  x3, 0x12345
        li   x4, 0x12345000
        bne  x3, x4, fail
pass:   li   x1, 0xAAAA
        sw   x1, 0(x10)
        j    pass
fail:   li   x1, 1
        sw   x1, 0(x10)
        j    fail
