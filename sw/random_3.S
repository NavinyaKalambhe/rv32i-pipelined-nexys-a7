        .globl _start
_start:
        li x20, 0x200
        li x1, 0
        li x2, 1
        li x3, -1
        li x4, 2147483647
        li x5, -2147483648
        li x6, 305419896
        li x7, -305419896
        li x8, 255
        li x9, 32768
        li x10, 189963082
        li x11, 446333181
        li x12, 1449418665
        li x13, -1141039821
        li x14, -101562192
        li x15, -1500591035
        sw x1, 0(x20)
        sw x2, 4(x20)
        sw x3, 8(x20)
        sw x4, 12(x20)
        sw x5, 16(x20)
        sw x6, 20(x20)
        sw x7, 24(x20)
        sw x8, 28(x20)
        sw x9, 32(x20)
        sw x10, 36(x20)
        sw x11, 40(x20)
        sw x12, 44(x20)
        sw x13, 48(x20)
        sw x14, 52(x20)
        sw x15, 56(x20)
        lw x11, 196(x20)
        sb x11, 21(x20)
        sh x11, 242(x20)
        lhu x10, 202(x20)
        addi x0, x12, -1
        jal x14, L8
        and x4, x10, x14
        blt x6, x11, L9
L8:
        jal x12, L12
L9:
        lw x2, 136(x20)
        addi x2, x0, 0
        add x10, x4, x2
L12:
        ori x1, x9, 0
        and x12, x2, x10
        srl x14, x11, x10
        srai x13, x4, 17
        sltiu x5, x8, 0
        sw x5, 160(x20)
        lui x6, 977798
        andi x10, x9, -1
        xor x13, x10, x6
        xori x14, x10, -1
        slli x11, x9, 27
        lb x6, 52(x20)
        lbu x3, 224(x20)
        sltu x2, x7, x15
        sltu x14, x11, x6
        lw x7, 176(x20)
        srl x10, x9, x7
        slti x0, x5, 0
        sw x14, 144(x20)
        beq x2, x10, L35
        srai x0, x7, 30
        sb x14, 153(x20)
        slli x5, x10, 30
L35:
        sb x7, 180(x20)
        slli x15, x6, 8
        sb x13, 249(x20)
        add x13, x5, x14
        sb x5, 64(x20)
        xor x2, x3, x15
        sltiu x6, x10, 1
        slli x1, x13, 23
        andi x10, x13, -1
        lh x7, 214(x20)
        sltiu x2, x7, 2047
        sltu x12, x7, x2
        and x13, x13, x11
        lui x13, 815107
        sll x6, x12, x13
        beq x0, x10, L52
        auipc x0, 499762
L52:
        sll x4, x2, x6
        auipc x16, 0
        addi x16, x16, 16
        jalr x8, 0(x16)
        addi x10, x12, 1
        sh x4, 128(x20)
        jal x2, L59
        andi x7, x8, 1914
        addi x8, x6, 1
        or x5, x8, x2
L59:
        lhu x5, 136(x20)
        xor x8, x5, x5
        sb x0, 214(x20)
        lbu x15, 239(x20)
        sw x15, 12(x20)
        slt x13, x2, x5
        lbu x4, 130(x20)
        sb x2, 95(x20)
        bne x11, x15, L71
        sb x13, 60(x20)
        add x7, x4, x1
        ori x8, x7, -2048
L71:
        andi x8, x3, -2048
        jal x6, L75
        sh x8, 134(x20)
        lw x9, 56(x20)
L75:
        andi x11, x6, -1
        beq x11, x9, L81
        lw x11, 212(x20)
        sll x9, x9, x4
        lui x5, 804005
        or x6, x9, x11
L81:
        jal x13, L84
        sub x10, x5, x13
        sw x6, 56(x20)
L84:
        auipc x12, 269434
        lui x4, 357210
        lui x13, 614501
        xor x10, x14, x13
        andi x15, x10, -2048
        sra x11, x4, x8
        slti x0, x11, -2048
        and x1, x5, x10
        xori x15, x15, -1
        beq x2, x11, L96
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x14, x4, 1
        sltiu x1, x0, -45
L96:
        or x4, x2, x15
        lh x13, 10(x20)
        lhu x1, 92(x20)
        lh x6, 188(x20)
        lui x0, 438294
        slt x0, x1, x13
        auipc x3, 230832
        lhu x14, 250(x20)
        add x1, x3, x14
        slti x8, x3, -1
        lh x13, 62(x20)
        sh x10, 238(x20)
        srli x6, x1, 20
        sub x0, x3, x8
        or x4, x8, x8
        blt x12, x2, L116
        addi x3, x13, -2048
        xori x12, x3, 1
        xori x8, x4, 4
        sll x13, x13, x2
L116:
        xor x14, x13, x4
        sb x14, 24(x20)
        lh x7, 0(x20)
        sb x13, 173(x20)
        slti x3, x7, 0
        or x10, x8, x14
        xori x2, x7, -2048
        sub x7, x7, x9
        srl x8, x4, x12
        sh x7, 226(x20)
        xor x8, x7, x3
        sw x8, 184(x20)
        xor x8, x7, x7
        slt x12, x8, x7
        lw x4, 212(x20)
        bge x14, x4, L136
        beq x8, x8, L136
        slt x7, x4, x8
        sll x5, x12, x10
        beq x7, x10, L140
L136:
        auipc x16, 0
        addi x16, x16, 16
        jalr x15, 0(x16)
        addi x11, x6, 1
        jal x8, L140
        sltiu x5, x8, 2047
        andi x13, x8, 1
L140:
        lbu x1, 10(x20)
        or x0, x15, x13
        and x2, x13, x2
        xori x5, x2, 0
        ori x3, x6, -2048
        add x15, x2, x3
        ori x9, x15, 1
        sra x13, x9, x15
        sll x7, x13, x9
        srai x1, x13, 20
        auipc x5, 561287
        sra x15, x12, x1
        sltiu x0, x13, -1
        addi x5, x5, 2047
        sub x14, x5, x4
        bgeu x5, x15, L159
        sll x15, x15, x5
        lhu x3, 202(x20)
        slti x11, x3, 0
L159:
        srli x7, x15, 24
        sltu x6, x3, x3
        jal x4, L165
        sub x15, x7, x8
        srli x0, x11, 22
        srai x9, x15, 19
L165:
        slti x5, x15, 12
        blt x15, x5, L169
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x3, x2, 1
        lui x7, 784752
L169:
        srli x8, x3, 20
        xor x10, x11, x8
        andi x5, x12, 1
        sltu x5, x5, x8
        slti x9, x5, 0
        sltiu x14, x9, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x4, 0(x16)
        addi x1, x9, 1
        srli x6, x4, 0
        sub x3, x4, x6
        ori x0, x4, -1
        ori x6, x4, 29
        lbu x10, 225(x20)
        sltu x4, x13, x3
        srl x0, x6, x10
        bge x10, x4, L186
        xori x11, x10, 2047
        beq x11, x4, L189
L186:
        lb x15, 169(x20)
        auipc x7, 185509
        sub x14, x7, x7
L189:
        sltiu x8, x13, -2048
        and x6, x5, x14
        sw x6, 104(x20)
        xori x4, x14, 2047
        sll x6, x13, x11
        srai x7, x6, 23
        sltiu x12, x6, 1
        slt x11, x12, x7
        ori x9, x11, 1429
        sra x0, x12, x15
        srl x8, x11, x8
        slti x7, x0, -2048
        sltiu x9, x9, -1
        slli x12, x9, 19
        auipc x6, 860165
        beq x6, x12, L208
        slti x4, x9, -1
        srli x7, x4, 29
        add x12, x7, x7
L208:
        or x7, x4, x12
        bge x12, x12, L213
        xor x5, x7, x0
        ori x4, x9, -1
        sw x4, 172(x20)
L213:
        beq x5, x7, L216
        addi x5, x6, 31
        andi x13, x5, -1
L216:
        slli x0, x5, 10
        ori x4, x4, 0
        lw x3, 180(x20)
        sltu x9, x3, x3
        sltiu x10, x6, 0
        or x10, x10, x9
        addi x12, x9, 0
        sub x0, x10, x12
        xor x8, x12, x12
        slti x7, x12, 2047
        andi x5, x7, 2047
        sltu x10, x8, x5
        ori x11, x7, 1
        sw x11, 48(x20)
        jal x3, L232
        sltiu x5, x10, 2047
L232:
        sra x1, x14, x11
        lhu x0, 6(x20)
        lh x13, 240(x20)
        ori x11, x13, -1689
        or x3, x11, x11
        sra x7, x1, x11
        lh x6, 200(x20)
        lui x12, 541322
        sw x7, 128(x20)
        lhu x4, 214(x20)
        lw x10, 28(x20)
        sll x8, x4, x12
        xor x13, x11, x4
        sltiu x3, x13, -14
        auipc x2, 841112
        ori x4, x2, 0
        lbu x15, 11(x20)
        lb x9, 70(x20)
        beq x15, x4, L252
        bne x9, x14, L256
L252:
        srli x10, x1, 21
        sltiu x4, x15, -2
        xor x13, x8, x3
        or x14, x13, x1
L256:
        blt x3, x12, L259
        sra x1, x4, x4
        srli x9, x1, 12
L259:
        andi x7, x1, 24
        lw x2, 120(x20)
        lb x6, 12(x20)
        addi x6, x2, -1
        lui x12, 917975
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x2, x13, 1
        slt x7, x0, x1
        ori x10, x1, 0
        slti x2, x6, -628
        sh x2, 160(x20)
        srl x11, x10, x2
        sh x1, 178(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x15, 0(x16)
        addi x11, x9, 1
        sb x7, 46(x20)
        beq x1, x2, L277
        lb x15, 63(x20)
        lh x10, 226(x20)
        slti x11, x15, -9
L277:
        lui x8, 860299
        lbu x5, 155(x20)
        slt x12, x11, x8
        slli x2, x5, 11
        bltu x2, x5, L285
        beq x12, x5, L286
        lhu x8, 128(x20)
        srli x12, x7, 4
L285:
        sh x7, 202(x20)
L286:
        bltu x9, x2, L289
        jal x8, L291
        lb x4, 148(x20)
L289:
        sw x8, 48(x20)
        sll x10, x4, x8
L291:
        lui x8, 719688
        sub x1, x4, x8
        and x8, x8, x8
        lw x0, 28(x20)
        slli x9, x11, 15
        ori x8, x12, 0
        andi x10, x8, 2047
        addi x1, x9, 44
        xor x15, x10, x10
        lhu x12, 10(x20)
        auipc x14, 803691
        slti x15, x14, -2048
        or x14, x12, x14
        sltiu x13, x13, 1
        ori x13, x13, -1
        bgeu x13, x13, L311
        srai x5, x13, 12
        slt x6, x13, x7
        bge x13, x4, L313
        srai x7, x1, 2
L311:
        jal x5, L315
        ori x15, x5, 57
L313:
        sh x7, 132(x20)
        lw x14, 244(x20)
L315:
        addi x7, x0, -1
        ori x2, x7, 0
        lhu x2, 58(x20)
        blt x8, x2, L322
        beq x1, x2, L324
        sub x9, x7, x2
        slti x15, x11, 0
L322:
        sll x2, x10, x7
        lb x3, 248(x20)
L324:
        add x4, x2, x3
        lh x3, 34(x20)
        lb x13, 229(x20)
        slt x7, x4, x11
        jal x4, L331
        srai x10, x7, 10
        srl x0, x9, x4
L331:
        andi x2, x14, -57
        jal x10, L334
        sh x15, 240(x20)
L334:
        and x1, x4, x12
        jal x0, L338
        add x14, x10, x0
        sltiu x14, x2, 835
L338:
        sh x14, 152(x20)
        andi x8, x1, -1
        jal x12, L344
        slli x12, x8, 25
        andi x3, x10, 1
        and x12, x12, x14
L344:
        ori x5, x3, 0
        sltu x4, x14, x12
        xori x2, x4, 1
        lh x10, 10(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x2, x3, 1
        lui x0, 1003166
        xori x3, x10, 32
        andi x11, x10, 1008
        auipc x15, 728136
        lh x11, 184(x20)
        bge x11, x11, L358
        lb x1, 129(x20)
        srl x0, x0, x1
        bge x5, x8, L361
L358:
        slt x4, x4, x15
        lh x1, 228(x20)
        addi x14, x11, 1
L361:
        bne x12, x1, L365
        bge x4, x4, L365
        bge x14, x1, L366
        slli x15, x4, 15
L365:
        and x12, x7, x15
L366:
        auipc x16, 0
        addi x16, x16, 16
        jalr x6, 0(x16)
        addi x11, x6, 1
        sb x6, 38(x20)
        sltiu x0, x12, -1
        srli x15, x6, 6
        bgeu x0, x6, L373
        addi x2, x6, -1
        lb x10, 170(x20)
L373:
        sll x11, x10, x2
        sltu x7, x11, x7
        bge x7, x7, L377
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x9, x1, 1
L377:
        srli x7, x7, 4
        bgeu x7, x6, L380
        bne x7, x7, L384
L380:
        ori x11, x7, -24
        slti x4, x3, 0
        slti x13, x0, 0
        and x10, x13, x15
L384:
        lb x6, 254(x20)
        sltu x8, x13, x13
        ori x3, x10, 2047
        sh x8, 250(x20)
        sll x8, x8, x11
        sra x5, x8, x8
        lhu x8, 192(x20)
        lw x7, 24(x20)
        slli x6, x5, 4
        xor x12, x6, x9
        and x14, x12, x6
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x10, x12, 1
        or x8, x6, x7
        lhu x11, 154(x20)
        srai x14, x8, 22
        lw x6, 96(x20)
        and x15, x9, x14
        lb x7, 41(x20)
        lhu x15, 226(x20)
        slti x2, x7, 0
        bge x2, x11, L408
        sra x12, x7, x2
        lui x7, 751788
        sb x8, 253(x20)
L408:
        bne x3, x9, L411
        sh x5, 152(x20)
        srli x12, x2, 29
L411:
        slt x15, x12, x3
        sub x13, x12, x2
        addi x2, x11, -1940
        lui x2, 751204
        bge x13, x2, L417
        lb x6, 1(x20)
L417:
        ori x5, x13, -2048
        xor x4, x15, x5
        andi x4, x4, -2048
        and x12, x13, x5
        xor x12, x14, x12
        beq x14, x4, L427
        sltiu x13, x4, -1
        xori x10, x13, -1
        slti x5, x13, 1186
        lh x9, 8(x20)
L427:
        srli x5, x10, 17
        sw x0, 48(x20)
        srai x14, x10, 1
        sra x3, x14, x12
        slti x5, x14, 2047
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x10, x3, 1
        andi x7, x8, -1
        lbu x14, 23(x20)
        auipc x10, 705457
        sltu x2, x4, x0
        bne x2, x14, L439
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x7, x8, 1
L439:
        sra x8, x10, x12
        bltu x12, x13, L444
        sll x0, x2, x12
        sb x1, 92(x20)
        jal x4, L445
L444:
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x5, x2, 1
L445:
        srai x9, x10, 1
        lui x4, 824565
        srli x8, x10, 24
        xor x4, x4, x7
        and x2, x4, x4
        sltu x5, x2, x6
        addi x4, x2, -1
        srli x9, x10, 1
        addi x11, x4, -1
        and x2, x4, x4
        sb x11, 142(x20)
        auipc x12, 89206
        lh x15, 234(x20)
        srl x11, x6, x15
        lw x3, 228(x20)
        bne x0, x7, L463
        sltu x1, x8, x11
        srl x6, x1, x14
L463:
        sw x3, 228(x20)
        sltiu x0, x5, -1
        sh x3, 58(x20)
        sltu x13, x7, x1
        auipc x3, 97755
        blt x3, x13, L472
        srai x2, x8, 11
        jal x11, L473
        lh x12, 222(x20)
L472:
        addi x12, x2, -2048
L473:
        lbu x12, 229(x20)
        beq x12, x12, L476
        sh x10, 94(x20)
L476:
        sh x12, 182(x20)
        andi x10, x11, 2047
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x8, x5, 1
        sb x14, 91(x20)
        jal x11, L482
        blt x10, x10, L486
L482:
        jal x7, L485
        andi x1, x5, -2048
        sll x15, x11, x8
L485:
        andi x11, x15, 271
L486:
        slti x7, x1, -1
        auipc x7, 197326
        sltiu x11, x8, 0
        sll x5, x7, x7
        blt x7, x5, L495
        srl x4, x2, x4
        srai x8, x11, 8
        sw x5, 152(x20)
        lui x4, 783534
L495:
        sra x8, x4, x4
        bne x13, x6, L498
        lb x1, 241(x20)
L498:
        xor x13, x4, x0
        lhu x7, 12(x20)
        auipc x10, 1034933
        slt x8, x12, x14
        jal x8, L505
        slli x6, x10, 24
        slt x14, x8, x8
L505:
        sub x1, x8, x8
        bltu x6, x11, L509
        slli x7, x3, 18
        srl x8, x15, x11
L509:
        sub x4, x7, x6
        lw x8, 52(x20)
        sll x14, x2, x8
        sub x14, x8, x6
        xor x7, x12, x14
        sb x14, 3(x20)
        slti x15, x14, -1
        beq x15, x15, L520
        lh x8, 220(x20)
        jal x0, L521
        addi x12, x15, 0
L520:
        andi x15, x15, -2048
L521:
        xor x0, x8, x8
        bne x7, x15, L525
        sltiu x11, x3, -53
        sra x4, x11, x0
L525:
        lh x14, 240(x20)
        slti x11, x7, 5
        slti x13, x4, -1
        jal x5, L532
        lui x4, 998358
        sltu x4, x4, x13
        jal x6, L533
L532:
        srai x5, x12, 27
L533:
        ori x10, x4, 217
        sra x15, x10, x10
        add x8, x15, x6
        slli x6, x10, 7
        bne x8, x9, L541
        slt x0, x8, x15
        jal x13, L541
        or x2, x6, x6
L541:
        and x1, x2, x6
        sltiu x15, x8, -47
        sltu x8, x1, x2
        and x14, x15, x8
        xor x15, x11, x4
        sh x11, 106(x20)
        sh x8, 240(x20)
        jal x12, L550
        sll x4, x12, x2
L550:
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x12, x12, 1
        sub x7, x12, x5
        beq x7, x4, L556
        sb x4, 222(x20)
        blt x5, x7, L556
        sb x6, 25(x20)
L556:
        srl x13, x10, x3
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x12, x7, 1
        lui x1, 939114
        lui x2, 595111
        bne x2, x10, L563
        blt x1, x0, L564
        lh x13, 2(x20)
L563:
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x4, x8, 1
L564:
        blt x2, x4, L566
        sw x2, 24(x20)
L566:
        sltiu x14, x2, 2047
        addi x7, x13, 291
        slti x1, x7, 0
        bltu x7, x7, L573
        blt x14, x1, L572
        sltiu x9, x14, 2047
L572:
        sw x1, 28(x20)
L573:
        blt x1, x7, L577
        slti x13, x9, 14
        slli x3, x13, 24
        sw x3, 28(x20)
L577:
        lhu x12, 170(x20)
        xori x7, x12, -206
        bne x12, x8, L584
        sw x3, 108(x20)
        bge x7, x7, L586
        sll x1, x14, x12
        sh x8, 134(x20)
L584:
        xori x4, x7, -1
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x12, x8, 1
L586:
        srli x8, x10, 15
        xor x11, x8, x10
        add x5, x9, x10
        blt x8, x5, L593
        sltu x6, x11, x11
        add x5, x5, x10
        lw x14, 112(x20)
L593:
        ori x4, x8, -245
        srai x10, x14, 21
        and x1, x12, x8
        slti x3, x10, -2048
        sb x1, 156(x20)
        jal x4, L602
        slli x2, x4, 14
        addi x9, x2, -2048
        srai x13, x3, 2
L602:
        srl x2, x9, x2
        slti x8, x10, 1411
        jal x2, L606
        sra x2, x15, x2
L606:
        and x12, x8, x8
        lbu x5, 5(x20)
        blt x15, x14, L613
        jal x4, L612
        sra x12, x4, x12
        blt x4, x4, L613
L612:
        sll x2, x5, x12
L613:
        and x11, x12, x4
        blt x11, x6, L616
        slt x2, x2, x12
L616:
        lui x4, 698074
        lh x12, 10(x20)
        xor x5, x4, x6
        slli x6, x4, 11
        slti x1, x5, 56
        sb x13, 16(x20)
        add x15, x6, x1
        bgeu x15, x15, L626
        beq x6, x6, L626
        sll x12, x15, x1
L626:
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x11, x11, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x1, x2, 1
        xor x1, x12, x12
        slt x6, x1, x11
        or x12, x6, x6
        lbu x6, 138(x20)
        srl x7, x7, x5
        sll x7, x6, x12
        sh x11, 130(x20)
        srai x2, x0, 8
        bgeu x7, x2, L640
        xor x4, x7, x7
        lbu x1, 5(x20)
        srai x9, x12, 24
L640:
        sh x2, 108(x20)
        srli x8, x6, 6
        sh x9, 12(x20)
        sw x1, 28(x20)
        sb x2, 246(x20)
        slti x7, x13, 0
        bne x8, x9, L650
        bgeu x10, x8, L652
        sb x14, 38(x20)
        sltiu x14, x7, 2047
L650:
        xori x8, x8, 1
        sw x13, 248(x20)
L652:
        xori x9, x6, -1
        and x4, x0, x9
        xor x3, x13, x1
        lbu x7, 6(x20)
        sb x4, 215(x20)
        srli x7, x11, 14
        sub x13, x2, x7
        sltu x1, x7, x7
        lbu x9, 23(x20)
        sltiu x9, x9, 2047
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x14, x13, 1
        jal x6, L667
        slt x13, x9, x7
        slli x5, x4, 30
        andi x3, x6, 2047
L667:
        slt x13, x15, x2
        sra x7, x5, x13
        andi x8, x4, -1
        beq x12, x13, L674
        xori x5, x12, -2048
        lhu x9, 112(x20)
        xori x11, x5, -1
L674:
        auipc x16, 0
        addi x16, x16, 16
        jalr x13, 0(x16)
        addi x6, x2, 1
        sra x4, x6, x13
        sltu x10, x8, x11
        add x14, x4, x4
        bgeu x4, x4, L682
        srli x14, x0, 4
        sb x10, 47(x20)
        or x12, x11, x10
L682:
        sltiu x9, x12, 1
        lui x3, 470164
        srl x11, x7, x9
        lbu x4, 130(x20)
        sll x13, x4, x4
        slt x1, x7, x11
        sltu x6, x7, x13
        jal x4, L693
        bltu x0, x6, L695
        sb x1, 112(x20)
        slti x5, x12, -2048
L693:
        srai x14, x6, 13
        sh x5, 38(x20)
L695:
        addi x10, x1, -2048
        bne x9, x10, L698
        sb x5, 5(x20)
L698:
        bne x15, x14, L702
        ori x10, x1, -1
        addi x6, x10, 3
        sb x0, 132(x20)
L702:
        bne x6, x10, L704
        xori x5, x6, -1
L704:
        ori x4, x6, 1
        lui x4, 214814
        bne x4, x5, L711
        beq x12, x4, L710
        jal x3, L712
        blt x14, x3, L712
L710:
        addi x2, x4, 2047
L711:
        srl x3, x4, x3
L712:
        ori x15, x2, -27
        sll x9, x14, x5
        add x4, x15, x9
        sra x2, x9, x4
        sh x4, 236(x20)
        lui x14, 450185
        sra x6, x2, x11
        beq x13, x14, L722
        srai x3, x2, 31
        jal x5, L724
L722:
        sltiu x2, x3, 1
        lh x6, 76(x20)
L724:
        lbu x1, 231(x20)
        beq x4, x9, L729
        lh x6, 224(x20)
        slti x5, x6, 1
        xori x4, x11, 1
L729:
        or x9, x14, x6
        and x15, x9, x4
        sra x7, x4, x9
        slt x11, x10, x15
        ori x6, x15, -2048
        sll x1, x7, x7
        srl x13, x3, x6
        andi x0, x6, -1
        slti x9, x0, 0
        add x3, x6, x9
        slt x1, x6, x9
        sltiu x8, x9, 0
        auipc x16, 0
        addi x16, x16, 16
        jalr x13, 0(x16)
        addi x11, x10, 1
        addi x7, x8, 1460
        slt x7, x8, x7
        bne x10, x5, L747
        andi x0, x13, 1
        sltiu x13, x0, 0
L747:
        lh x14, 12(x20)
        lbu x14, 130(x20)
        srai x8, x14, 6
        slli x9, x14, 25
        sw x8, 88(x20)
        sltiu x6, x0, 0
        ori x11, x2, 1
        lh x13, 94(x20)
        lh x1, 182(x20)
        or x11, x11, x13
        srl x2, x1, x11
        sra x15, x1, x11
        lh x15, 82(x20)
        srai x11, x15, 29
        srai x7, x15, 3
        lh x0, 214(x20)
        add x2, x13, x11
        lbu x2, 110(x20)
        bge x2, x2, L767
        sll x3, x2, x2
L767:
        sb x2, 68(x20)
        lw x1, 236(x20)
        sb x3, 138(x20)
        or x11, x2, x2
        sll x7, x3, x11
        bltu x15, x11, L776
        bge x1, x1, L777
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x6, x6, 1
        slti x1, x7, 2047
L776:
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x4, x13, 1
L777:
        srl x1, x12, x12
        sll x9, x1, x10
        jal x3, L783
        lb x5, 110(x20)
        sltu x1, x12, x6
        sltu x6, x8, x2
L783:
        xor x3, x6, x13
        and x3, x1, x6
        bgeu x6, x6, L789
        lh x2, 136(x20)
        and x9, x3, x6
        srl x13, x9, x3
L789:
        sb x14, 229(x20)
        sh x2, 246(x20)
        lh x10, 26(x20)
        lw x1, 140(x20)
        beq x10, x13, L798
        jal x6, L798
        slt x13, x1, x6
        add x12, x4, x3
        slt x14, x7, x2
L798:
        jal x7, L800
        xori x8, x6, 0
L800:
        jal x6, L802
        lhu x9, 46(x20)
L802:
        srl x13, x10, x8
        srl x3, x1, x0
        jal x1, L807
        bgeu x1, x3, L807
        lbu x2, 252(x20)
L807:
        lw x1, 36(x20)
        or x10, x15, x1
        sra x15, x2, x1
        sltu x4, x10, x15
        andi x7, x10, -2048
        andi x4, x9, 1
        srli x1, x4, 21
        xor x1, x0, x2
        bltu x1, x7, L820
        srai x11, x4, 19
        sub x7, x1, x1
        andi x2, x1, 2046
        sll x7, x1, x4
L820:
        sb x9, 6(x20)
        lhu x9, 176(x20)
        andi x0, x15, -1488
        srl x7, x7, x7
        srai x1, x9, 26
        slt x7, x7, x5
        sltiu x1, x0, -2048
        sw x8, 28(x20)
        slti x8, x1, 1
        add x6, x0, x10
        and x2, x7, x6
        sra x7, x2, x2
        sll x13, x1, x6
        add x14, x13, x13
        lui x8, 790766
        jal x2, L839
        sll x9, x2, x14
        srl x11, x9, x4
        sb x14, 49(x20)
L839:
        sltu x12, x11, x6
        lh x13, 116(x20)
        lui x15, 625919
        andi x4, x7, -1
        addi x4, x4, 207
        sra x12, x4, x15
        andi x9, x4, -2048
        or x14, x12, x9
        addi x12, x9, -2048
        sb x12, 235(x20)
        sra x1, x9, x14
        auipc x16, 0
        addi x16, x16, 16
        jalr x15, 0(x16)
        addi x1, x9, 1
        slti x9, x1, -1742
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x1, x5, 1
        srl x6, x4, x15
        or x10, x9, x6
        ori x15, x6, -1
        sltu x8, x10, x15
        jal x12, L859
        auipc x16, 0
        addi x16, x16, 16
        jalr x13, 0(x16)
        addi x9, x14, 1
L859:
        sltiu x8, x13, -2048
        slt x7, x7, x13
        jal x13, L864
        xor x13, x5, x8
        ori x10, x13, 1
L864:
        andi x2, x13, 44
        sb x10, 53(x20)
        and x5, x13, x11
        lbu x6, 153(x20)
        lw x13, 24(x20)
        srai x0, x8, 21
        bgeu x14, x5, L875
        bgeu x13, x15, L873
        sh x13, 220(x20)
L873:
        bltu x6, x5, L878
        sw x6, 8(x20)
L875:
        sb x13, 254(x20)
        srli x9, x3, 23
        xori x6, x6, -1
L878:
        bltu x5, x9, L883
        sh x9, 184(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x9, 0(x16)
        addi x4, x10, 1
        bgeu x4, x9, L886
        xor x6, x11, x6
L883:
        srli x9, x2, 13
        beq x7, x6, L889
        sltu x0, x6, x9
L886:
        srl x15, x3, x8
        add x1, x6, x15
        sra x4, x15, x1
L889:
        andi x9, x1, 1
        sb x1, 143(x20)
        or x3, x4, x4
        srli x13, x3, 21
        slti x1, x13, 12
        beq x1, x3, L898
        xor x10, x3, x5
        auipc x2, 906691
        slt x12, x11, x2
L898:
        bltu x0, x12, L903
        ori x12, x0, 0
L903:
        ebreak
