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
        li x10, -1904597345
        li x11, -1782961187
        li x12, 1440956708
        li x13, -824047624
        li x14, 455026734
        li x15, 458709969
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
        lui x7, 780266
        slli x6, x7, 29
        jal x15, L5
        slli x0, x7, 20
        sra x12, x6, x6
L5:
        srai x14, x12, 28
        sra x8, x15, x8
        srai x15, x12, 29
        xori x6, x15, 4
        blt x14, x8, L13
        srai x13, x6, 21
        lbu x11, 54(x20)
        or x5, x11, x4
L13:
        add x6, x13, x5
        add x0, x3, x11
        blt x11, x1, L19
        slti x1, x11, -1
        ori x12, x6, 3
        xori x2, x5, 0
L19:
        ori x7, x5, 1
        blt x2, x5, L24
        lh x3, 16(x20)
        sra x2, x2, x8
        auipc x12, 754616
L24:
        add x3, x12, x5
        sll x2, x8, x2
        srl x15, x3, x2
        sb x3, 222(x20)
        lui x9, 380056
        blt x2, x10, L34
        lh x0, 156(x20)
        lb x14, 53(x20)
        sb x14, 231(x20)
        srai x5, x14, 1
L34:
        slti x4, x3, 2047
        lbu x2, 176(x20)
        slt x1, x2, x13
        lhu x8, 22(x20)
        sra x8, x5, x9
        lhu x5, 250(x20)
        sltiu x12, x5, 0
        xori x13, x5, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x11, x15, 1
        lhu x2, 88(x20)
        slt x5, x14, x2
        and x8, x5, x2
        xori x3, x8, 2047
        xor x6, x3, x0
        lb x4, 115(x20)
        sltiu x12, x1, -19
        slt x2, x6, x13
        sltiu x10, x4, 61
        lb x9, 222(x20)
        lui x13, 152725
        ori x11, x3, -1
        beq x12, x13, L60
        srl x11, x5, x13
        xor x0, x11, x13
        bne x10, x13, L63
        addi x6, x11, 443
L60:
        jal x7, L63
        srli x14, x7, 9
        sw x6, 44(x20)
L63:
        jal x5, L67
        xor x6, x5, x13
        sra x15, x14, x5
        lbu x2, 139(x20)
L67:
        bne x12, x6, L72
        sb x13, 137(x20)
        sltiu x15, x11, 38
        lh x7, 36(x20)
        xori x15, x15, 2047
L72:
        srl x0, x7, x15
        ori x11, x13, -1
        sltu x6, x7, x11
        xor x11, x15, x2
        sb x11, 73(x20)
        sltiu x14, x5, -1095
        sw x6, 200(x20)
        sltiu x10, x14, 2047
        bne x10, x11, L85
        andi x3, x11, -1
        addi x4, x9, 1
        andi x14, x11, 0
        andi x1, x3, -2048
L85:
        bgeu x4, x14, L89
        add x11, x4, x4
        andi x13, x13, -38
        sw x1, 104(x20)
L89:
        sltu x9, x11, x11
        slt x3, x9, x9
        lb x13, 15(x20)
        add x12, x13, x9
        lw x14, 24(x20)
        sb x13, 160(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x9, x15, 1
        sll x12, x15, x7
        sw x12, 32(x20)
        lb x14, 233(x20)
        slt x5, x9, x1
        srai x4, x5, 27
        sw x15, 84(x20)
        bge x5, x0, L106
        sltiu x6, x11, -8
        lw x5, 64(x20)
        beq x4, x6, L109
L106:
        sub x14, x5, x15
        lh x3, 66(x20)
        lhu x8, 32(x20)
L109:
        bge x14, x3, L111
        bne x11, x8, L113
L111:
        slti x5, x8, -2048
        sh x13, 60(x20)
L113:
        slti x1, x10, 0
        ori x6, x8, -2048
        add x3, x6, x5
        lbu x1, 164(x20)
        lh x9, 52(x20)
        sltu x5, x14, x2
        sltiu x2, x12, -2048
        sh x10, 140(x20)
        slli x14, x1, 0
        andi x9, x2, 2047
        xor x5, x9, x9
        srl x6, x8, x14
        slt x12, x9, x6
        ori x1, x6, 45
        and x14, x12, x2
        xori x10, x14, 1
        sra x4, x5, x9
        sltiu x1, x14, 2047
        sltu x12, x0, x1
        xori x4, x12, -1
        jal x9, L136
        lbu x10, 198(x20)
        andi x7, x4, 28
L136:
        lui x15, 364689
        slti x15, x15, -1
        lh x7, 160(x20)
        lui x1, 760114
        slti x15, x7, -2048
        lui x8, 198073
        lui x3, 107480
        sra x10, x3, x1
        srl x12, x11, x3
        srai x6, x3, 15
        slti x11, x10, -2048
        ori x14, x6, 2047
        sw x7, 184(x20)
        lw x10, 92(x20)
        add x8, x7, x7
        sb x8, 94(x20)
        blt x10, x10, L154
        slti x15, x10, -1
L154:
        sltu x9, x10, x10
        beq x8, x15, L158
        andi x13, x8, 1
        bgeu x13, x7, L161
L158:
        sub x2, x1, x9
        srli x7, x5, 12
        sltiu x12, x1, 1
L161:
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x11, x6, 1
        andi x12, x7, -63
        and x15, x12, x7
        srai x12, x7, 14
        sb x7, 95(x20)
        xori x11, x11, -2048
        jal x3, L171
        lhu x13, 74(x20)
        sw x4, 136(x20)
        sub x6, x6, x13
L171:
        sra x4, x6, x13
        sltu x4, x13, x4
        slti x15, x6, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x13, 0(x16)
        addi x7, x8, 1
        slt x4, x13, x4
        sh x6, 160(x20)
        sltu x7, x13, x4
        srli x3, x13, 26
        xor x10, x3, x3
        or x3, x15, x0
        jal x12, L184
        or x14, x10, x7
        sub x11, x12, x14
L184:
        srl x5, x2, x12
        and x4, x11, x7
        srai x1, x5, 25
        srli x6, x2, 18
        sw x4, 20(x20)
        andi x11, x1, 1
        slti x11, x1, 2047
        lh x3, 36(x20)
        sb x3, 214(x20)
        jal x1, L197
        xori x15, x0, -38
        add x5, x15, x15
        sltu x11, x5, x15
L197:
        bge x15, x14, L200
        slli x4, x5, 3
        sll x10, x6, x1
L200:
        sll x4, x4, x7
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x3, x4, 1
        sltu x5, x10, x12
        srai x0, x10, 19
        auipc x16, 0
        addi x16, x16, 16
        jalr x9, 0(x16)
        addi x11, x3, 1
        lh x10, 146(x20)
        addi x3, x10, 0
        addi x4, x0, -2048
        lhu x6, 102(x20)
        sltiu x6, x6, 0
        slt x2, x6, x8
        srl x1, x6, x2
        sw x6, 12(x20)
        bgeu x1, x4, L215
        sb x1, 154(x20)
L215:
        sra x11, x1, x4
        bne x11, x8, L218
        beq x2, x1, L221
L218:
        blt x2, x13, L220
        sub x11, x7, x15
L220:
        bge x11, x8, L222
L221:
        sh x13, 28(x20)
L222:
        slt x15, x11, x14
        sb x1, 124(x20)
        sll x1, x13, x2
        sll x6, x1, x11
        lhu x5, 82(x20)
        slt x15, x9, x1
        slli x14, x6, 13
        sb x14, 232(x20)
        or x6, x14, x4
        lb x7, 139(x20)
        andi x10, x7, -2048
        bgeu x6, x2, L237
        sll x10, x10, x10
        lb x9, 164(x20)
        sltu x13, x10, x9
L237:
        srl x7, x13, x4
        lw x15, 140(x20)
        jal x0, L242
        auipc x16, 0
        addi x16, x16, 16
        jalr x6, 0(x16)
        addi x4, x4, 1
        jal x9, L243
L242:
        addi x11, x11, 403
L243:
        sh x11, 134(x20)
        blt x11, x15, L248
        addi x9, x9, -1
        andi x8, x3, 0
        srai x12, x12, 12
L248:
        lb x11, 4(x20)
        srl x14, x8, x10
        lw x7, 136(x20)
        slt x13, x14, x11
        and x1, x13, x13
        sltu x7, x7, x7
        jal x14, L258
        slti x11, x7, 2047
        lw x4, 112(x20)
        lhu x8, 138(x20)
L258:
        beq x4, x11, L263
        sll x3, x14, x11
        andi x11, x8, -2048
        slt x9, x11, x7
        srai x6, x9, 18
L263:
        jal x15, L266
        slti x9, x9, 2047
        add x6, x9, x9
L266:
        lw x7, 108(x20)
        andi x11, x6, 484
        lui x12, 1017354
        xor x3, x7, x12
        auipc x6, 325765
        auipc x10, 975630
        bge x6, x8, L274
        lhu x2, 108(x20)
L274:
        addi x2, x10, 1
        andi x2, x0, -1
        bne x2, x2, L279
        bgeu x2, x2, L282
        slt x7, x2, x2
L279:
        lh x11, 70(x20)
        sltu x10, x11, x2
        and x12, x10, x13
L282:
        andi x8, x10, 1763
        srl x11, x6, x12
        lw x13, 128(x20)
        lw x7, 232(x20)
        slti x4, x5, 0
        xor x13, x4, x6
        sltu x2, x13, x13
        add x6, x2, x13
        or x4, x5, x13
        sra x0, x4, x4
        srai x3, x6, 15
        sub x6, x3, x4
        lhu x13, 52(x20)
        sra x6, x8, x6
        lhu x3, 228(x20)
        lh x2, 250(x20)
        add x1, x14, x11
        sll x10, x12, x12
        add x14, x10, x8
        sltu x8, x1, x1
        sw x8, 28(x20)
        slti x10, x14, 0
        or x1, x7, x8
        lh x8, 184(x20)
        srli x10, x8, 10
        srl x7, x5, x1
        bltu x12, x10, L310
        sltiu x13, x10, 1
L310:
        sb x7, 209(x20)
        jal x11, L314
        slti x0, x5, 61
        sltu x14, x8, x3
L314:
        sra x2, x11, x11
        add x9, x14, x11
        xor x6, x9, x1
        or x2, x9, x6
        sh x15, 8(x20)
        sltiu x10, x2, 1
        lw x5, 204(x20)
        lh x13, 214(x20)
        srl x8, x13, x13
        sltu x9, x9, x15
        sw x9, 136(x20)
        srai x11, x4, 2
        sw x11, 212(x20)
        xor x7, x11, x9
        andi x8, x7, -438
        jal x10, L333
        sll x11, x5, x8
        beq x11, x10, L335
        add x1, x11, x8
L333:
        andi x7, x13, -26
        auipc x16, 0
        addi x16, x16, 16
        jalr x0, 0(x16)
        addi x9, x8, 1
L335:
        auipc x3, 404496
        addi x2, x3, -1
        andi x7, x7, -1353
        sb x7, 230(x20)
        srl x10, x3, x12
        lui x4, 30111
        slti x7, x2, -1
        srl x4, x10, x10
        jal x14, L347
        xor x1, x7, x3
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x3, x11, 1
        lui x2, 239424
L347:
        lui x5, 556345
        srli x14, x2, 12
        sw x2, 128(x20)
        blt x5, x15, L352
        bgeu x7, x13, L355
L352:
        srl x6, x5, x5
        sw x6, 252(x20)
        and x1, x6, x5
L355:
        sub x11, x1, x6
        lbu x15, 208(x20)
        slt x7, x2, x11
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x13, x13, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x13, x3, 1
        slti x14, x8, 2047
        slt x6, x3, x14
        lh x5, 2(x20)
        jal x14, L365
        sra x11, x5, x14
L365:
        slti x14, x5, 1
        bltu x13, x5, L368
        srli x3, x14, 22
L368:
        sub x8, x3, x11
        sb x14, 120(x20)
        sub x8, x13, x11
        lh x5, 4(x20)
        jal x0, L376
        blt x0, x5, L377
        lhu x10, 96(x20)
        ori x15, x5, -1
L376:
        srl x3, x15, x5
L377:
        sb x12, 208(x20)
        bgeu x14, x10, L380
        lhu x4, 82(x20)
L380:
        lh x14, 218(x20)
        lhu x6, 124(x20)
        sh x7, 6(x20)
        add x2, x10, x14
        slti x4, x6, 2047
        add x6, x4, x4
        lui x6, 1031215
        xor x15, x7, x6
        auipc x13, 948231
        auipc x11, 702956
        lui x10, 758021
        sltu x7, x14, x13
        sb x7, 111(x20)
        slt x2, x7, x1
        bne x10, x4, L397
        slli x1, x2, 29
        auipc x14, 758518
L397:
        lb x13, 130(x20)
        lw x3, 244(x20)
        andi x14, x14, -895
        sltiu x6, x3, 46
        sb x14, 63(x20)
        sh x3, 224(x20)
        addi x9, x14, 1
        lb x4, 45(x20)
        lui x14, 964885
        blt x9, x6, L410
        bge x4, x4, L409
        bne x7, x4, L411
L409:
        andi x13, x8, 2047
L410:
        slli x0, x8, 14
L411:
        lb x6, 197(x20)
        sb x11, 175(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x13, x11, 1
        bne x6, x6, L419
        srl x3, x1, x6
        srai x5, x12, 18
        srai x13, x5, 14
        lw x10, 176(x20)
L419:
        sub x5, x13, x9
        and x11, x5, x13
        andi x14, x11, 1820
        srl x4, x5, x14
        addi x2, x14, -1
        or x14, x1, x14
        srli x9, x2, 16
        srl x7, x12, x14
        beq x8, x9, L432
        lb x7, 149(x20)
        srli x9, x7, 14
        lb x10, 70(x20)
        sltiu x5, x10, 0
L432:
        xor x0, x7, x5
        sll x1, x10, x9
        bge x10, x1, L437
        sltu x8, x10, x12
        lb x12, 248(x20)
L437:
        slt x2, x12, x1
        lhu x10, 10(x20)
        addi x12, x14, 1
        sub x12, x12, x10
        beq x3, x12, L443
        slti x7, x7, -2048
L443:
        sltu x3, x12, x7
        and x1, x3, x5
        srl x3, x1, x1
        sub x3, x12, x1
        sltu x6, x13, x15
        beq x6, x6, L453
        sw x6, 200(x20)
        lhu x15, 106(x20)
        and x6, x15, x15
        addi x13, x6, 0
L453:
        addi x12, x13, -47
        sh x13, 210(x20)
        lh x8, 174(x20)
        addi x11, x13, 2047
        sub x8, x12, x1
        sb x8, 64(x20)
        srai x15, x15, 13
        addi x1, x0, 2047
        or x5, x15, x15
        sh x5, 152(x20)
        sra x13, x1, x1
        sub x0, x6, x5
        sltiu x6, x1, 1
        lb x5, 112(x20)
        addi x7, x4, -1
        srl x8, x7, x5
        slli x6, x5, 0
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x10, x10, 1
        slti x12, x1, -2048
        xori x6, x12, 2047
        bgeu x6, x9, L477
        srl x15, x1, x10
        add x3, x8, x6
        add x11, x15, x9
L477:
        sll x3, x0, x15
        sltu x5, x11, x11
        srl x14, x5, x12
        auipc x16, 0
        addi x16, x16, 16
        jalr x6, 0(x16)
        addi x15, x5, 1
        sub x14, x8, x5
        jal x2, L484
        and x9, x6, x6
L484:
        sw x9, 208(x20)
        srli x8, x2, 25
        sh x2, 180(x20)
        bne x8, x8, L489
        sub x8, x8, x2
L489:
        sltu x15, x9, x3
        bge x8, x15, L495
        lb x12, 121(x20)
        slt x3, x12, x15
        sb x9, 155(x20)
        lh x14, 182(x20)
L495:
        sb x14, 236(x20)
        slt x8, x12, x5
        xor x3, x14, x2
        addi x9, x3, 1
        lhu x7, 0(x20)
        add x13, x2, x7
        sw x9, 176(x20)
        lui x9, 776716
        ori x5, x9, -948
        slt x10, x4, x5
        sh x10, 230(x20)
        xori x10, x10, 1
        sltu x14, x6, x3
        srl x12, x9, x10
        srl x8, x14, x3
        or x15, x10, x0
        sra x7, x4, x12
        lw x6, 40(x20)
        sub x1, x15, x8
        sh x9, 112(x20)
        sltiu x10, x1, 2047
        bltu x1, x10, L521
        jal x8, L521
        auipc x2, 433101
        srl x2, x0, x10
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x9, x12, 1
L521:
        xor x12, x2, x14
        slt x13, x2, x12
        xori x10, x5, -2048
        add x0, x10, x4
        andi x6, x13, -1
        sb x1, 100(x20)
        lui x12, 866489
        ori x4, x10, -1
        sra x13, x12, x4
        sw x12, 180(x20)
        add x15, x12, x3
        addi x2, x15, 0
        sh x13, 108(x20)
        xor x2, x15, x4
        bge x2, x3, L539
        lw x7, 244(x20)
        add x13, x2, x7
        ori x13, x7, -1
L539:
        sltiu x12, x13, 2047
        sltu x5, x3, x8
        andi x1, x1, 29
        slti x12, x0, 2047
        sh x1, 30(x20)
        lw x8, 224(x20)
        lhu x1, 150(x20)
        beq x1, x12, L548
        lui x5, 1046968
L548:
        add x6, x0, x1
        xor x2, x12, x1
        bgeu x5, x2, L555
        auipc x9, 922409
        sw x11, 20(x20)
        srl x4, x2, x9
        jal x4, L558
L555:
        beq x15, x9, L559
        lbu x15, 230(x20)
        srl x3, x11, x4
L558:
        srl x1, x10, x4
L559:
        xor x5, x15, x15
        or x15, x5, x1
        addi x4, x15, 2047
        or x2, x5, x5
        sw x2, 172(x20)
        lui x3, 1587
        sra x10, x4, x14
        bge x2, x2, L569
        sra x6, x3, x10
        srl x3, x14, x3
L569:
        slti x8, x3, -2048
        bge x3, x10, L575
        slli x11, x6, 21
        addi x15, x1, 0
        sh x15, 16(x20)
        sh x15, 124(x20)
L575:
        or x12, x15, x4
        srli x9, x4, 7
        blt x3, x4, L582
        xori x10, x9, -44
        srai x10, x12, 26
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x15, x6, 1
        ori x4, x10, 1
L582:
        lui x6, 510092
        lh x4, 0(x20)
        addi x5, x6, 0
        ori x5, x13, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x15, x3, 1
        sb x11, 119(x20)
        addi x5, x2, 2047
        addi x6, x5, -454
        jal x2, L592
        srai x4, x2, 18
L592:
        jal x2, L595
        bgeu x9, x2, L596
        slti x2, x1, 0
L595:
        or x4, x7, x0
L596:
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x7, x11, 1
        sw x4, 160(x20)
        sltu x5, x2, x10
        sltu x11, x10, x10
        lui x10, 420852
        auipc x13, 287238
        slt x6, x11, x6
        and x12, x4, x10
        slli x11, x9, 12
        srli x13, x12, 4
        sll x6, x4, x11
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x6, x2, 1
        sll x6, x13, x8
        auipc x16, 0
        addi x16, x16, 16
        jalr x4, 0(x16)
        addi x13, x15, 1
        ori x15, x5, 0
        sltu x15, x13, x6
        or x6, x15, x15
        ori x1, x1, -130
        sltu x8, x6, x15
        slli x6, x8, 3
        sh x8, 196(x20)
        sll x6, x13, x1
        bltu x9, x6, L623
        add x10, x10, x6
        ori x6, x6, 8
        sw x6, 148(x20)
        sh x9, 102(x20)
L623:
        andi x1, x10, -1
        sub x9, x1, x7
        xori x0, x1, 48
        add x1, x1, x8
        sll x1, x13, x14
        and x7, x1, x1
        lhu x6, 74(x20)
        sltu x4, x6, x1
        or x9, x6, x11
        sb x1, 110(x20)
        sltiu x4, x4, 1415
        xori x12, x4, 1
        slt x11, x5, x12
        sw x12, 252(x20)
        xori x12, x4, 2047
        srai x11, x10, 26
        xori x0, x12, 2021
        sub x4, x11, x10
        bge x11, x4, L644
        sub x2, x12, x11
        sub x8, x4, x4
L644:
        slti x13, x4, 835
        andi x13, x15, 1645
        sltiu x12, x15, 0
        sb x2, 10(x20)
        sw x12, 240(x20)
        lbu x3, 126(x20)
        lbu x13, 233(x20)
        addi x4, x13, 2047
        addi x3, x13, 26
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x10, x7, 1
        slt x2, x5, x3
        slti x14, x5, 0
        slt x12, x14, x14
        lb x8, 229(x20)
        slt x0, x12, x7
        lbu x0, 181(x20)
        bne x10, x2, L665
        ori x15, x8, -1
        sltu x15, x11, x9
        srai x5, x8, 8
        addi x15, x13, -21
L665:
        bltu x2, x0, L670
        add x1, x5, x15
        bge x1, x1, L670
        or x0, x2, x15
        sub x13, x1, x1
L670:
        addi x4, x7, 2047
        sw x1, 156(x20)
        srl x3, x6, x0
        srl x13, x4, x4
        slti x12, x3, 0
        srl x6, x3, x12
        bgeu x6, x6, L681
        sltiu x5, x12, 0
        xori x15, x6, 21
        andi x6, x6, 1
        addi x10, x13, 1987
L681:
        ori x13, x10, -1
        bne x14, x9, L685
        beq x6, x10, L687
        slli x8, x13, 6
L685:
        sltiu x2, x10, -56
        srai x10, x8, 3
L687:
        lhu x1, 254(x20)
        sh x10, 146(x20)
        sh x10, 118(x20)
        sltu x1, x2, x5
        ori x3, x1, 2047
        lhu x13, 10(x20)
        lbu x6, 124(x20)
        lbu x1, 118(x20)
        sll x0, x6, x1
        blt x1, x1, L699
        jal x3, L701
        bltu x1, x1, L702
L699:
        beq x2, x3, L703
        lui x3, 325599
L701:
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x11, x6, 1
L702:
        auipc x16, 0
        addi x16, x16, 16
        jalr x8, 0(x16)
        addi x15, x11, 1
L703:
        andi x13, x3, -1
        slt x14, x13, x8
        sh x13, 14(x20)
        add x1, x1, x10
        auipc x4, 45325
        lb x8, 183(x20)
        sll x7, x13, x2
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x13, x11, 1
        andi x13, x11, -1
        sub x8, x6, x11
        sub x5, x2, x3
        xor x15, x8, x13
        jal x15, L718
        or x6, x15, x15
        sra x10, x6, x6
L718:
        xori x13, x13, -1
        lb x4, 216(x20)
        lbu x10, 194(x20)
        lbu x11, 51(x20)
        bne x11, x11, L724
        sb x4, 21(x20)
L724:
        xor x7, x4, x10
        beq x7, x3, L727
        sw x11, 188(x20)
L727:
        slt x1, x10, x7
        xor x1, x11, x1
        sra x4, x1, x9
        sw x13, 172(x20)
        sra x9, x1, x1
        sw x4, 88(x20)
        lui x14, 916675
        lb x11, 25(x20)
        sltiu x5, x14, -40
        sltu x7, x14, x5
        sb x5, 84(x20)
        sll x6, x12, x11
        srai x7, x7, 6
        xor x9, x12, x10
        lbu x3, 145(x20)
        jal x9, L745
        sb x9, 160(x20)
        lui x1, 176469
L745:
        bgeu x10, x3, L748
        beq x1, x8, L748
        sltiu x6, x2, -2048
L748:
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x1, x5, 1
        lw x14, 28(x20)
        lh x13, 26(x20)
        and x14, x14, x11
        lb x9, 102(x20)
        sw x9, 236(x20)
        beq x13, x9, L757
        lui x13, 41881
        lui x2, 175382
L757:
        sra x9, x2, x9
        sw x9, 52(x20)
        bne x9, x13, L763
        srl x12, x9, x9
        sltiu x13, x0, -1555
        srl x15, x9, x13
L763:
        srli x13, x12, 16
        srli x9, x10, 25
        andi x12, x13, -2048
        srl x3, x11, x13
        slti x0, x9, 1
        xori x15, x12, 1
        or x8, x15, x2
        srl x8, x8, x8
        srli x8, x15, 24
        ori x15, x8, -2048
        or x2, x9, x8
        add x15, x14, x15
        slli x13, x5, 12
        lhu x14, 60(x20)
        lbu x1, 214(x20)
        sw x12, 164(x20)
        lhu x6, 34(x20)
        lh x9, 132(x20)
        lbu x3, 130(x20)
        srai x9, x8, 28
        sw x3, 92(x20)
        slt x15, x3, x9
        bgeu x3, x9, L788
        sh x15, 26(x20)
        sltu x0, x15, x13
L788:
        auipc x1, 696429
        andi x12, x9, 1661
        auipc x16, 0
        addi x16, x16, 16
        jalr x8, 0(x16)
        addi x3, x5, 1
        lw x9, 108(x20)
        bne x13, x12, L796
        lw x8, 196(x20)
        ori x14, x10, -48
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x7, x15, 1
L796:
        or x6, x8, x14
        lbu x7, 110(x20)
        sub x6, x7, x6
        slti x1, x3, -1121
        sltiu x12, x6, 2047
        srl x9, x6, x6
        bge x12, x1, L807
        sll x8, x13, x13
        sra x8, x9, x12
        sb x9, 255(x20)
        lbu x10, 101(x20)
L807:
        addi x9, x15, -640
        sh x3, 42(x20)
        sltu x13, x14, x6
        lw x4, 160(x20)
        auipc x11, 178266
        srai x4, x13, 16
        sw x4, 48(x20)
        lh x8, 6(x20)
        srli x14, x11, 5
        lh x3, 230(x20)
        sb x14, 190(x20)
        addi x10, x3, -2048
        sw x13, 236(x20)
        or x8, x3, x6
        lui x14, 633350
        lbu x14, 237(x20)
        slli x10, x14, 2
        sub x0, x10, x10
        sh x7, 52(x20)
        lh x12, 66(x20)
        lhu x0, 84(x20)
        xori x8, x2, 0
        slti x2, x15, -1
        slt x8, x2, x8
        addi x15, x0, 15
        sb x10, 104(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x6, x7, 1
        or x14, x7, x8
        lb x4, 222(x20)
        andi x11, x14, 6
        xori x7, x9, 1
        addi x14, x7, 54
        sub x7, x7, x14
        slti x12, x14, 1
        sub x1, x4, x8
        lh x1, 252(x20)
        sra x12, x8, x12
        srl x2, x12, x2
        beq x8, x2, L849
        lhu x8, 218(x20)
        or x9, x11, x8
        lb x9, 217(x20)
L849:
        add x13, x10, x8
        add x5, x8, x9
        add x14, x9, x3
        xori x15, x5, -1
        slti x1, x15, -2048
        sw x9, 160(x20)
        or x15, x1, x15
        lhu x4, 154(x20)
        sub x10, x15, x1
        andi x13, x4, 24
        lbu x8, 243(x20)
        srl x5, x10, x10
        lw x13, 172(x20)
        xor x4, x13, x4
        andi x12, x4, 0
        and x5, x13, x13
        sb x12, 41(x20)
        sub x5, x9, x10
        bltu x13, x3, L870
        lhu x9, 232(x20)
        lb x12, 62(x20)
L870:
        srl x5, x9, x9
        srai x3, x9, 16
        addi x4, x2, 1641
        sb x11, 160(x20)
        lw x13, 208(x20)
        add x1, x4, x15
        bge x7, x4, L878
        ori x7, x11, 2047
L878:
        srl x0, x10, x3
        sll x10, x13, x1
        jal x9, L883
        sltu x3, x10, x3
        xori x14, x14, 33
L883:
        sltu x3, x3, x0
        srli x7, x3, 19
        lhu x2, 192(x20)
        addi x6, x3, 1994
        and x11, x6, x15
        lui x15, 464060
        sh x10, 136(x20)
        srai x11, x6, 22
        jal x14, L894
        or x11, x15, x11
        bltu x11, x15, L898
L894:
        lui x11, 933793
        srl x8, x11, x14
        ori x10, x8, 1
        xor x7, x6, x0
L898:
        blt x8, x7, L900
        addi x6, x7, 964
L900:
        ebreak
