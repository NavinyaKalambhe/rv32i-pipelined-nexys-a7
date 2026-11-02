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
        li x10, 527858757
        li x11, 1038467225
        li x12, 1904202612
        li x13, 639840853
        li x14, 1721854523
        li x15, -1661267722
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
        xori x10, x8, -6
        sll x8, x10, x10
        sll x5, x10, x10
        andi x12, x5, -1
        sltu x10, x8, x5
        sltu x6, x11, x12
        xor x1, x12, x12
        srai x8, x6, 2
        lw x4, 100(x20)
        jal x6, L12
        bge x6, x12, L14
        bge x3, x6, L13
L12:
        lbu x12, 174(x20)
L13:
        srli x2, x6, 9
L14:
        lh x1, 246(x20)
        and x5, x13, x1
        andi x0, x2, 21
        sub x6, x5, x14
        sll x8, x10, x6
        jal x8, L23
        sll x8, x6, x8
        beq x8, x12, L24
        sltu x12, x12, x2
L23:
        lhu x12, 134(x20)
L24:
        lh x1, 90(x20)
        andi x5, x11, -1
        lhu x3, 178(x20)
        blt x5, x1, L32
        srl x13, x5, x1
        jal x7, L33
        slt x8, x7, x3
        lbu x3, 112(x20)
L32:
        lb x3, 241(x20)
L33:
        slt x7, x3, x0
        addi x4, x7, -1
        addi x9, x7, -2048
        lb x6, 151(x20)
        jal x14, L40
        sra x10, x14, x12
        slti x6, x6, 0
L40:
        sltiu x15, x5, 2047
        auipc x16, 0
        addi x16, x16, 16
        jalr x8, 0(x16)
        addi x12, x7, 1
        ori x12, x6, -1
        xori x3, x8, 0
        lhu x13, 124(x20)
        slt x13, x3, x3
        sltu x8, x3, x10
        slli x5, x4, 18
        srai x8, x8, 22
        addi x0, x5, 1684
        srai x12, x5, 30
        bge x12, x8, L56
        addi x7, x10, -1
        or x10, x7, x11
        slli x2, x10, 4
        lb x2, 170(x20)
L56:
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x2, x14, 1
        sltu x8, x4, x5
        and x9, x14, x3
        and x7, x1, x9
        beq x9, x0, L63
        slli x5, x12, 9
        auipc x9, 462612
L63:
        or x13, x5, x10
        add x2, x13, x5
        lui x9, 951061
        or x0, x0, x4
        lb x7, 77(x20)
        lbu x15, 59(x20)
        lbu x7, 71(x20)
        ori x13, x15, 1
        lh x7, 150(x20)
        jal x10, L75
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x7, x2, 1
        sra x6, x7, x10
L75:
        sra x4, x6, x11
        sll x2, x6, x0
        sra x6, x4, x2
        blt x1, x0, L82
        beq x11, x6, L82
        and x2, x2, x4
        lh x6, 158(x20)
L82:
        sll x1, x15, x6
        lhu x0, 138(x20)
        or x14, x14, x2
        srai x15, x6, 31
        sra x1, x15, x1
        add x4, x15, x14
        sub x13, x1, x15
        slt x8, x1, x13
        srli x3, x8, 0
        bgeu x13, x13, L95
        xori x3, x8, 1
        lhu x8, 124(x20)
        lb x15, 102(x20)
L95:
        sltiu x13, x8, -2048
        jal x8, L98
        sltu x13, x1, x14
L98:
        sltiu x5, x13, -1
        sub x3, x5, x8
        sh x1, 132(x20)
        add x10, x5, x5
        sw x10, 48(x20)
        srl x6, x15, x14
        xori x1, x6, 2047
        lui x7, 109704
        xor x4, x7, x7
        slt x13, x10, x7
        xor x14, x2, x13
        sltu x4, x4, x4
        sh x3, 244(x20)
        sh x4, 4(x20)
        lui x6, 56726
        lw x9, 196(x20)
        lhu x14, 230(x20)
        auipc x1, 307495
        sh x7, 10(x20)
        sltu x1, x9, x14
        sltu x12, x3, x14
        sw x1, 104(x20)
        blt x14, x1, L123
        lhu x9, 90(x20)
        bge x9, x12, L126
L123:
        and x3, x12, x12
        and x14, x12, x12
        lw x7, 208(x20)
L126:
        sltiu x2, x3, 2047
        sll x6, x2, x2
        auipc x12, 159819
        slt x11, x12, x11
        addi x0, x0, 0
        ori x12, x6, 596
        blt x12, x11, L134
        andi x4, x12, 2047
L134:
        sra x6, x12, x11
        jal x12, L137
        lb x6, 59(x20)
L137:
        sb x12, 175(x20)
        bltu x12, x6, L140
        slli x12, x12, 4
L140:
        or x14, x0, x12
        jal x3, L143
        sb x12, 72(x20)
L143:
        add x4, x14, x3
        auipc x16, 0
        addi x16, x16, 16
        jalr x8, 0(x16)
        addi x9, x2, 1
        jal x11, L149
        xori x9, x4, 1
        srl x0, x14, x14
        sb x8, 173(x20)
L149:
        slti x4, x12, 2047
        addi x13, x4, 0
        lb x4, 209(x20)
        lhu x3, 162(x20)
        ori x0, x4, 0
        sll x15, x12, x13
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x5, x2, 1
        or x14, x15, x15
        srl x8, x2, x15
        lb x0, 4(x20)
        add x4, x8, x10
        sra x11, x8, x10
        srl x3, x9, x13
        auipc x1, 444726
        srli x6, x1, 26
        slt x1, x1, x6
        xor x5, x6, x12
        sltiu x1, x6, 1
        lbu x15, 134(x20)
        ori x1, x6, 0
        andi x1, x0, 0
        ori x9, x1, -1139
        lb x8, 21(x20)
        andi x11, x8, 2047
        sh x9, 232(x20)
        bltu x0, x9, L178
        lh x4, 160(x20)
        andi x10, x8, 1
        xor x3, x10, x10
L178:
        ori x4, x3, 2047
        srli x4, x3, 16
        xori x11, x9, -1342
        sh x11, 48(x20)
        srl x6, x6, x11
        lh x6, 50(x20)
        beq x6, x6, L188
        or x8, x11, x11
        ori x11, x6, -1
        jal x3, L190
L188:
        sb x3, 48(x20)
        srli x14, x11, 27
L190:
        sll x6, x5, x14
        bne x6, x14, L193
        srli x11, x9, 16
L193:
        ori x10, x11, -388
        jal x4, L196
        and x11, x11, x9
L196:
        xor x9, x4, x4
        lb x6, 105(x20)
        lui x14, 591544
        lui x9, 880931
        add x0, x6, x6
        jal x7, L204
        lhu x12, 236(x20)
        srai x1, x12, 10
L204:
        auipc x8, 976636
        bne x1, x7, L207
        sub x11, x8, x1
L207:
        beq x1, x11, L211
        jal x5, L211
        add x9, x5, x11
        bge x11, x11, L213
L211:
        sra x2, x5, x0
        add x8, x15, x7
L213:
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x12, x6, 1
        add x0, x2, x8
        srl x4, x8, x2
        sltu x13, x5, x8
        srl x7, x9, x8
        sw x7, 224(x20)
        addi x9, x7, -729
        sll x0, x12, x10
        xor x15, x13, x15
        sra x10, x7, x12
        slti x9, x14, 1
        addi x8, x9, -249
        lh x6, 48(x20)
        sltiu x13, x9, -43
        lb x15, 20(x20)
        xori x8, x6, -1
        beq x10, x13, L233
        sltiu x6, x3, -1
        add x15, x11, x8
        or x9, x15, x15
L233:
        lui x10, 850368
        jal x8, L236
        xori x10, x10, 0
L236:
        ori x13, x2, 0
        srl x3, x10, x2
        lw x10, 200(x20)
        xori x14, x3, 2047
        blt x4, x10, L244
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x13, x12, 1
        slli x1, x10, 25
        xori x9, x14, -1
L244:
        andi x12, x12, 0
        beq x12, x1, L249
        add x6, x9, x1
        sb x9, 188(x20)
        lbu x5, 55(x20)
L249:
        xor x3, x4, x12
        sh x6, 32(x20)
        lhu x8, 4(x20)
        bgeu x7, x8, L254
        sll x2, x8, x3
L254:
        blt x2, x2, L258
        sw x8, 164(x20)
        xori x1, x10, 0
        lui x7, 456580
L258:
        sub x10, x7, x6
        lw x8, 248(x20)
        lh x10, 40(x20)
        andi x6, x10, -1
        srl x8, x8, x10
        bne x8, x10, L267
        sw x6, 8(x20)
        srl x5, x6, x9
        add x5, x5, x6
L267:
        sh x3, 226(x20)
        xori x12, x8, -49
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x1, x4, 1
        srai x6, x11, 27
        lw x12, 80(x20)
        sw x12, 116(x20)
        lh x8, 116(x20)
        srli x8, x15, 15
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x4, x3, 1
        sll x0, x15, x8
        lbu x14, 57(x20)
        sh x4, 224(x20)
        sh x14, 222(x20)
        srai x3, x11, 31
        slli x10, x11, 20
        sltu x4, x7, x3
        sb x0, 227(x20)
        bne x10, x10, L289
        slt x6, x3, x10
        sh x0, 52(x20)
        sub x5, x6, x10
        sw x4, 112(x20)
L289:
        sltu x9, x14, x4
        lb x0, 49(x20)
        andi x9, x9, 0
        xori x12, x1, -1
        slli x4, x9, 24
        srai x4, x0, 9
        lb x7, 61(x20)
        sra x4, x11, x4
        blt x4, x10, L302
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x15, x8, 1
        jal x4, L303
        slti x11, x5, 1
        sra x14, x0, x11
L302:
        sltiu x8, x11, 28
L303:
        lbu x11, 37(x20)
        lh x6, 18(x20)
        xori x6, x8, 2047
        bltu x6, x1, L309
        andi x9, x11, 2047
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x2, x10, 1
L309:
        xor x13, x8, x9
        addi x6, x9, -238
        srli x6, x3, 31
        sb x6, 242(x20)
        andi x2, x1, -2048
        add x9, x11, x1
        addi x4, x9, -1
        lbu x3, 202(x20)
        lui x7, 952774
        addi x11, x3, -2048
        auipc x2, 228918
        xor x8, x11, x4
        bge x11, x9, L323
        sub x15, x7, x8
L323:
        sh x15, 144(x20)
        sb x8, 198(x20)
        sb x9, 225(x20)
        sb x15, 107(x20)
        sltu x3, x14, x8
        slli x11, x0, 26
        lbu x1, 16(x20)
        andi x7, x15, 19
        addi x1, x14, -1869
        sw x11, 228(x20)
        addi x7, x14, 0
        lb x15, 74(x20)
        jal x14, L338
        slti x4, x15, -1
        xor x10, x4, x4
L338:
        lui x4, 100510
        blt x10, x4, L343
        add x10, x6, x4
        sub x15, x4, x4
        bltu x15, x8, L344
L343:
        andi x6, x4, -1
L344:
        jal x4, L348
        and x8, x15, x4
        add x7, x0, x6
        jal x15, L349
L348:
        blt x15, x8, L351
L349:
        slti x12, x12, 1
        sb x10, 84(x20)
L351:
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x15, x8, 1
        jal x5, L354
        sh x2, 136(x20)
L354:
        jal x14, L356
        slti x5, x15, 965
L356:
        lb x7, 23(x20)
        or x10, x14, x11
        or x12, x7, x13
        slti x5, x0, -1
        slti x5, x9, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x3, x6, 1
        lbu x12, 133(x20)
        sw x2, 216(x20)
        slti x11, x14, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x4, x9, 1
        and x12, x11, x11
        andi x2, x11, -2048
        bne x2, x14, L372
        sll x11, x14, x11
        xori x13, x12, -2048
        sll x3, x9, x2
L372:
        lbu x11, 133(x20)
        xori x1, x13, -880
        sw x11, 96(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x7, x10, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x15, 0(x16)
        addi x13, x11, 1
        sub x8, x9, x5
        beq x12, x15, L381
        and x5, x12, x12
        lbu x11, 45(x20)
L381:
        sra x8, x8, x11
        add x13, x10, x11
        sb x13, 139(x20)
        jal x9, L386
        ori x11, x9, -1
L386:
        sh x9, 108(x20)
        lui x8, 157146
        auipc x16, 0
        addi x16, x16, 16
        jalr x9, 0(x16)
        addi x7, x9, 1
        bltu x9, x9, L392
        slti x7, x12, -2048
        sh x9, 86(x20)
L392:
        xor x14, x11, x8
        srl x13, x7, x7
        add x5, x10, x13
        sw x13, 172(x20)
        sll x7, x1, x11
        jal x5, L399
        beq x5, x5, L400
L399:
        ori x9, x15, 2047
L400:
        bgeu x6, x9, L404
        slti x2, x7, 1
        sw x10, 152(x20)
        xor x4, x6, x5
L404:
        sw x4, 84(x20)
        auipc x8, 262216
        or x15, x5, x10
        addi x3, x6, 61
        xori x11, x9, -1651
        slt x13, x15, x3
        xor x11, x6, x3
        slt x13, x13, x11
        bge x11, x3, L414
        sll x7, x13, x13
L414:
        and x12, x13, x13
        sub x15, x10, x12
        sw x15, 176(x20)
        slt x7, x12, x10
        add x12, x15, x1
        srl x6, x14, x15
        sll x6, x7, x12
        jal x9, L424
        slt x4, x12, x6
        srli x7, x9, 16
L424:
        lw x9, 144(x20)
        auipc x4, 815428
        or x11, x10, x4
        ori x9, x13, -1
        bgeu x11, x4, L431
        slt x13, x11, x10
        sll x7, x7, x13
L431:
        or x9, x7, x2
        lw x6, 200(x20)
        beq x9, x6, L438
        bgeu x8, x6, L438
        ori x8, x7, -2048
        sll x2, x4, x9
        slti x4, x2, 1
L438:
        srl x4, x14, x15
        jal x2, L443
        bgeu x4, x13, L445
        or x11, x2, x4
        sw x3, 244(x20)
L443:
        and x1, x11, x4
        lb x15, 211(x20)
L445:
        bgeu x1, x11, L447
        bgeu x15, x0, L450
L447:
        sra x15, x1, x15
        sll x10, x15, x15
        srl x12, x2, x15
L450:
        sltu x14, x14, x3
        lb x15, 181(x20)
        sw x12, 208(x20)
        sll x6, x12, x14
        jal x2, L456
        sll x3, x6, x15
L456:
        sh x2, 114(x20)
        and x15, x6, x5
        jal x3, L460
        jal x3, L461
L460:
        sra x3, x10, x7
L461:
        srai x8, x3, 21
        bne x3, x7, L465
        srli x10, x3, 14
        lui x0, 247644
L465:
        or x9, x10, x8
        srli x15, x9, 3
        sh x6, 82(x20)
        and x8, x9, x9
        ori x12, x8, 1
        add x14, x15, x9
        lh x6, 242(x20)
        sltu x13, x11, x2
        sb x14, 214(x20)
        sll x4, x6, x13
        or x8, x8, x8
        addi x7, x10, -848
        add x12, x4, x7
        jal x0, L481
        sll x8, x7, x8
        sltiu x3, x8, 0
L481:
        lui x1, 362351
        ori x13, x1, 2047
        slti x4, x11, 0
        sb x4, 20(x20)
        auipc x14, 606175
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x13, x14, 1
        sb x11, 40(x20)
        and x4, x11, x15
        srl x9, x4, x12
        auipc x16, 0
        addi x16, x16, 16
        jalr x9, 0(x16)
        addi x2, x15, 1
        lh x10, 138(x20)
        lh x9, 4(x20)
        sh x10, 164(x20)
        sh x11, 104(x20)
        lw x12, 8(x20)
        beq x10, x9, L501
        sw x10, 88(x20)
        sb x12, 40(x20)
        sh x12, 194(x20)
        beq x12, x4, L505
L501:
        sw x12, 232(x20)
        and x0, x9, x10
        slt x8, x9, x10
        slt x15, x3, x8
L505:
        sll x11, x14, x8
        slli x7, x0, 25
        or x2, x7, x15
        lui x9, 815581
        lb x14, 112(x20)
        lb x0, 232(x20)
        lhu x13, 248(x20)
        sltiu x9, x15, -2048
        jal x9, L515
        lui x5, 19156
L515:
        bgeu x9, x9, L520
        lbu x10, 92(x20)
        xori x14, x10, -2048
        addi x5, x12, -2048
        bge x11, x14, L523
L520:
        lh x12, 84(x20)
        auipc x15, 337211
        sub x5, x5, x10
L523:
        lw x12, 156(x20)
        bne x15, x5, L526
        andi x12, x15, 55
L526:
        lui x4, 122606
        sb x12, 196(x20)
        sltiu x10, x12, 0
        bge x2, x13, L534
        sltu x9, x9, x10
        sw x9, 96(x20)
        sltu x14, x4, x4
        auipc x2, 623354
L534:
        lh x11, 130(x20)
        slli x5, x6, 2
        xor x10, x2, x2
        sltiu x6, x5, 0
        bltu x14, x6, L543
        bltu x1, x10, L542
        sll x10, x13, x9
        addi x1, x10, -34
L542:
        sltu x7, x6, x6
L543:
        addi x15, x12, -2048
        srli x2, x15, 15
        lw x3, 116(x20)
        ori x12, x13, 2047
        ori x7, x13, -2048
        sw x9, 84(x20)
        xor x0, x1, x3
        and x6, x13, x15
        slli x7, x6, 1
        sltu x2, x7, x1
        sw x6, 56(x20)
        andi x15, x2, 0
        andi x7, x7, 1
        lhu x11, 212(x20)
        lbu x11, 247(x20)
        slti x4, x7, 1
        sll x14, x3, x4
        add x5, x10, x11
        sltu x7, x5, x15
        jal x14, L566
        lbu x3, 71(x20)
        sub x2, x3, x3
        addi x14, x2, -2048
L566:
        sh x2, 118(x20)
        lh x4, 120(x20)
        sltu x0, x14, x14
        bne x2, x11, L573
        bltu x4, x6, L575
        lw x3, 56(x20)
        lw x1, 120(x20)
L573:
        bltu x4, x3, L578
        sw x4, 8(x20)
L575:
        or x4, x13, x4
        add x1, x10, x1
        lbu x6, 119(x20)
L578:
        xori x5, x0, 2047
        sra x2, x14, x1
        bgeu x5, x15, L585
        auipc x2, 349534
        sltu x11, x14, x12
        or x6, x2, x8
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x8, x15, 1
L585:
        slli x13, x6, 6
        sll x14, x6, x6
        slli x2, x13, 2
        slli x12, x14, 21
        addi x4, x2, -138
        srl x1, x15, x4
        and x6, x4, x4
        srl x11, x0, x6
        bgeu x1, x11, L597
        lb x7, 155(x20)
        lbu x15, 118(x20)
        bltu x4, x13, L600
L597:
        ori x8, x4, 2047
        blt x0, x11, L600
        srl x4, x15, x8
L600:
        sll x1, x7, x4
        or x4, x4, x8
        srai x11, x1, 28
        jal x14, L606
        jal x14, L606
        add x2, x11, x11
L606:
        addi x5, x2, -1368
        blt x0, x15, L610
        bgeu x2, x5, L610
        sb x2, 63(x20)
L610:
        srli x12, x15, 17
        bne x12, x4, L614
        slti x9, x12, 2047
        slli x10, x5, 29
L614:
        sltu x3, x12, x12
        sh x10, 86(x20)
        ori x15, x10, -1954
        andi x11, x3, 1
        xor x12, x1, x3
        lb x15, 127(x20)
        add x15, x12, x8
        jal x11, L623
        slti x7, x15, 0
L623:
        sub x9, x7, x11
        auipc x16, 0
        addi x16, x16, 16
        jalr x8, 0(x16)
        addi x4, x2, 1
        srl x12, x7, x11
        slt x13, x5, x8
        bge x8, x12, L632
        andi x6, x13, -375
        lui x2, 911034
        lh x3, 166(x20)
        bgeu x6, x1, L635
L632:
        xor x2, x14, x0
        andi x0, x2, 1
        slti x6, x6, -2048
L635:
        or x1, x11, x14
        lw x6, 164(x20)
        srai x13, x1, 1
        lbu x15, 225(x20)
        sub x13, x7, x6
        lbu x4, 204(x20)
        ori x2, x15, -4
        and x7, x2, x13
        lb x1, 149(x20)
        xor x15, x1, x1
        srli x3, x11, 31
        bne x1, x14, L651
        auipc x16, 0
        addi x16, x16, 16
        jalr x4, 0(x16)
        addi x15, x2, 1
        sw x13, 252(x20)
        bge x3, x15, L654
        sltu x9, x10, x3
L651:
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x4, x1, 1
        xori x10, x3, -2048
        slli x6, x5, 17
L654:
        xor x11, x10, x10
        lbu x10, 255(x20)
        sub x5, x1, x7
        xor x8, x2, x9
        sw x5, 208(x20)
        sw x8, 220(x20)
        lb x3, 181(x20)
        add x4, x3, x5
        slti x12, x6, 2047
        sll x13, x3, x12
        bltu x14, x6, L668
        xori x7, x11, -2048
        srai x15, x4, 0
        and x10, x15, x2
L668:
        lbu x12, 191(x20)
        slli x14, x1, 31
        srl x5, x9, x12
        bltu x5, x8, L675
        blt x13, x5, L676
        sh x1, 160(x20)
        lw x1, 156(x20)
L675:
        xor x4, x14, x5
L676:
        or x0, x5, x14
        andi x8, x4, -25
        srai x0, x8, 0
        sll x9, x1, x7
        ori x9, x9, 0
        xor x2, x9, x9
        jal x12, L686
        andi x2, x14, 0
        bne x2, x6, L687
        lbu x12, 11(x20)
L686:
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x10, x12, 1
L687:
        slt x3, x12, x2
        and x10, x2, x12
        bltu x4, x10, L693
        bge x3, x10, L692
        sltiu x11, x10, -1
L692:
        addi x2, x8, 0
L693:
        slt x15, x2, x10
        add x6, x6, x11
        lhu x15, 78(x20)
        lh x3, 46(x20)
        sb x6, 162(x20)
        add x3, x3, x6
        sltu x12, x15, x3
        beq x13, x8, L705
        slli x3, x12, 30
        and x10, x3, x2
        bne x11, x12, L708
        sh x10, 50(x20)
L705:
        sll x0, x12, x12
        bge x11, x12, L708
        sra x15, x3, x10
L708:
        lh x8, 8(x20)
        sb x6, 84(x20)
        xori x2, x15, -1
        srai x3, x15, 12
        lw x14, 232(x20)
        andi x15, x2, 1
        slti x2, x11, 0
        andi x10, x15, 2047
        sub x11, x8, x10
        slt x15, x11, x2
        lbu x1, 148(x20)
        slli x11, x0, 19
        srai x11, x1, 0
        auipc x9, 63354
        sra x13, x11, x10
        ori x12, x9, 2047
        lui x3, 593975
        and x2, x12, x12
        ori x2, x13, -1
        ori x15, x3, 2047
        xori x0, x2, -58
        beq x2, x2, L734
        slt x5, x15, x15
        sra x3, x10, x15
        jal x8, L736
        auipc x16, 0
        addi x16, x16, 16
        jalr x6, 0(x16)
        addi x7, x7, 1
L734:
        slti x6, x6, -22
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x5, x11, 1
L736:
        slt x10, x5, x9
        auipc x16, 0
        addi x16, x16, 16
        jalr x15, 0(x16)
        addi x14, x15, 1
        bne x7, x5, L741
        lw x13, 88(x20)
        lbu x3, 7(x20)
L741:
        andi x3, x15, 2047
        xori x3, x3, -1
        auipc x11, 608987
        lh x8, 30(x20)
        slti x10, x13, 2047
        sh x8, 140(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x15, 0(x16)
        addi x6, x9, 1
        ori x15, x0, 1
        srli x4, x15, 5
        sltu x0, x15, x15
        slli x2, x6, 4
        lui x13, 210828
        auipc x7, 583093
        sra x0, x0, x13
        lui x10, 149074
        lbu x14, 61(x20)
        srai x13, x7, 0
        bne x13, x0, L760
        ori x15, x10, -2048
L760:
        sw x14, 172(x20)
        lbu x2, 146(x20)
        or x11, x2, x15
        bge x0, x11, L767
        srai x1, x6, 22
        xori x15, x13, 1
        sltu x9, x1, x10
L767:
        sltu x11, x12, x13
        slt x3, x15, x15
        ori x1, x3, -1
        srli x15, x14, 25
        lw x14, 148(x20)
        lhu x11, 54(x20)
        lui x1, 753397
        srai x0, x1, 25
        sll x8, x14, x0
        slt x7, x8, x11
        lhu x0, 170(x20)
        addi x7, x1, 828
        xor x3, x2, x8
        lh x1, 128(x20)
        sw x8, 112(x20)
        lh x12, 200(x20)
        xori x13, x12, 0
        beq x13, x12, L786
        sltiu x15, x12, 1
L786:
        lh x4, 196(x20)
        slt x10, x15, x4
        jal x6, L792
        sub x7, x6, x4
        xori x2, x8, -47
        jal x9, L794
L792:
        xori x1, x2, -1
        beq x9, x9, L795
L794:
        or x2, x12, x9
L795:
        slti x14, x7, -1
        xor x4, x12, x8
        sra x15, x2, x4
        ori x4, x15, -36
        bltu x11, x4, L801
        bgeu x15, x4, L803
L801:
        addi x10, x8, 2047
        sra x10, x0, x4
L803:
        lb x4, 179(x20)
        slt x10, x10, x4
        lhu x0, 106(x20)
        add x10, x10, x10
        blt x10, x10, L812
        bgeu x10, x4, L811
        bltu x12, x10, L811
        addi x5, x4, 1
L811:
        xor x6, x10, x10
L812:
        blt x6, x15, L815
        slli x11, x10, 2
        lui x14, 1027774
L815:
        add x14, x13, x13
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x10, x1, 1
        sltiu x1, x13, -2048
        bgeu x1, x1, L820
        xori x1, x7, -1
L820:
        srl x8, x5, x14
        bltu x0, x11, L825
        addi x11, x1, 2047
        lw x12, 204(x20)
        sh x11, 240(x20)
L825:
        sll x12, x1, x12
        andi x3, x11, 1
        bltu x12, x3, L830
        xori x14, x4, -2048
        auipc x5, 236658
L830:
        bne x5, x5, L833
        ori x2, x5, 1
        xori x2, x14, 1
L833:
        sub x4, x2, x2
        sb x2, 169(x20)
        slli x15, x4, 29
        or x0, x4, x15
        sltu x11, x2, x4
        xori x14, x4, -2048
        jal x5, L843
        andi x10, x0, -2048
        bltu x14, x4, L843
        sra x15, x14, x10
L843:
        bltu x15, x10, L846
        sh x15, 106(x20)
        sh x15, 20(x20)
L846:
        sb x15, 81(x20)
        bge x10, x10, L852
        lui x9, 230827
        blt x0, x15, L851
        jal x11, L854
L851:
        sltu x5, x6, x15
L852:
        jal x4, L856
        auipc x11, 623517
L854:
        ori x6, x3, -1096
        ori x4, x11, 0
L856:
        lhu x1, 58(x20)
        andi x13, x1, 0
        addi x4, x1, -1639
        slti x8, x11, 0
        auipc x14, 893308
        slti x7, x3, 962
        lh x3, 198(x20)
        andi x4, x14, -2048
        sra x13, x4, x5
        lhu x10, 60(x20)
        beq x4, x4, L870
        slt x14, x10, x10
        jal x1, L870
        sub x6, x14, x14
L870:
        add x6, x11, x14
        xor x0, x0, x1
        or x5, x3, x12
        sll x14, x6, x6
        sll x8, x9, x5
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x12, x7, 1
        lh x13, 174(x20)
        lhu x10, 98(x20)
        lbu x10, 50(x20)
        lh x14, 168(x20)
        srl x2, x9, x3
        xori x8, x10, 0
        sra x2, x8, x8
        srl x10, x9, x2
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x13, x4, 1
        bne x5, x12, L889
        addi x4, x7, -44
        or x2, x1, x10
        sltiu x13, x2, 1
L889:
        lui x13, 812820
        beq x2, x13, L892
        slli x4, x2, 10
L892:
        srl x9, x7, x4
        sltiu x15, x1, -1
        slti x0, x0, 2047
        jal x0, L897
        sb x15, 180(x20)
L897:
        and x7, x9, x4
        bgeu x15, x15, L902
        jal x3, L903
L902:
L903:
        ebreak
