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
        li x10, 1132903364
        li x11, -1051970500
        li x12, -216934237
        li x13, 651086875
        li x14, 1240057366
        li x15, -1744359796
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
        and x1, x13, x14
        lh x2, 116(x20)
        beq x1, x13, L4
        lhu x13, 14(x20)
L4:
        sltiu x4, x1, 0
        slti x12, x4, 380
        ori x11, x14, -1
        auipc x9, 824922
        lui x13, 847853
        andi x12, x13, 2047
        lb x7, 83(x20)
        addi x14, x0, 1
        srai x9, x7, 14
        sltiu x5, x9, 34
        bltu x7, x14, L17
        slti x7, x5, 2047
        ori x10, x7, -1819
L17:
        add x11, x5, x9
        slt x13, x15, x10
        lh x3, 148(x20)
        sra x8, x9, x10
        sltiu x4, x3, -1
        bltu x3, x8, L25
        srl x4, x6, x4
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x9, x8, 1
L25:
        srl x5, x13, x11
        sltu x5, x4, x4
        sh x5, 128(x20)
        bltu x15, x5, L30
        lb x2, 193(x20)
L30:
        sub x7, x14, x5
        sltu x0, x2, x13
        srl x11, x7, x11
        or x9, x11, x11
        or x13, x3, x7
        sltiu x2, x9, -4
        jal x3, L40
        auipc x7, 153497
        slti x10, x5, -2048
        srli x10, x7, 7
L40:
        sltiu x0, x7, 2047
        srl x8, x2, x10
        srl x9, x8, x14
        bltu x8, x10, L47
        lb x0, 13(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x6, x8, 1
        sltiu x8, x8, 1
L47:
        sw x9, 240(x20)
        sltu x13, x9, x9
        slti x5, x11, 1
        slti x9, x10, 1
        sub x0, x13, x13
        sub x13, x12, x13
        slti x3, x13, -1
        sll x12, x3, x9
        sll x9, x12, x7
        sra x9, x8, x3
        xor x8, x9, x9
        add x10, x14, x1
        srl x3, x8, x9
        lbu x0, 248(x20)
        srli x11, x3, 14
        xor x15, x3, x14
        sw x8, 140(x20)
        sll x13, x15, x12
        blt x12, x13, L69
        sw x13, 40(x20)
        sra x12, x11, x2
        lhu x1, 84(x20)
L69:
        srai x12, x12, 5
        jal x10, L72
        bge x8, x13, L73
L72:
        jal x15, L75
L73:
        slti x10, x10, 1296
        or x1, x10, x10
L75:
        sll x9, x8, x7
        sll x8, x1, x15
        ori x4, x1, -37
        sll x6, x9, x4
        lui x6, 678822
        srl x12, x6, x6
        lhu x7, 56(x20)
        andi x15, x12, -2048
        bgeu x10, x15, L88
        lw x1, 100(x20)
        lw x6, 216(x20)
        bge x8, x10, L88
        lhu x15, 78(x20)
L88:
        addi x10, x1, -1
        sh x15, 154(x20)
        sltiu x12, x6, -1
        sub x12, x15, x15
        sltu x12, x12, x12
        bge x12, x12, L97
        lw x12, 136(x20)
        and x4, x12, x12
        and x15, x8, x1
L97:
        slti x12, x9, -2048
        bltu x15, x4, L101
        sw x15, 224(x20)
        srl x15, x10, x4
L101:
        slt x8, x15, x1
        lw x14, 224(x20)
        slt x7, x6, x8
        sb x15, 120(x20)
        srai x8, x14, 7
        beq x14, x11, L108
        bne x8, x14, L111
L108:
        srl x2, x8, x8
        addi x9, x1, -1
        sh x2, 46(x20)
L111:
        lh x7, 98(x20)
        andi x4, x9, -1
        sltiu x9, x2, -415
        sltu x2, x9, x3
        sub x9, x14, x2
        addi x1, x2, 2047
        sh x9, 12(x20)
        add x6, x3, x9
        sh x10, 194(x20)
        or x15, x7, x1
        lui x8, 63477
        bgeu x15, x15, L126
        or x5, x8, x15
        andi x1, x5, -1
        blt x5, x0, L129
L126:
        xori x15, x1, 1
        xor x13, x1, x11
        lhu x6, 156(x20)
L129:
        srli x10, x15, 8
        bge x2, x9, L133
        lbu x10, 133(x20)
        slli x3, x6, 27
L133:
        slt x10, x10, x10
        srli x6, x8, 12
        sw x9, 36(x20)
        xori x8, x6, -2048
        beq x6, x6, L142
        lb x9, 61(x20)
        bltu x10, x9, L143
        jal x11, L144
        lui x8, 294286
L142:
        srli x7, x6, 2
L143:
        andi x0, x7, -41
L144:
        sra x7, x8, x12
        slti x1, x7, -1
        bge x1, x7, L150
        lhu x8, 170(x20)
        sub x3, x13, x3
        srl x3, x8, x1
L150:
        bge x2, x3, L152
        addi x11, x3, -1
L152:
        lbu x12, 245(x20)
        bgeu x13, x11, L156
        sub x10, x11, x11
        bne x12, x10, L158
L156:
        bltu x12, x10, L159
        lh x8, 28(x20)
L158:
        sltu x7, x4, x10
L159:
        add x10, x8, x7
        srli x5, x9, 17
        srli x3, x5, 11
        sw x10, 228(x20)
        srai x15, x10, 13
        addi x3, x3, 0
        lb x4, 88(x20)
        auipc x5, 885552
        ori x12, x10, -209
        lh x9, 136(x20)
        slti x15, x12, -1
        sltu x6, x4, x12
        slt x6, x15, x6
        xor x13, x6, x4
        lbu x11, 138(x20)
        auipc x7, 825797
        and x3, x11, x13
        or x9, x9, x7
        sub x9, x9, x3
        ori x1, x9, 476
        sra x14, x1, x9
        sh x1, 148(x20)
        beq x5, x14, L186
        lw x1, 4(x20)
        bge x4, x14, L186
        lui x7, 851724
        lui x1, 1237
L186:
        sb x7, 71(x20)
        srli x4, x12, 15
        xor x12, x6, x7
        ori x7, x2, 11
        sh x5, 120(x20)
        sra x13, x6, x7
        lw x4, 8(x20)
        xori x2, x6, -1
        lhu x11, 240(x20)
        sw x2, 96(x20)
        slli x7, x2, 26
        srl x13, x2, x15
        sb x4, 78(x20)
        jal x13, L201
        lbu x9, 200(x20)
L201:
        sh x11, 80(x20)
        lb x10, 82(x20)
        or x11, x13, x7
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x13, x8, 1
        sra x0, x13, x10
        srli x12, x1, 26
        or x9, x12, x11
        sw x13, 84(x20)
        sh x7, 142(x20)
        xor x3, x7, x3
        add x3, x9, x9
        jal x13, L214
        auipc x12, 502956
L214:
        auipc x4, 173161
        lb x1, 78(x20)
        or x15, x4, x5
        srl x14, x1, x15
        sltu x14, x1, x14
        and x6, x1, x14
        sh x14, 28(x20)
        srl x4, x6, x4
        sw x4, 200(x20)
        add x13, x5, x9
        sltu x0, x13, x8
        srl x8, x8, x9
        sra x8, x5, x4
        sub x1, x11, x4
        bne x7, x13, L233
        srai x13, x8, 4
        ori x3, x8, 0
        lui x10, 831100
        srl x6, x10, x10
L233:
        addi x10, x0, -2048
        auipc x14, 757032
        ori x1, x1, -1
        addi x10, x1, -1441
        add x15, x1, x10
        slti x7, x15, 43
        ori x12, x15, -1
        sh x12, 144(x20)
        sltu x11, x9, x15
        or x14, x12, x2
        sb x11, 38(x20)
        beq x11, x2, L247
        add x12, x14, x14
        lw x15, 216(x20)
L247:
        sltu x13, x14, x4
        slt x11, x11, x12
        add x0, x2, x11
        sb x11, 88(x20)
        xor x11, x15, x13
        and x8, x13, x10
        andi x11, x11, -1
        and x9, x11, x8
        jal x12, L258
        auipc x8, 346818
        bltu x13, x9, L261
L258:
        xor x8, x9, x15
        srl x1, x8, x5
        lh x9, 4(x20)
L261:
        sh x1, 192(x20)
        slti x6, x2, 1
        sh x8, 208(x20)
        sltu x7, x6, x12
        beq x14, x2, L270
        lbu x7, 124(x20)
        add x11, x7, x12
        slti x0, x11, -2048
        sltiu x2, x0, 2047
L270:
        or x10, x7, x4
        sw x11, 132(x20)
        sltu x15, x10, x11
        add x1, x2, x15
        sra x5, x10, x7
        auipc x3, 441972
        andi x6, x3, 0
        slt x5, x6, x5
        beq x5, x6, L280
        and x4, x6, x2
L280:
        sw x6, 92(x20)
        sltu x9, x3, x8
        andi x4, x5, -1
        andi x7, x13, -1
        bne x4, x10, L286
        blt x4, x4, L289
L286:
        jal x0, L290
        sll x11, x7, x7
        lbu x10, 82(x20)
L289:
        sltu x3, x11, x11
L290:
        slli x2, x4, 11
        andi x11, x10, -2048
        jal x13, L295
        srli x3, x12, 24
        add x14, x3, x7
L295:
        sltiu x4, x13, 1
        sll x2, x14, x14
        ori x9, x2, -2048
        slli x2, x2, 17
        sll x3, x5, x1
        slt x11, x3, x3
        lw x12, 172(x20)
        bne x11, x3, L304
        bltu x11, x11, L308
L304:
        lw x15, 156(x20)
        sb x11, 246(x20)
        xor x5, x11, x11
        blt x14, x10, L311
L308:
        slt x13, x12, x5
        lw x10, 252(x20)
        xor x10, x5, x13
L311:
        lbu x3, 202(x20)
        beq x8, x10, L315
        or x10, x3, x10
        lhu x12, 6(x20)
L315:
        auipc x10, 782517
        or x2, x12, x10
        slti x15, x7, -2048
        xori x0, x0, 2047
        lw x8, 104(x20)
        and x4, x2, x2
        srai x3, x8, 19
        auipc x3, 13502
        sh x3, 60(x20)
        lbu x9, 225(x20)
        addi x2, x2, 2047
        ori x0, x2, 2047
        ori x15, x6, -49
        lw x6, 116(x20)
        xori x8, x4, 2047
        ori x15, x6, -1
        sra x3, x7, x6
        or x5, x8, x15
        xori x12, x5, -1
        bne x3, x5, L338
        or x6, x5, x5
        lh x12, 236(x20)
        slti x4, x12, -51
L338:
        sltiu x1, x2, -1
        auipc x4, 605253
        bge x13, x6, L344
        slt x10, x12, x8
        addi x13, x4, -41
        andi x3, x13, 2047
L344:
        andi x5, x3, 1
        or x3, x13, x5
        bltu x5, x8, L350
        sub x8, x5, x3
        lui x3, 587300
        beq x3, x3, L353
L350:
        lbu x5, 2(x20)
        sub x6, x7, x8
        srl x6, x0, x5
L353:
        jal x6, L356
        jal x3, L356
        sra x1, x3, x3
L356:
        srl x4, x1, x3
        lh x10, 212(x20)
        sw x10, 232(x20)
        slti x2, x1, -26
        add x13, x10, x2
        sw x13, 220(x20)
        lui x11, 825377
        lw x9, 208(x20)
        xori x4, x11, 0
        addi x10, x7, -2048
        sltiu x1, x3, 2047
        lw x10, 12(x20)
        xori x1, x1, 154
        lhu x3, 150(x20)
        andi x11, x13, 58
        lh x3, 8(x20)
        srli x14, x4, 19
        sw x14, 152(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x1, x8, 1
        ori x12, x14, -13
        sltu x9, x15, x12
        lw x11, 204(x20)
        addi x9, x15, 1
        sltu x4, x2, x9
        and x10, x11, x9
        sltu x1, x9, x10
        xori x13, x0, 1
        sb x14, 219(x20)
        slti x4, x10, 0
        bne x1, x13, L389
        sltu x15, x1, x13
        srl x14, x15, x13
        and x9, x15, x10
L389:
        ori x8, x14, 2047
        srai x14, x14, 9
        ori x2, x8, 2047
        lui x2, 683314
        sb x1, 132(x20)
        auipc x6, 952485
        srl x0, x2, x14
        lui x7, 1031722
        sb x2, 14(x20)
        addi x2, x7, -1
        sb x10, 37(x20)
        ori x6, x7, -2048
        sltu x5, x8, x7
        bgeu x2, x9, L406
        bne x6, x6, L406
        xor x12, x5, x3
        sltu x12, x6, x6
L406:
        lw x2, 228(x20)
        sra x0, x2, x2
        jal x2, L411
        sltu x6, x12, x2
        add x6, x2, x15
L411:
        andi x4, x2, -1802
        bge x1, x6, L414
        add x6, x6, x6
L414:
        bltu x6, x6, L416
        or x8, x6, x4
L416:
        and x1, x6, x4
        slli x1, x5, 26
        sw x3, 240(x20)
        sb x1, 67(x20)
        slti x12, x8, -2048
        or x4, x1, x12
        sltu x0, x1, x13
        sb x1, 220(x20)
        jal x13, L426
        lb x2, 207(x20)
L426:
        srl x10, x13, x13
        srl x10, x9, x12
        xor x7, x4, x10
        beq x15, x8, L434
        andi x0, x10, -2048
        srl x0, x15, x0
        slli x6, x10, 11
        sra x11, x6, x7
L434:
        ori x2, x4, 0
        xor x0, x6, x2
        bne x2, x11, L439
        slli x1, x6, 11
        ori x14, x1, -8
L439:
        jal x8, L443
        or x8, x8, x14
        xori x12, x3, 2047
        sltu x12, x12, x6
L443:
        xori x5, x15, -2048
        srli x0, x8, 4
        sltu x3, x6, x5
        sb x5, 112(x20)
        sra x1, x5, x3
        and x6, x1, x12
        bgeu x3, x6, L454
        xori x12, x1, 1
        and x6, x6, x3
        auipc x12, 240309
        slli x9, x12, 10
L454:
        sh x5, 86(x20)
        lhu x13, 250(x20)
        srl x10, x9, x12
        sub x1, x13, x11
        sw x3, 240(x20)
        srl x9, x10, x10
        srl x2, x9, x10
        lh x1, 68(x20)
        lhu x13, 28(x20)
        lb x1, 224(x20)
        sh x2, 200(x20)
        auipc x12, 204154
        addi x13, x1, 1
        ori x7, x12, -687
        srl x10, x9, x2
        xori x15, x13, -1020
        sra x13, x15, x10
        lh x15, 80(x20)
        sub x3, x13, x4
        slti x14, x2, -2048
        lb x14, 129(x20)
        ori x4, x14, 61
        jal x7, L479
        sw x14, 84(x20)
        jal x13, L480
L479:
        lui x14, 99769
L480:
        sw x14, 156(x20)
        jal x2, L484
        sw x2, 112(x20)
        sw x2, 12(x20)
L484:
        sltiu x5, x5, -2048
        sra x3, x5, x5
        xori x1, x3, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x4, x7, 1
        ori x13, x0, -2048
        sh x12, 50(x20)
        ori x13, x12, 1
        and x1, x11, x13
        slt x15, x1, x13
        slt x1, x1, x12
        jal x11, L497
        sh x9, 130(x20)
        sw x14, 36(x20)
L497:
        sub x1, x1, x1
        srl x2, x15, x14
        xori x7, x7, 2047
        bgeu x7, x2, L503
        bne x7, x2, L505
        sltu x14, x2, x1
L503:
        lui x5, 551819
        sh x5, 76(x20)
L505:
        andi x15, x0, 0
        auipc x9, 640630
        xor x6, x11, x5
        srai x6, x8, 1
        lb x15, 86(x20)
        sw x14, 104(x20)
        sub x7, x6, x15
        auipc x16, 0
        addi x16, x16, 16
        jalr x0, 0(x16)
        addi x4, x6, 1
        slti x11, x7, 22
        lbu x14, 120(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x13, x11, 1
        addi x5, x14, -2048
        add x14, x2, x2
        and x1, x2, x1
        lh x10, 48(x20)
        lb x11, 89(x20)
        lui x1, 462031
        bgeu x11, x6, L524
        sll x10, x13, x7
L524:
        andi x9, x10, 1
        lw x12, 128(x20)
        or x13, x12, x9
        beq x9, x8, L529
        slt x7, x8, x12
L529:
        sltu x6, x12, x14
        sltiu x13, x7, -2048
        sltu x8, x7, x7
        and x7, x2, x6
        sh x0, 216(x20)
        sw x10, 220(x20)
        bgeu x8, x14, L537
        lb x10, 192(x20)
L537:
        sll x2, x0, x10
        lh x14, 224(x20)
        add x11, x0, x10
        add x14, x14, x1
        blt x5, x14, L543
        sll x4, x14, x14
L543:
        sw x11, 248(x20)
        sb x11, 104(x20)
        or x2, x4, x5
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x15, x6, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x3, x11, 1
        lui x10, 462899
        bge x12, x10, L551
        lui x3, 109741
L551:
        sb x15, 188(x20)
        slt x9, x12, x10
        sub x14, x9, x10
        xori x7, x9, -1
        sw x14, 104(x20)
        slti x12, x9, -23
        add x10, x7, x7
        lhu x1, 120(x20)
        lui x15, 418868
        lh x15, 18(x20)
        sltu x7, x6, x1
        lw x7, 60(x20)
        bne x7, x7, L567
        jal x9, L566
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x5, x15, 1
L566:
        slti x13, x8, -2048
L567:
        xori x7, x6, -53
        jal x11, L570
        jal x12, L572
L570:
        add x10, x7, x12
        addi x14, x1, 1272
L572:
        slt x1, x8, x11
        jal x8, L577
        ori x15, x9, 176
        lb x7, 66(x20)
        addi x5, x0, 1
L577:
        slli x0, x7, 9
        auipc x16, 0
        addi x16, x16, 16
        jalr x13, 0(x16)
        addi x15, x3, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x15, 0(x16)
        addi x6, x2, 1
        jal x14, L582
        slli x12, x13, 21
L582:
        add x5, x12, x5
        addi x12, x1, -1
        lhu x13, 218(x20)
        slti x1, x12, 503
        beq x3, x13, L591
        and x4, x8, x13
        auipc x12, 457578
        sub x15, x11, x3
        lui x9, 939473
L591:
        sw x15, 40(x20)
        jal x2, L594
        ori x8, x9, 0
L594:
        and x9, x11, x2
        lb x6, 97(x20)
        slli x1, x6, 14
        jal x11, L600
        and x11, x11, x6
        and x15, x4, x15
L600:
        sltiu x12, x11, -2048
        xori x10, x8, 0
        lbu x4, 9(x20)
        lw x3, 208(x20)
        sb x2, 112(x20)
        lw x3, 44(x20)
        srai x5, x3, 26
        andi x12, x2, -1
        lhu x8, 156(x20)
        srl x2, x8, x4
        lbu x4, 240(x20)
        jal x5, L613
        bgeu x5, x5, L617
L613:
        addi x12, x2, 1633
        srl x12, x6, x13
        addi x8, x12, 26
        srl x1, x4, x12
L617:
        jal x12, L619
        lhu x13, 190(x20)
L619:
        or x12, x1, x1
        xori x12, x10, 1648
        lh x14, 222(x20)
        sltu x10, x7, x0
        addi x6, x14, -2048
        auipc x16, 0
        addi x16, x16, 16
        jalr x4, 0(x16)
        addi x9, x15, 1
        bne x4, x8, L628
        xori x2, x6, 2047
        lui x4, 612654
L628:
        lui x3, 252005
        sh x2, 154(x20)
        lbu x3, 49(x20)
        slli x6, x4, 19
        or x5, x15, x3
        jal x5, L636
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x2, x15, 1
        lbu x6, 67(x20)
L636:
        bne x14, x6, L641
        lb x8, 215(x20)
        sb x8, 199(x20)
        auipc x14, 450435
        xori x6, x8, 1
L641:
        ori x8, x6, 0
        bne x12, x7, L647
        slt x3, x8, x4
        beq x8, x6, L648
        srli x9, x3, 30
        sw x3, 72(x20)
L647:
        slt x13, x7, x5
L648:
        srl x11, x13, x13
        srli x11, x0, 12
        ori x8, x9, 2047
        sltiu x11, x2, -2048
        sw x5, 248(x20)
        sw x13, 32(x20)
        beq x11, x3, L656
        bltu x11, x14, L658
L656:
        slti x3, x8, -1
        add x1, x11, x8
L658:
        sll x15, x7, x1
        srli x13, x15, 9
        addi x1, x1, 0
        sll x1, x0, x15
        lbu x3, 80(x20)
        and x11, x4, x1
        sltu x15, x3, x3
        or x13, x15, x10
        sra x1, x11, x15
        bge x15, x1, L672
        bltu x8, x1, L671
        bgeu x15, x15, L672
        jal x4, L672
L671:
        xori x15, x15, 0
L672:
        sub x15, x9, x15
        addi x11, x4, -219
        sh x15, 98(x20)
        lh x11, 118(x20)
        bltu x15, x4, L679
        bgeu x13, x15, L681
        sw x12, 56(x20)
L679:
        srl x6, x15, x11
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x9, x8, 1
L681:
        sw x6, 180(x20)
        sh x1, 190(x20)
        jal x5, L685
        xor x7, x0, x14
L685:
        sw x14, 112(x20)
        andi x3, x14, -2048
        sltu x3, x3, x3
        sltiu x3, x7, 2047
        srli x13, x2, 18
        xori x7, x13, -2048
        add x12, x7, x7
        sub x8, x7, x13
        bge x8, x15, L695
        xori x2, x12, -942
L695:
        sra x13, x7, x12
        bge x3, x13, L699
        lh x6, 128(x20)
        jal x8, L701
L699:
        slti x12, x14, 1866
        bge x0, x10, L704
L701:
        slli x15, x8, 30
        jal x4, L704
        ori x6, x4, -656
L704:
        addi x8, x6, -44
        sltu x3, x15, x14
        addi x15, x8, 2047
        lhu x14, 78(x20)
        sltu x1, x14, x14
        sltiu x5, x1, 12
        andi x2, x11, -56
        add x6, x4, x9
        sll x2, x10, x2
        addi x15, x6, 1
        sltiu x11, x6, -2048
        xori x6, x11, 0
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x6, x2, 1
        lw x3, 252(x20)
        blt x1, x1, L720
        srai x11, x1, 7
L720:
        lbu x3, 213(x20)
        beq x3, x3, L726
        sub x2, x4, x4
        lw x7, 188(x20)
        sra x9, x15, x2
        lhu x2, 244(x20)
L726:
        sltiu x1, x5, -1273
        lb x3, 167(x20)
        xori x7, x1, 0
        xor x10, x7, x3
        and x15, x3, x3
        bne x10, x0, L733
        lw x15, 0(x20)
L733:
        or x2, x15, x1
        sb x2, 219(x20)
        sltiu x15, x12, 2047
        ori x7, x15, -52
        slli x0, x2, 4
        lhu x8, 62(x20)
        bne x0, x12, L741
        sra x14, x8, x8
L741:
        sltu x3, x7, x7
        andi x8, x10, -41
        jal x4, L746
        sltu x3, x6, x3
        slti x4, x8, -1997
L746:
        sub x10, x4, x4
        sll x6, x3, x14
        or x15, x12, x5
        lb x15, 124(x20)
        srai x14, x6, 9
        xor x1, x15, x15
        sltiu x12, x15, 338
        lhu x4, 172(x20)
        xor x8, x3, x5
        addi x2, x8, -116
        ori x6, x4, 8
        beq x14, x8, L761
        sb x8, 222(x20)
        auipc x9, 1004471
        beq x12, x9, L762
L761:
        bltu x2, x11, L764
L762:
        jal x1, L764
        blt x6, x7, L768
L764:
        bgeu x6, x9, L769
        sltu x5, x6, x9
        srl x13, x1, x9
        srl x6, x3, x1
L768:
        lw x12, 200(x20)
L769:
        lw x4, 116(x20)
        srli x14, x4, 0
        srai x5, x14, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x3, x3, 1
        lb x8, 208(x20)
        ori x15, x5, -2048
        lh x13, 182(x20)
        jal x7, L779
        slt x3, x13, x2
        lui x15, 436736
L779:
        ori x6, x11, 1
        slti x8, x3, -997
        jal x13, L783
        jal x2, L785
L783:
        andi x15, x9, 2047
        bgeu x2, x13, L788
L785:
        slt x4, x8, x4
        bge x4, x4, L789
        sltu x8, x15, x14
L788:
        srl x13, x4, x7
L789:
        blt x8, x10, L792
        slt x9, x3, x13
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x13, x14, 1
L792:
        slli x2, x9, 12
        bne x10, x9, L798
        add x9, x10, x10
        lw x9, 44(x20)
        auipc x4, 317733
        beq x4, x9, L802
L798:
        lui x7, 1014967
        sub x14, x9, x1
        and x4, x4, x3
        or x3, x15, x14
L802:
        srai x5, x5, 0
        slli x7, x15, 28
        srl x11, x15, x5
        lb x4, 11(x20)
        sub x0, x14, x7
        or x2, x8, x7
        srli x12, x2, 21
        bge x4, x12, L813
        slli x5, x2, 23
        bge x8, x5, L814
        lui x3, 3030
L813:
        sb x12, 51(x20)
L814:
        srai x3, x6, 10
        bge x3, x6, L818
        sh x5, 136(x20)
        lui x11, 456664
L818:
        bne x14, x9, L822
        lbu x15, 184(x20)
        srli x9, x3, 20
        sub x15, x11, x9
L822:
        addi x1, x9, -2048
        lhu x11, 240(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x13, x5, 1
        slli x7, x11, 15
        jal x2, L828
        add x6, x11, x7
L828:
        addi x4, x7, -1
        lw x10, 148(x20)
        bgeu x10, x6, L835
        addi x4, x11, 1
        xori x5, x4, -1
        beq x4, x5, L837
        srli x2, x5, 8
L835:
        sh x2, 56(x20)
        jal x14, L840
L837:
        bge x3, x5, L840
        bltu x2, x14, L840
        sll x9, x5, x14
L840:
        sw x5, 212(x20)
        add x9, x14, x6
        bne x9, x8, L846
        sw x15, 156(x20)
        lw x4, 96(x20)
        lui x7, 92559
L846:
        lb x6, 80(x20)
        beq x15, x7, L850
        auipc x16, 0
        addi x16, x16, 16
        jalr x15, 0(x16)
        addi x9, x4, 1
        sb x15, 123(x20)
L850:
        xor x8, x6, x6
        auipc x16, 0
        addi x16, x16, 16
        jalr x8, 0(x16)
        addi x3, x1, 1
        andi x14, x8, 1
        lh x2, 184(x20)
        jal x6, L856
        add x1, x2, x6
L856:
        jal x14, L859
        slti x5, x1, 0
        sltu x5, x5, x14
L859:
        and x6, x5, x5
        slt x6, x5, x6
        jal x6, L863
        xor x7, x6, x10
L863:
        bge x6, x0, L865
        and x14, x6, x6
L865:
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x8, x11, 1
        and x3, x7, x0
        and x8, x10, x3
        add x4, x3, x8
        srai x12, x12, 15
        sltu x8, x4, x8
        lbu x9, 47(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x10, x10, 1
        srai x11, x1, 10
        and x8, x11, x7
        lbu x1, 0(x20)
        sll x0, x8, x7
        addi x9, x8, -2048
        lh x8, 250(x20)
        and x6, x1, x8
        srli x14, x8, 3
        andi x4, x8, 2047
        sltiu x12, x12, 1
        lb x0, 72(x20)
        slti x6, x14, 2047
        sra x0, x12, x6
        srl x9, x4, x4
        sb x14, 36(x20)
        sw x6, 240(x20)
        lw x2, 40(x20)
        beq x6, x13, L893
        sh x8, 64(x20)
        lui x10, 321552
L893:
        lb x11, 196(x20)
        slt x5, x0, x2
        sub x5, x3, x11
        lw x3, 152(x20)
        slli x9, x11, 8
        xor x1, x1, x9
        lw x10, 36(x20)
        ebreak
