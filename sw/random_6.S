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
        li x10, 1382782102
        li x11, -1023827911
        li x12, -2145543544
        li x13, -544772047
        li x14, 1160241785
        li x15, -976254300
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
        sw x4, 208(x20)
        srl x2, x9, x3
        xori x13, x2, 0
        jal x14, L7
        lh x15, 248(x20)
        xor x7, x15, x1
        ori x9, x14, -2048
L7:
        lh x4, 100(x20)
        sll x0, x4, x7
        sltiu x7, x10, 320
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x10, x12, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x8, 0(x16)
        addi x4, x13, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x14, x15, 1
        addi x8, x13, 0
        add x0, x15, x8
        sra x9, x11, x8
        and x8, x8, x9
        srli x8, x0, 20
        xori x5, x8, 2047
        sb x5, 148(x20)
        ori x2, x8, 2047
        bne x5, x14, L23
        sw x8, 248(x20)
L23:
        and x1, x8, x8
        lb x0, 53(x20)
        andi x0, x3, 1
        lh x1, 230(x20)
        sb x15, 96(x20)
        sltiu x10, x1, -1
        sltu x8, x3, x1
        andi x14, x2, -95
        srl x2, x10, x7
        sra x3, x13, x14
        sll x12, x14, x3
        and x3, x3, x8
        slti x1, x12, -16
        addi x9, x3, -932
        srai x3, x9, 10
        lbu x1, 196(x20)
        xor x1, x4, x4
        srai x5, x8, 5
        slti x8, x2, -1065
        auipc x16, 0
        addi x16, x16, 16
        jalr x15, 0(x16)
        addi x1, x13, 1
        bgeu x9, x5, L48
        sw x5, 108(x20)
        and x1, x11, x3
        addi x12, x8, 742
        blt x15, x1, L49
L48:
        slt x7, x3, x9
L49:
        srli x7, x7, 30
        bne x12, x7, L54
        or x3, x12, x1
        lui x9, 986595
        add x5, x13, x3
L54:
        andi x1, x5, 0
        andi x7, x8, -32
        bltu x2, x1, L59
        bgeu x1, x3, L61
        or x13, x7, x5
L59:
        lb x11, 44(x20)
        sb x11, 179(x20)
L61:
        sb x8, 89(x20)
        lhu x12, 234(x20)
        lhu x12, 100(x20)
        add x11, x12, x9
        sltu x2, x15, x12
        andi x6, x4, -1
        lhu x9, 206(x20)
        beq x12, x2, L71
        lhu x2, 134(x20)
        slti x5, x2, -2048
L71:
        lh x15, 230(x20)
        lb x10, 127(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x8, x9, 1
        srli x0, x15, 13
        lui x5, 634529
        lh x3, 110(x20)
        lui x6, 387837
        slti x15, x6, 894
        sh x15, 26(x20)
        sra x9, x3, x2
        bltu x15, x15, L85
        sb x6, 212(x20)
        jal x6, L85
        sw x15, 28(x20)
L85:
        xor x0, x15, x9
        sub x5, x9, x6
        sh x8, 130(x20)
        sb x6, 194(x20)
        lb x3, 54(x20)
        lui x4, 146270
        sb x5, 69(x20)
        sw x0, 164(x20)
        lhu x10, 230(x20)
        slti x3, x4, -2048
        sltiu x10, x3, -470
        xor x8, x10, x2
        lhu x9, 192(x20)
        lh x10, 28(x20)
        sra x3, x10, x8
        sltiu x7, x10, -61
        bge x10, x12, L103
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x8, x9, 1
L103:
        slt x9, x3, x3
        xor x1, x9, x13
        lhu x14, 152(x20)
        sb x9, 8(x20)
        or x6, x9, x9
        jal x6, L111
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x15, x4, 1
        bge x6, x6, L114
L111:
        lh x15, 96(x20)
        auipc x15, 97949
        lb x2, 39(x20)
L114:
        lbu x10, 50(x20)
        slti x13, x10, -1
        sltu x9, x2, x1
        bgeu x9, x9, L120
        bge x6, x7, L120
        lh x7, 214(x20)
L120:
        lhu x4, 110(x20)
        sh x11, 24(x20)
        sltiu x14, x7, -2048
        jal x4, L127
        lw x1, 88(x20)
        slt x1, x4, x14
        jal x0, L130
L127:
        sltiu x1, x4, -1
        lb x10, 179(x20)
        lb x4, 124(x20)
L130:
        slt x10, x1, x11
        sh x10, 26(x20)
        auipc x4, 611851
        slt x3, x10, x4
        auipc x2, 83347
        ori x7, x3, 1418
        addi x2, x8, 0
        lhu x15, 170(x20)
        lb x4, 37(x20)
        xor x14, x8, x1
        slt x1, x4, x4
        sra x9, x12, x4
        srl x11, x7, x4
        and x11, x11, x4
        sw x9, 184(x20)
        xori x4, x11, 42
        sb x4, 119(x20)
        or x7, x4, x11
        slt x10, x11, x11
        sub x12, x11, x13
        slti x10, x15, 0
        lui x10, 984013
        lw x5, 0(x20)
        add x12, x10, x5
        ori x6, x12, 18
        sb x15, 129(x20)
        lui x11, 506918
        add x6, x4, x12
        sltu x4, x2, x11
        addi x13, x11, 2047
        xor x14, x13, x4
        add x11, x4, x13
        addi x12, x13, 1
        or x0, x12, x12
        bgeu x11, x11, L166
        bge x3, x11, L170
L166:
        add x2, x5, x14
        slt x2, x7, x12
        auipc x10, 751797
        slt x12, x2, x2
L170:
        slt x14, x12, x9
        bne x12, x10, L173
        beq x10, x3, L174
L173:
        xori x11, x14, 1
L174:
        srl x11, x5, x10
        auipc x16, 0
        addi x16, x16, 16
        jalr x6, 0(x16)
        addi x2, x5, 1
        srli x12, x6, 20
        sh x6, 190(x20)
        lw x15, 148(x20)
        add x5, x12, x12
        lw x8, 144(x20)
        slt x6, x8, x5
        slli x9, x6, 29
        lbu x6, 252(x20)
        bltu x0, x6, L187
        slt x14, x9, x6
        bltu x0, x9, L188
L187:
        auipc x14, 96176
L188:
        slli x7, x14, 17
        lh x4, 114(x20)
        sra x1, x7, x4
        sw x7, 220(x20)
        sltu x9, x4, x4
        slli x1, x9, 21
        slti x5, x9, 0
        sw x13, 32(x20)
        andi x3, x3, 260
        and x0, x5, x2
        lhu x13, 148(x20)
        beq x13, x5, L203
        lui x1, 16125
        slti x3, x13, 2047
        sll x1, x13, x1
L203:
        lui x13, 390320
        srli x13, x3, 5
        slli x5, x13, 9
        auipc x16, 0
        addi x16, x16, 16
        jalr x15, 0(x16)
        addi x6, x15, 1
        and x6, x8, x13
        lb x7, 201(x20)
        ori x7, x15, 52
        sra x8, x7, x7
        sra x6, x4, x7
        srl x5, x6, x6
        sub x14, x13, x0
        sltu x11, x5, x14
        sh x11, 0(x20)
        and x15, x14, x3
        slti x14, x15, 1
        lb x9, 8(x20)
        sll x8, x15, x3
        xori x0, x8, 1
        xor x11, x6, x14
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x2, x9, 1
        slti x1, x4, 1
        jal x8, L227
        sltiu x14, x8, -1
        sub x2, x10, x8
L227:
        slti x13, x2, -2048
        lbu x10, 87(x20)
        auipc x1, 192053
        sub x9, x10, x3
        sw x10, 52(x20)
        add x14, x1, x10
        sh x2, 170(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x14, x1, 1
        addi x1, x8, 2047
        sh x1, 182(x20)
        lh x3, 14(x20)
        srl x5, x8, x11
        srli x4, x1, 31
        slti x12, x0, -918
        bltu x4, x6, L244
        jal x15, L245
        lw x9, 100(x20)
L244:
        ori x0, x1, 0
L245:
        auipc x16, 0
        addi x16, x16, 16
        jalr x8, 0(x16)
        addi x7, x12, 1
        xor x11, x9, x3
        slt x12, x12, x8
        srli x0, x12, 6
        andi x4, x12, -61
        srl x0, x12, x4
        and x1, x6, x4
        slti x4, x4, -41
        sh x1, 100(x20)
        bge x4, x1, L258
        sub x3, x7, x1
        jal x5, L258
        lui x8, 1040269
L258:
        jal x8, L262
        sh x2, 130(x20)
        blt x8, x10, L264
        sh x8, 24(x20)
L262:
        sra x2, x8, x8
        auipc x16, 0
        addi x16, x16, 16
        jalr x9, 0(x16)
        addi x4, x6, 1
L264:
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x6, x6, 1
        sh x2, 186(x20)
        slt x2, x2, x4
        sltu x10, x7, x9
        blt x10, x7, L271
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x10, x2, 1
        jal x4, L273
L271:
        andi x5, x4, 32
        srai x3, x4, 9
L273:
        bgeu x1, x15, L277
        lh x5, 240(x20)
        slli x12, x5, 16
        sll x12, x5, x5
L277:
        and x4, x8, x2
        bne x12, x12, L281
        or x10, x12, x12
        sh x12, 178(x20)
L281:
        slti x11, x12, -1
        andi x12, x4, 1
        sltu x12, x15, x6
        srai x6, x11, 15
        sltu x14, x1, x12
        lhu x9, 106(x20)
        add x1, x5, x14
        lbu x13, 143(x20)
        xor x3, x1, x13
        bne x10, x13, L294
        srli x7, x13, 23
        slt x4, x0, x13
        and x1, x4, x3
L294:
        jal x4, L298
        srai x11, x1, 0
        lb x1, 19(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x15, x1, 1
L298:
        lui x10, 931572
        and x14, x4, x13
        slt x15, x11, x12
        lb x3, 1(x20)
        lbu x1, 116(x20)
        srl x7, x1, x1
        slti x12, x3, -1
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x3, x4, 1
        sb x8, 115(x20)
        slt x9, x1, x14
        lh x9, 246(x20)
        sltu x4, x1, x9
        srai x13, x4, 25
        srl x5, x12, x13
        xor x6, x4, x7
        lui x4, 749026
        and x10, x4, x5
        slli x13, x4, 4
        jal x6, L320
        add x1, x13, x13
        andi x3, x6, -42
        sra x7, x1, x1
L320:
        sltu x7, x1, x1
        sltu x13, x7, x3
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x14, x10, 1
        auipc x9, 124122
        andi x7, x9, -2048
        auipc x15, 890950
        addi x9, x2, 861
        blt x7, x7, L331
        sw x7, 208(x20)
        and x1, x7, x7
        slti x15, x9, -7
L331:
        sh x3, 236(x20)
        bltu x1, x9, L334
        and x5, x1, x1
L334:
        srai x15, x1, 8
        sb x3, 0(x20)
        jal x12, L339
        jal x4, L341
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x4, x5, 1
L339:
        bgeu x5, x12, L341
        sra x7, x3, x10
L341:
        xor x9, x3, x7
        lhu x15, 50(x20)
        xori x1, x9, 0
        or x15, x0, x9
        xori x13, x2, 44
        auipc x0, 468227
        or x1, x15, x13
        blt x14, x1, L351
        addi x14, x13, -10
        jal x14, L352
L351:
        lhu x9, 244(x20)
L352:
        slli x11, x13, 5
        slli x9, x9, 2
        lw x2, 168(x20)
        lhu x3, 170(x20)
        srai x13, x9, 12
        sra x10, x3, x10
        ori x5, x14, 2047
        sltiu x14, x13, 1
        srai x10, x8, 9
        sw x14, 212(x20)
        lh x6, 242(x20)
        auipc x2, 231057
        sw x12, 32(x20)
        xori x2, x14, 1
        lw x11, 72(x20)
        beq x6, x2, L371
        lh x1, 150(x20)
        andi x11, x1, -2048
        lhu x12, 2(x20)
L371:
        andi x8, x12, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x2, x13, 1
        xor x0, x9, x9
        addi x14, x14, -2048
        andi x2, x8, -22
        ori x10, x14, 1
        slli x13, x0, 11
        sll x5, x13, x10
        beq x13, x10, L382
        sltiu x13, x5, 1
        jal x11, L384
L382:
        blt x11, x15, L385
        lhu x10, 244(x20)
L384:
        bltu x15, x11, L389
L385:
        andi x14, x11, 57
        sub x12, x10, x10
        sw x8, 0(x20)
        add x3, x0, x3
L389:
        srl x14, x14, x14
        slli x2, x12, 31
        bne x14, x3, L393
        srli x6, x3, 26
L393:
        jal x13, L395
        sw x4, 176(x20)
L395:
        slt x1, x2, x2
        add x9, x1, x13
        andi x0, x13, -330
        or x14, x0, x0
        and x6, x3, x14
        sltiu x11, x9, -1
        srai x8, x6, 2
        and x3, x4, x12
        lw x10, 236(x20)
        xori x7, x10, -1585
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x8, x6, 1
        lw x2, 72(x20)
        andi x6, x7, 2047
        sh x10, 220(x20)
        beq x15, x9, L412
        slli x2, x6, 25
        bne x2, x2, L416
L412:
        bne x6, x3, L415
        xor x2, x9, x6
        beq x10, x6, L416
L415:
        jal x11, L418
L416:
        sltu x10, x11, x12
        srl x13, x11, x10
L418:
        or x11, x10, x10
        srai x12, x10, 21
        addi x0, x13, -809
        jal x13, L424
        xor x10, x4, x13
        lh x8, 166(x20)
L424:
        lui x1, 432779
        jal x6, L427
        sra x4, x6, x0
L427:
        sltiu x7, x15, 276
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x8, x5, 1
        add x13, x8, x0
        srli x9, x7, 20
        sltu x0, x9, x14
        lb x2, 154(x20)
        slt x0, x13, x9
        sw x13, 44(x20)
        slt x14, x2, x9
        add x4, x14, x14
        addi x8, x5, 0
        blt x4, x8, L442
        sltu x7, x4, x8
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x14, x5, 1
        addi x2, x8, 0
L442:
        slt x14, x11, x7
        andi x13, x12, 1321
        andi x14, x6, 2047
        sw x13, 216(x20)
        bge x13, x1, L451
        slti x5, x9, 2047
        sltu x7, x7, x13
        slti x12, x15, 633
        xor x0, x12, x13
L451:
        addi x3, x12, -2048
        srli x0, x7, 24
        beq x11, x5, L457
        lb x7, 232(x20)
        sltu x1, x4, x6
        sb x1, 208(x20)
L457:
        slti x2, x6, -2048
        sltu x13, x4, x2
        lhu x7, 50(x20)
        bgeu x8, x13, L465
        beq x7, x7, L463
        srl x9, x11, x13
L463:
        sub x7, x13, x7
        ori x2, x7, 1
L465:
        ori x13, x9, 536
        auipc x7, 271833
        jal x5, L469
        andi x13, x14, 2047
L469:
        add x6, x7, x0
        auipc x16, 0
        addi x16, x16, 16
        jalr x0, 0(x16)
        addi x9, x15, 1
        sltiu x13, x5, 0
        sub x6, x8, x6
        lbu x4, 227(x20)
        slt x5, x13, x4
        jal x2, L478
        jal x6, L479
        jal x4, L480
L478:
        sh x5, 16(x20)
L479:
        sltiu x4, x10, 2047
L480:
        lh x0, 102(x20)
        bgeu x4, x4, L483
        bne x5, x4, L484
L483:
        jal x13, L485
L484:
        lui x9, 902883
L485:
        add x8, x9, x13
        lb x5, 119(x20)
        sub x3, x9, x2
        jal x12, L492
        bgeu x7, x5, L493
        sll x9, x5, x5
        sra x5, x1, x14
L492:
        jal x4, L495
L493:
        sw x9, 44(x20)
        sra x15, x6, x4
L495:
        add x7, x5, x4
        srl x5, x4, x15
        sra x8, x14, x15
        bgeu x7, x7, L502
        sub x5, x3, x5
        lui x4, 526981
        addi x14, x8, 0
L502:
        lui x2, 195774
        sb x4, 207(x20)
        sltu x0, x4, x2
        bne x2, x2, L509
        bne x5, x4, L508
        sh x2, 90(x20)
L508:
        ori x9, x15, 0
L509:
        sub x11, x9, x1
        andi x7, x11, 230
        bltu x7, x0, L515
        add x15, x15, x11
        sb x7, 74(x20)
        sb x15, 8(x20)
L515:
        sub x11, x13, x11
        andi x10, x7, -1
        sb x10, 110(x20)
        andi x11, x1, 1
        or x1, x15, x11
        sra x2, x5, x11
        srli x9, x11, 20
        sll x1, x9, x2
        lb x11, 201(x20)
        addi x1, x1, -924
        lb x3, 41(x20)
        xor x7, x11, x1
        sb x3, 179(x20)
        lb x15, 228(x20)
        sltu x2, x3, x13
        slti x5, x2, -2048
        jal x5, L535
        lb x3, 234(x20)
        slli x12, x3, 28
        jal x9, L537
L535:
        lui x4, 481740
        sll x15, x9, x12
L537:
        sb x2, 31(x20)
        bltu x9, x1, L540
        bgeu x4, x9, L544
L540:
        sb x5, 5(x20)
        sw x7, 128(x20)
        jal x0, L544
        ori x2, x15, 390
L544:
        srai x0, x2, 31
        srai x2, x4, 12
        andi x4, x2, -43
        auipc x12, 858964
        lbu x12, 77(x20)
        slti x11, x12, -2048
        andi x1, x12, 1
        blt x9, x15, L556
        add x6, x11, x12
        add x15, x12, x11
        slli x12, x6, 20
        jal x7, L557
L556:
        jal x12, L559
L557:
        lui x9, 957742
        slt x0, x6, x4
L559:
        sub x15, x14, x9
        addi x11, x12, 2047
        sw x11, 228(x20)
        sltiu x1, x11, 1
        sb x11, 149(x20)
        or x11, x15, x1
        sh x11, 160(x20)
        bgeu x11, x10, L570
        sll x13, x11, x1
        sw x0, 116(x20)
        srai x13, x10, 20
L570:
        and x15, x11, x13
        ori x10, x13, -2048
        and x6, x1, x9
        sltiu x7, x12, -1
        srli x6, x6, 26
        add x2, x6, x7
        sb x7, 56(x20)
        bltu x8, x2, L580
        lh x15, 90(x20)
        xor x10, x10, x5
L580:
        slli x13, x15, 19
        lui x3, 207565
        sub x14, x3, x13
        xori x2, x14, 1
        addi x7, x3, 2047
        srl x2, x3, x2
        lhu x13, 126(x20)
        sltu x1, x1, x7
        bge x6, x2, L592
        slt x13, x13, x1
        bge x13, x1, L595
        lui x0, 83565
L592:
        sltiu x6, x8, 2047
        xor x14, x1, x13
        or x9, x13, x1
L595:
        sll x11, x13, x11
        addi x6, x11, -9
        lbu x15, 175(x20)
        sltiu x3, x11, 2047
        xori x4, x3, 2047
        addi x12, x9, -1858
        jal x7, L605
        srli x8, x10, 18
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x5, x3, 1
        sra x11, x8, x7
L605:
        andi x5, x10, 62
        bgeu x11, x10, L609
        xori x3, x10, 0
        and x13, x0, x5
L609:
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x3, x3, 1
        jal x3, L614
        ori x12, x13, -2048
        sll x10, x7, x10
        addi x7, x12, -1
L614:
        slti x12, x7, -1
        or x4, x10, x7
        sw x1, 60(x20)
        lh x10, 78(x20)
        andi x13, x4, 0
        sub x2, x10, x13
        beq x10, x6, L623
        addi x14, x14, 1549
        beq x2, x15, L625
L623:
        sra x3, x13, x2
        blt x14, x8, L629
L625:
        add x14, x2, x2
        lui x7, 89280
        sh x7, 122(x20)
        auipc x12, 632582
L629:
        auipc x12, 529895
        lh x8, 70(x20)
        slti x3, x12, -2048
        sra x2, x9, x8
        or x3, x8, x8
        srai x15, x2, 30
        srl x9, x2, x11
        sll x8, x5, x7
        sub x5, x4, x9
        srli x13, x9, 5
        add x6, x13, x10
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x2, x8, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x13, x11, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x2, x12, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x4, 0(x16)
        addi x15, x9, 1
        lbu x14, 198(x20)
        addi x7, x2, 102
        lb x0, 161(x20)
        xor x7, x15, x6
        lb x1, 60(x20)
        xor x5, x7, x5
        sw x7, 224(x20)
        sb x4, 54(x20)
        or x11, x1, x4
        slti x13, x5, -1376
        srl x8, x11, x5
        sltiu x5, x8, -1
        auipc x12, 995839
        slt x8, x2, x5
        sw x10, 32(x20)
        xor x11, x3, x12
        sw x11, 44(x20)
        sra x0, x4, x8
        lbu x15, 74(x20)
        sub x1, x11, x2
        srai x6, x11, 22
        sltu x15, x9, x15
        sub x8, x1, x13
        sltiu x4, x4, 0
        blt x13, x7, L671
        and x1, x7, x2
        slli x14, x4, 11
L671:
        lbu x3, 162(x20)
        xori x9, x14, 19
        sltu x8, x9, x11
        xor x0, x3, x3
        xori x11, x3, -1
        sra x11, x8, x9
        lh x8, 0(x20)
        srai x14, x8, 6
        srai x14, x10, 19
        and x4, x14, x14
        sb x6, 95(x20)
        jal x10, L685
        auipc x5, 266721
        xor x13, x6, x4
L685:
        srai x1, x0, 1
        slt x10, x1, x15
        slti x10, x0, 58
        and x13, x1, x5
        xor x5, x10, x13
        andi x5, x10, 0
        add x1, x5, x5
        auipc x16, 0
        addi x16, x16, 16
        jalr x6, 0(x16)
        addi x1, x7, 1
        lw x3, 168(x20)
        lh x8, 44(x20)
        bge x8, x6, L698
        or x1, x0, x13
        slt x1, x8, x1
L698:
        auipc x15, 886908
        and x8, x5, x6
        lb x8, 15(x20)
        andi x3, x8, -1
        jal x4, L706
        beq x8, x12, L707
        xor x8, x8, x3
        lhu x11, 164(x20)
L706:
        lui x1, 621848
L707:
        xor x2, x8, x1
        sltiu x1, x1, 0
        sw x2, 188(x20)
        slti x0, x1, 1
        and x5, x1, x14
        jal x7, L714
        sb x1, 94(x20)
L714:
        andi x14, x1, 2047
        or x13, x7, x8
        sh x4, 140(x20)
        auipc x2, 937272
        sltiu x7, x14, 643
        sll x0, x13, x7
        sb x6, 176(x20)
        addi x6, x2, 750
        slti x9, x2, 1
        sll x5, x7, x5
        addi x4, x9, -2048
        blt x14, x4, L730
        sra x5, x4, x9
        lhu x1, 202(x20)
        sb x1, 128(x20)
        bltu x7, x14, L734
L730:
        auipc x14, 542331
        addi x13, x1, -1
        add x1, x15, x1
        slti x10, x14, 2047
L734:
        auipc x9, 286313
        sra x10, x5, x1
        sb x10, 83(x20)
        lb x12, 107(x20)
        sltu x6, x10, x3
        sltiu x10, x12, -101
        slt x8, x15, x7
        jal x4, L745
        sll x10, x4, x6
        sb x15, 11(x20)
        lb x5, 150(x20)
L745:
        lh x9, 60(x20)
        bgeu x4, x5, L749
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x13, x6, 1
        slti x10, x14, -147
L749:
        ori x7, x14, -2048
        addi x12, x12, 2047
        srl x15, x7, x12
        bne x15, x14, L756
        andi x5, x6, 1
        sra x9, x13, x15
        sltu x5, x11, x9
L756:
        auipc x6, 805454
        sll x3, x5, x10
        srl x13, x13, x6
        or x8, x6, x13
        add x6, x8, x3
        sltu x11, x8, x4
        slli x7, x6, 1
        ori x6, x14, 2047
        xori x10, x13, -1
        add x0, x10, x8
        lb x6, 112(x20)
        sll x12, x6, x10
        jal x3, L770
        sh x9, 46(x20)
L770:
        lh x4, 226(x20)
        beq x2, x3, L773
        sltu x1, x12, x4
L773:
        sub x12, x3, x1
        sltu x13, x14, x0
        sll x6, x12, x13
        sltu x10, x8, x13
        xori x14, x6, -1
        srai x12, x7, 14
        srai x4, x14, 15
        sb x12, 88(x20)
        bltu x12, x14, L784
        lhu x6, 194(x20)
        slt x11, x6, x6
L784:
        sltiu x1, x11, -1
        beq x10, x11, L789
        and x1, x10, x1
        sh x15, 212(x20)
        beq x1, x11, L793
L789:
        sll x12, x11, x1
        sll x2, x6, x1
        bge x12, x12, L796
        sw x2, 120(x20)
L793:
        or x6, x12, x12
        bgeu x12, x12, L797
        and x14, x0, x15
L796:
        bgeu x0, x5, L800
L797:
        xori x4, x14, -2048
        jal x11, L801
        lb x12, 151(x20)
L800:
        sw x12, 96(x20)
L801:
        or x7, x11, x11
        sltu x2, x2, x12
        auipc x5, 383334
        lh x0, 152(x20)
        jal x2, L808
        auipc x16, 0
        addi x16, x16, 16
        jalr x12, 0(x16)
        addi x13, x4, 1
        sb x12, 86(x20)
L808:
        srai x8, x12, 25
        sw x1, 136(x20)
        jal x6, L814
        bltu x15, x6, L814
        srli x12, x6, 29
        sltu x15, x6, x8
L814:
        xori x12, x12, 2047
        sw x12, 204(x20)
        sll x8, x6, x15
        lh x7, 154(x20)
        sltiu x1, x12, 1029
        auipc x16, 0
        addi x16, x16, 16
        jalr x6, 0(x16)
        addi x2, x4, 1
        srai x9, x6, 11
        srli x15, x14, 7
        sra x13, x9, x15
        sb x0, 164(x20)
        bge x12, x4, L829
        lb x14, 145(x20)
        sw x13, 200(x20)
        lb x12, 240(x20)
        srai x15, x3, 4
L829:
        srl x1, x12, x15
        lhu x1, 254(x20)
        sltu x10, x15, x1
        andi x13, x1, -293
        slli x6, x10, 27
        srai x9, x2, 3
        lhu x4, 10(x20)
        sltiu x13, x6, 0
        bltu x4, x14, L842
        slli x5, x13, 14
        lw x6, 32(x20)
        sub x12, x13, x5
        sw x6, 48(x20)
L842:
        srl x6, x0, x12
        lui x5, 109668
        and x9, x12, x6
        lbu x10, 7(x20)
        lhu x14, 242(x20)
        sll x15, x10, x10
        slti x8, x15, 697
        sltu x4, x8, x8
        lui x15, 234022
        sw x8, 196(x20)
        sh x14, 110(x20)
        sh x6, 212(x20)
        srl x2, x4, x4
        lbu x14, 26(x20)
        bne x15, x2, L858
        lw x9, 76(x20)
L858:
        sltiu x13, x9, 2047
        and x1, x5, x13
        xor x2, x9, x9
        bge x6, x1, L864
        addi x1, x1, -2048
        sltu x7, x1, x2
L864:
        srli x10, x2, 23
        jal x0, L868
        srai x8, x7, 0
        bltu x7, x7, L870
L868:
        sh x7, 38(x20)
        sh x0, 244(x20)
L870:
        sh x2, 246(x20)
        sb x1, 35(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x4, 0(x16)
        addi x9, x5, 1
        sltu x10, x4, x10
        lw x15, 132(x20)
        add x13, x13, x1
        lui x11, 927879
        blt x3, x6, L879
        sh x15, 56(x20)
L879:
        bltu x13, x12, L883
        sub x9, x9, x0
        sw x11, 140(x20)
        srl x15, x9, x9
L883:
        lbu x4, 198(x20)
        xor x7, x9, x15
        jal x2, L889
        xor x13, x7, x15
        slti x8, x2, 1
        sra x2, x14, x13
L889:
        lui x15, 118452
        bne x6, x15, L895
        lhu x15, 90(x20)
        slti x3, x2, -2048
        lui x13, 383287
        slli x3, x2, 22
L895:
        lb x4, 66(x20)
        sra x8, x7, x5
        slt x14, x8, x3
        sh x8, 92(x20)
        srai x1, x4, 17
        ebreak
