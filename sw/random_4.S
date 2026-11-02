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
        li x10, -1133664809
        li x11, -446426455
        li x12, -1481882790
        li x13, -1861803471
        li x14, 1795103241
        li x15, 1138864728
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
        sll x5, x12, x9
        sll x11, x9, x7
        beq x11, x8, L6
        add x10, x5, x10
        lh x10, 98(x20)
        sub x0, x11, x11
L6:
        lh x3, 240(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x7, 0(x16)
        addi x15, x4, 1
        lhu x7, 140(x20)
        sh x4, 100(x20)
        blt x8, x3, L13
        xor x0, x7, x10
        sltu x15, x14, x3
L13:
        ori x6, x7, 0
        sltiu x8, x15, 1
        sll x9, x8, x8
        slli x5, x6, 26
        lbu x8, 244(x20)
        xori x15, x5, 2047
        slt x5, x8, x5
        srl x11, x15, x5
        lb x7, 253(x20)
        sra x11, x6, x7
        andi x13, x11, 2047
        jal x5, L26
        jal x7, L29
L26:
        blt x2, x15, L29
        auipc x4, 6864
        srl x13, x4, x4
L29:
        slti x10, x7, -2048
        ori x9, x10, 0
        sltiu x14, x1, -2048
        xori x8, x9, 0
        srl x13, x12, x14
        andi x14, x7, 0
        sb x6, 190(x20)
        lh x5, 252(x20)
        slli x2, x6, 7
        srai x4, x0, 26
        bne x1, x11, L43
        srai x10, x10, 28
        sltiu x6, x10, 0
        auipc x5, 780115
L43:
        sll x6, x3, x5
        ori x0, x6, 27
        sb x5, 81(x20)
        lb x8, 59(x20)
        lbu x12, 155(x20)
        andi x6, x8, -2048
        lhu x14, 204(x20)
        addi x15, x14, 2047
        jal x0, L55
        srli x5, x15, 5
        sh x0, 112(x20)
        bne x3, x14, L56
L55:
        sll x4, x9, x14
L56:
        sltu x11, x15, x4
        lbu x15, 212(x20)
        lb x12, 186(x20)
        bltu x11, x0, L62
        srli x9, x11, 19
        bne x12, x9, L65
L62:
        blt x5, x15, L64
        bne x15, x9, L65
L64:
        srai x15, x15, 24
L65:
        ori x8, x15, 874
        bltu x7, x8, L71
        auipc x14, 711242
        sb x4, 120(x20)
        lb x6, 165(x20)
        bgeu x6, x6, L73
L71:
        lb x6, 102(x20)
        sb x6, 157(x20)
L73:
        bne x1, x2, L75
        xor x5, x7, x6
L75:
        beq x6, x10, L80
        lui x12, 917298
        xori x5, x5, 666
        blt x7, x5, L83
        sll x6, x5, x5
L80:
        sltu x15, x6, x7
        lb x0, 174(x20)
        lui x9, 199911
L83:
        sub x3, x10, x5
        bne x9, x9, L86
        lw x3, 184(x20)
L86:
        sltu x11, x9, x2
        lhu x13, 52(x20)
        xor x7, x13, x11
        bne x11, x13, L91
        lui x6, 804662
L91:
        slti x3, x8, 0
        add x13, x3, x0
        lhu x7, 82(x20)
        lh x0, 182(x20)
        lhu x15, 14(x20)
        sh x7, 108(x20)
        lui x3, 128039
        add x4, x11, x3
        sb x4, 21(x20)
        sll x15, x3, x3
        lw x6, 176(x20)
        jal x6, L104
        auipc x14, 250448
L104:
        or x10, x7, x5
        beq x2, x5, L109
        srli x14, x6, 17
        sll x7, x10, x14
        sub x11, x7, x12
L109:
        slt x4, x14, x11
        lb x0, 47(x20)
        sub x6, x4, x7
        lbu x2, 31(x20)
        or x5, x4, x11
        and x3, x5, x3
        and x13, x3, x5
        sra x8, x3, x13
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x10, x9, 1
        lui x11, 947235
        jal x6, L121
        jal x9, L123
L121:
        andi x2, x6, -140
        bge x9, x6, L125
L123:
        xor x7, x6, x6
        sltiu x6, x14, 1
L125:
        add x6, x2, x6
        slti x0, x6, -40
        ori x12, x6, 1
        sltu x3, x6, x3
        sltiu x5, x14, -38
        bltu x0, x5, L135
        slti x5, x5, -2048
        slt x6, x8, x0
        bge x6, x5, L138
        blt x6, x7, L139
L135:
        sra x13, x5, x6
        and x13, x6, x12
        jal x11, L139
L138:
        slti x9, x11, 2047
L139:
        jal x1, L143
        sra x5, x9, x9
        sw x9, 32(x20)
        lbu x9, 115(x20)
L143:
        or x4, x6, x1
        jal x6, L148
        sub x5, x9, x11
        srl x12, x11, x2
        sub x12, x5, x12
L148:
        bgeu x13, x4, L153
        sra x6, x12, x12
        jal x11, L153
        xor x5, x6, x11
        sw x6, 60(x20)
L153:
        jal x7, L155
        lbu x4, 94(x20)
L155:
        lui x13, 642221
        add x14, x13, x13
        sltu x5, x4, x13
        and x6, x5, x0
        jal x8, L163
        jal x3, L162
        slti x8, x6, -2048
L162:
        sra x15, x8, x8
L163:
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x13, x8, 1
        andi x12, x8, 1545
        srli x9, x3, 6
        auipc x9, 368913
        lhu x0, 90(x20)
        sra x5, x9, x9
        addi x10, x5, -1598
        sb x9, 252(x20)
        slt x6, x10, x5
        slti x7, x6, 8
        sh x7, 184(x20)
        sll x11, x5, x7
        lw x12, 16(x20)
        sra x14, x1, x11
        beq x12, x9, L179
        auipc x15, 151978
L179:
        lh x1, 224(x20)
        blt x15, x1, L184
        sub x10, x4, x14
        sra x8, x4, x14
        auipc x8, 364895
L184:
        sra x10, x8, x3
        lw x11, 96(x20)
        lw x8, 196(x20)
        sh x8, 30(x20)
        slti x10, x11, -1
        jal x5, L192
        lw x7, 84(x20)
        sltu x4, x5, x5
L192:
        sltu x1, x7, x5
        sub x1, x4, x5
        andi x6, x1, -1153
        slti x11, x0, 40
        bltu x15, x6, L199
        jal x15, L199
        ori x0, x5, -2048
L199:
        sb x14, 116(x20)
        beq x11, x6, L202
        sw x3, 104(x20)
L202:
        slli x0, x11, 8
        lb x15, 90(x20)
        bgeu x11, x15, L206
        ori x5, x4, 0
L206:
        srai x1, x15, 23
        or x11, x1, x1
        sra x1, x11, x11
        srli x14, x6, 22
        srli x7, x11, 23
        and x8, x14, x1
        srl x4, x3, x5
        jal x3, L217
        sb x8, 85(x20)
        sh x3, 108(x20)
        lb x8, 217(x20)
L217:
        bne x3, x8, L222
        andi x4, x10, -16
        srli x3, x7, 23
        srli x0, x8, 9
        lui x1, 729517
L222:
        andi x4, x1, 1
        addi x13, x3, 0
        sb x13, 107(x20)
        lui x6, 795015
        blt x4, x4, L231
        slt x12, x13, x9
        sltu x8, x12, x1
        andi x12, x8, 2047
        ori x11, x12, 0
L231:
        blt x14, x12, L235
        xori x6, x8, -410
        sll x11, x6, x11
        sub x3, x11, x14
L235:
        xor x3, x6, x5
        lw x0, 232(x20)
        slli x14, x3, 24
        lhu x13, 6(x20)
        add x14, x0, x3
        lbu x13, 81(x20)
        srai x7, x14, 18
        sll x4, x7, x15
        sub x8, x4, x7
        beq x0, x8, L246
        lui x12, 354797
L246:
        bne x9, x0, L251
        slli x2, x14, 13
        andi x1, x2, -2048
        bltu x12, x13, L253
        srli x3, x1, 6
L251:
        lui x8, 128904
        srli x9, x3, 28
L253:
        jal x14, L255
        sub x5, x8, x14
L255:
        jal x10, L259
        bltu x10, x14, L259
        sll x7, x14, x11
        xori x5, x5, -1
L259:
        ori x14, x10, -2048
        sb x2, 12(x20)
        sw x10, 76(x20)
        jal x15, L266
        srli x0, x5, 12
        jal x11, L268
        blt x14, x13, L269
L266:
        bltu x14, x14, L268
        jal x13, L269
L268:
        lh x8, 206(x20)
L269:
        lhu x1, 192(x20)
        jal x3, L272
        bge x1, x15, L276
L272:
        lbu x4, 221(x20)
        or x3, x1, x6
        or x14, x12, x11
        sw x9, 132(x20)
L276:
        lui x11, 442782
        lui x11, 299633
        auipc x3, 137031
        add x15, x11, x13
        srl x5, x3, x1
        jal x15, L284
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x3, x14, 1
        sh x1, 36(x20)
L284:
        andi x10, x9, 2047
        sra x4, x10, x1
        slti x8, x1, 1
        slli x14, x4, 0
        sb x5, 70(x20)
        srli x8, x8, 20
        auipc x10, 80471
        andi x3, x14, -2048
        andi x11, x3, -2048
        or x2, x11, x3
        srai x11, x2, 21
        auipc x16, 0
        addi x16, x16, 16
        jalr x9, 0(x16)
        addi x5, x6, 1
        lui x2, 283030
        lbu x1, 33(x20)
        sltiu x11, x9, 0
        sll x8, x2, x2
        sw x11, 108(x20)
        addi x5, x11, -49
        sw x11, 148(x20)
        jal x4, L306
        sra x11, x15, x5
        sltiu x3, x4, 2047
L306:
        beq x3, x11, L311
        bltu x3, x11, L312
        srli x1, x4, 7
        ori x8, x1, -2048
        sltu x14, x7, x8
L311:
        slt x7, x8, x1
L312:
        bne x7, x7, L315
        sll x10, x14, x7
        jal x3, L318
L315:
        or x12, x3, x10
        addi x6, x10, 2047
        lhu x2, 242(x20)
L318:
        xor x9, x2, x2
        lui x10, 556250
        and x5, x2, x10
        addi x3, x5, 0
        lhu x7, 34(x20)
        andi x14, x7, -1257
        sub x11, x11, x14
        beq x5, x4, L329
        auipc x16, 0
        addi x16, x16, 16
        jalr x0, 0(x16)
        addi x11, x12, 1
        beq x11, x14, L329
        add x11, x14, x0
L329:
        slt x1, x14, x1
        sb x10, 4(x20)
        add x10, x1, x14
        srai x15, x6, 11
        auipc x10, 718040
        sub x13, x15, x4
        sub x11, x4, x13
        lhu x0, 38(x20)
        srl x5, x13, x13
        slt x15, x11, x11
        sll x1, x15, x11
        lui x5, 429304
        slti x13, x15, 1361
        andi x1, x12, -1738
        lui x0, 941226
        bltu x9, x10, L348
        sub x12, x13, x5
        and x11, x1, x8
        lh x1, 90(x20)
L348:
        lbu x4, 165(x20)
        sw x4, 220(x20)
        jal x6, L353
        sltu x0, x3, x6
        slti x13, x3, 2047
L353:
        sll x11, x13, x6
        bgeu x11, x2, L357
        and x14, x2, x11
        auipc x15, 685031
L357:
        or x3, x14, x11
        auipc x16, 0
        addi x16, x16, 16
        jalr x0, 0(x16)
        addi x11, x15, 1
        and x8, x3, x10
        andi x13, x11, 1407
        blt x13, x10, L366
        slli x9, x13, 20
        xori x1, x10, -2048
        sw x8, 24(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x15, x15, 1
L366:
        bltu x11, x14, L371
        blt x11, x11, L370
        srai x14, x7, 7
        beq x14, x5, L372
L370:
        lhu x9, 104(x20)
L371:
        sltiu x2, x1, 2047
L372:
        sll x7, x9, x10
        sh x9, 22(x20)
        xor x4, x2, x7
        bltu x4, x1, L380
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x9, x4, 1
        beq x7, x7, L379
        bge x13, x4, L381
L379:
        sra x14, x4, x11
L380:
        jal x2, L384
L381:
        srli x9, x15, 11
        sra x10, x14, x9
        auipc x11, 14666
L384:
        andi x0, x9, 49
        lb x5, 75(x20)
        blt x11, x3, L389
        sltu x4, x15, x10
        sltiu x11, x5, 2047
L389:
        sltiu x7, x5, -2048
        sh x8, 2(x20)
        or x5, x9, x11
        lhu x13, 116(x20)
        xori x5, x6, 0
        sb x7, 152(x20)
        andi x2, x5, 1849
        lb x15, 91(x20)
        sb x5, 20(x20)
        lh x3, 134(x20)
        srli x14, x4, 20
        lh x0, 196(x20)
        slt x12, x10, x3
        srli x1, x3, 29
        xori x11, x9, -2048
        slli x15, x11, 3
        xor x7, x0, x3
        or x4, x11, x15
        auipc x0, 564454
        srl x8, x7, x9
        lh x11, 38(x20)
        auipc x4, 154181
        sra x14, x8, x0
        or x1, x13, x14
        sw x5, 196(x20)
        jal x2, L418
        sra x10, x2, x5
        sub x7, x10, x1
        srli x0, x9, 18
L418:
        slt x10, x15, x10
        srai x8, x2, 17
        srai x9, x9, 8
        slli x9, x10, 13
        sltu x10, x9, x9
        ori x14, x9, 0
        lh x10, 122(x20)
        and x1, x15, x10
        lw x12, 148(x20)
        or x14, x11, x3
        ori x9, x1, 2047
        beq x9, x14, L431
        addi x12, x6, -1
L431:
        sra x7, x14, x12
        slli x13, x7, 11
        auipc x14, 532911
        srai x6, x14, 31
        srli x13, x11, 15
        sll x4, x6, x14
        andi x1, x13, 0
        or x14, x13, x4
        lh x14, 174(x20)
        add x10, x7, x14
        sb x14, 136(x20)
        slli x8, x14, 0
        sb x14, 117(x20)
        jal x5, L447
        ori x2, x5, -2048
        andi x7, x2, 55
L447:
        auipc x9, 52779
        srl x15, x9, x7
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x13, x13, 1
        blt x4, x0, L452
        xor x0, x10, x11
L452:
        sra x9, x9, x8
        add x6, x15, x9
        add x13, x2, x6
        sw x13, 56(x20)
        bge x13, x9, L460
        ori x4, x9, 2047
        sub x2, x13, x6
        andi x7, x2, 0
L460:
        xor x9, x7, x6
        sh x5, 40(x20)
        auipc x8, 622689
        jal x10, L467
        auipc x16, 0
        addi x16, x16, 16
        jalr x13, 0(x16)
        addi x4, x4, 1
        slt x13, x8, x10
        srai x1, x13, 7
L467:
        sub x13, x13, x13
        xor x11, x13, x13
        sltu x0, x13, x13
        srl x7, x9, x11
        sltu x7, x10, x9
        xori x12, x4, 1482
        and x7, x7, x3
        lbu x2, 7(x20)
        sra x3, x12, x2
        sb x3, 14(x20)
        srai x1, x7, 20
        sw x3, 160(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x2, 0(x16)
        addi x10, x4, 1
        slli x2, x1, 7
        sh x1, 230(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x9, 0(x16)
        addi x15, x4, 1
        sra x13, x2, x9
        lhu x14, 68(x20)
        sub x10, x7, x9
        sh x1, 124(x20)
        lb x11, 147(x20)
        beq x3, x10, L490
        sh x14, 198(x20)
L490:
        bgeu x8, x14, L494
        bgeu x11, x11, L494
        ori x12, x10, 1
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x2, x1, 1
L494:
        addi x1, x11, -2048
        beq x3, x3, L498
        sw x10, 44(x20)
        slli x7, x1, 1
L498:
        sra x10, x15, x7
        slti x9, x0, -2048
        addi x12, x7, 1
        bne x10, x9, L505
        addi x2, x12, 1
        xori x15, x9, -1
        xori x13, x2, 0
L505:
        slli x5, x13, 18
        srai x1, x0, 26
        jal x8, L511
        sub x11, x14, x6
        lui x12, 691564
        add x11, x8, x11
L511:
        sw x11, 240(x20)
        srli x10, x11, 15
        srl x15, x11, x9
        lw x12, 132(x20)
        beq x2, x10, L519
        bge x10, x10, L519
        sll x8, x10, x10
        sh x8, 106(x20)
L519:
        bne x4, x8, L523
        lhu x12, 240(x20)
        blt x8, x6, L524
        lui x12, 429379
L523:
        lw x8, 132(x20)
L524:
        addi x0, x8, 0
        srai x0, x12, 23
        xor x1, x6, x12
        jal x13, L530
        lbu x14, 29(x20)
        xor x2, x1, x15
L530:
        auipc x16, 0
        addi x16, x16, 16
        jalr x11, 0(x16)
        addi x8, x13, 1
        ori x1, x13, 2047
        sra x7, x7, x4
        slli x15, x11, 26
        beq x8, x7, L539
        sh x15, 102(x20)
        sw x15, 192(x20)
        xor x1, x7, x4
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x2, x4, 1
L539:
        srai x5, x7, 13
        sltiu x8, x5, -2048
        bne x11, x5, L543
        add x9, x8, x6
L543:
        addi x10, x11, 1178
        blt x10, x9, L549
        ori x14, x2, 1
        add x5, x2, x11
        lhu x12, 70(x20)
        sltiu x12, x5, -1
L549:
        sltu x2, x10, x5
        sltiu x12, x12, -1
        bltu x4, x12, L556
        slt x6, x15, x1
        sll x12, x6, x12
        lhu x8, 208(x20)
        slli x10, x6, 21
L556:
        or x5, x12, x14
        srai x3, x5, 23
        sh x5, 134(x20)
        bge x5, x4, L562
        lb x9, 254(x20)
        blt x10, x9, L565
L562:
        lw x12, 108(x20)
        sltu x2, x12, x7
        xor x11, x9, x8
L565:
        srl x3, x12, x6
        beq x3, x10, L569
        lb x13, 20(x20)
        sh x11, 84(x20)
L569:
        sub x3, x13, x11
        lhu x7, 200(x20)
        bgeu x7, x10, L576
        lui x15, 779703
        addi x4, x7, -2048
        bgeu x15, x4, L577
        bge x15, x12, L578
L576:
        slt x8, x7, x9
L577:
        slti x13, x2, 1
L578:
        sh x13, 60(x20)
        slli x10, x10, 23
        addi x11, x8, 0
        ori x4, x6, 18
        sra x6, x5, x11
        sb x0, 183(x20)
        jal x14, L586
        lb x7, 150(x20)
L586:
        lbu x15, 103(x20)
        sltu x13, x15, x2
        sh x13, 146(x20)
        srai x6, x15, 22
        or x7, x3, x15
        sltiu x14, x13, 2047
        bge x14, x6, L595
        sltu x6, x6, x14
        slt x10, x10, x6
L595:
        lb x11, 103(x20)
        sll x13, x10, x10
        andi x2, x13, 1
        addi x14, x13, -2048
        sltiu x5, x14, 1
        srli x15, x1, 13
        slti x12, x4, 0
        sub x4, x5, x15
        sll x7, x6, x4
        xor x1, x7, x12
        srl x4, x6, x13
        srai x8, x1, 26
        sltiu x13, x1, -1
        xor x6, x13, x14
        sw x8, 48(x20)
        bltu x13, x9, L615
        slt x13, x6, x1
        sltiu x1, x13, 2047
        slti x12, x0, 266
        jal x0, L616
L615:
        sub x10, x13, x1
L616:
        and x8, x1, x0
        lbu x14, 161(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x14, 0(x16)
        addi x14, x13, 1
        bltu x8, x7, L624
        or x0, x14, x8
        sll x5, x14, x14
        bge x4, x5, L625
        xor x4, x14, x14
L624:
        and x12, x4, x5
L625:
        slli x10, x12, 22
        auipc x8, 631783
        auipc x16, 0
        addi x16, x16, 16
        jalr x3, 0(x16)
        addi x15, x12, 1
        sltiu x10, x8, -1
        slti x11, x4, -1
        xori x8, x10, -436
        sub x1, x11, x6
        sra x5, x11, x8
        sh x5, 54(x20)
        blt x8, x5, L639
        jal x13, L639
        lh x5, 140(x20)
        jal x9, L640
        lw x11, 88(x20)
L639:
        auipc x8, 498341
L640:
        bltu x8, x11, L642
        bge x14, x9, L644
L642:
        ori x5, x5, 2047
        or x7, x11, x5
L644:
        jal x14, L647
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x5, x9, 1
        bne x4, x1, L651
L647:
        bltu x1, x4, L650
        bltu x1, x14, L652
        ori x3, x7, 2047
L650:
        and x15, x1, x3
L651:
        addi x10, x3, 0
L652:
        sra x9, x10, x15
        sb x14, 219(x20)
        lb x14, 52(x20)
        srl x0, x2, x10
        srl x3, x9, x9
        sb x0, 194(x20)
        sltiu x15, x8, -1
        sub x15, x3, x12
        srli x5, x3, 24
        xor x11, x5, x5
        sltiu x2, x7, 2047
        srl x7, x6, x2
        blt x1, x2, L667
        slli x14, x7, 9
        addi x3, x6, 0
L667:
        andi x12, x14, 1
        sb x14, 224(x20)
        jal x4, L671
        lhu x10, 106(x20)
L671:
        add x14, x10, x4
        sh x4, 178(x20)
        jal x8, L675
        sh x8, 80(x20)
L675:
        or x15, x10, x10
        beq x4, x2, L678
        lui x6, 983249
L678:
        sw x14, 132(x20)
        ori x7, x8, 2047
        slt x8, x6, x7
        sub x9, x8, x7
        beq x8, x8, L684
        slti x2, x4, 0
L684:
        and x9, x0, x2
        lui x5, 862423
        bgeu x5, x9, L688
        blt x5, x7, L692
L688:
        addi x12, x2, 0
        sh x9, 56(x20)
        xor x2, x12, x0
        srli x8, x12, 17
L692:
        lb x6, 200(x20)
        jal x13, L695
        xori x0, x10, 2047
L695:
        sw x3, 228(x20)
        jal x2, L698
        jal x5, L700
L698:
        slt x13, x4, x1
        srl x10, x2, x5
L700:
        lui x13, 112386
        xor x9, x7, x13
        add x13, x10, x8
        slti x10, x13, 2047
        slti x2, x10, 0
        sh x2, 146(x20)
        lbu x11, 125(x20)
        sw x9, 228(x20)
        addi x12, x11, -1700
        xori x8, x3, -1
        sra x4, x8, x8
        bge x4, x12, L716
        xori x2, x8, -1
        xor x14, x8, x8
        slli x15, x4, 9
        sll x15, x2, x2
L716:
        blt x4, x15, L721
        slt x10, x7, x15
        jal x1, L722
        ori x14, x15, 2047
        add x4, x3, x10
L721:
        beq x1, x1, L724
L722:
        bne x11, x1, L727
        addi x7, x14, -12
L724:
        xor x9, x9, x4
        bgeu x11, x7, L729
        ori x2, x15, -1
L727:
        jal x5, L731
        lbu x6, 185(x20)
L729:
        sub x12, x5, x2
        sub x4, x5, x13
L731:
        and x9, x6, x10
        sub x11, x14, x12
        ori x13, x9, 36
        or x0, x9, x11
        lbu x4, 72(x20)
        sll x8, x11, x4
        jal x14, L740
        sub x2, x8, x0
        jal x8, L743
L740:
        sll x13, x11, x9
        sw x7, 80(x20)
        sw x8, 212(x20)
L743:
        sb x13, 165(x20)
        sw x2, 132(x20)
        srl x11, x13, x13
        sltiu x2, x8, 1
        sw x2, 120(x20)
        jal x10, L750
        sltu x2, x14, x2
L750:
        or x12, x2, x10
        addi x0, x2, 0
        slt x7, x10, x2
        sub x15, x1, x7
        srai x15, x12, 14
        or x9, x15, x2
        srai x7, x1, 21
        auipc x16, 0
        addi x16, x16, 16
        jalr x1, 0(x16)
        addi x8, x10, 1
        srl x5, x9, x4
        beq x5, x5, L763
        sb x5, 10(x20)
        lw x6, 196(x20)
        or x1, x15, x1
L763:
        beq x3, x14, L767
        lui x12, 461561
        lh x15, 146(x20)
        xor x7, x1, x12
L767:
        ori x12, x15, -1
        sra x1, x13, x12
        sw x12, 100(x20)
        sll x14, x11, x7
        sltu x5, x2, x11
        xor x6, x5, x5
        blt x7, x5, L777
        auipc x2, 330853
        andi x3, x10, 1
        sltiu x13, x3, -6
L777:
        jal x8, L781
        slli x10, x3, 5
        srl x13, x8, x8
        xor x0, x10, x10
L781:
        xori x9, x13, 0
        srl x1, x10, x9
        lbu x14, 67(x20)
        lbu x8, 129(x20)
        lh x1, 98(x20)
        sb x8, 71(x20)
        srli x3, x14, 26
        sh x5, 4(x20)
        sh x10, 2(x20)
        sltu x1, x8, x9
        ori x12, x4, -2048
        sra x12, x3, x3
        ori x14, x12, 2047
        sltiu x9, x12, 1
        sltiu x3, x4, 0
        add x8, x13, x13
        slti x4, x3, -420
        sltiu x7, x0, 419
        sh x4, 154(x20)
        andi x3, x4, -1
        andi x15, x3, -2048
        add x12, x7, x7
        bge x5, x12, L808
        sltiu x9, x0, -2048
        xor x14, x6, x12
        sll x8, x12, x7
        sra x13, x0, x7
L808:
        sltiu x13, x8, -2048
        sb x13, 7(x20)
        lhu x9, 116(x20)
        bne x13, x7, L814
        auipc x16, 0
        addi x16, x16, 16
        jalr x8, 0(x16)
        addi x14, x13, 1
        bltu x12, x7, L818
L814:
        sltiu x0, x8, 1
        xori x2, x5, 0
        sltu x8, x2, x9
        auipc x16, 0
        addi x16, x16, 16
        jalr x0, 0(x16)
        addi x13, x7, 1
L818:
        jal x9, L821
        lh x3, 20(x20)
        beq x9, x8, L824
L821:
        lb x1, 40(x20)
        sltiu x11, x1, -1
        srl x15, x12, x1
L824:
        jal x14, L828
        addi x6, x15, -45
        lb x7, 90(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x10, 0(x16)
        addi x15, x2, 1
L828:
        blt x15, x7, L830
        sw x10, 236(x20)
L830:
        ori x14, x5, -1151
        lbu x13, 75(x20)
        ori x3, x10, 2047
        srli x15, x13, 25
        sltu x13, x12, x10
        sb x13, 86(x20)
        slti x14, x15, 1
        slti x12, x15, 1
        beq x12, x14, L842
        sw x4, 72(x20)
        srl x9, x7, x6
        sltu x12, x14, x12
L842:
        sra x11, x9, x7
        sb x10, 103(x20)
        sb x11, 50(x20)
        lw x1, 0(x20)
        sra x13, x13, x12
        and x5, x14, x11
        sh x13, 14(x20)
        xor x15, x5, x13
        sb x2, 21(x20)
        jal x5, L853
        andi x10, x5, 1
L853:
        bge x10, x15, L858
        sb x10, 171(x20)
        auipc x16, 0
        addi x16, x16, 16
        jalr x5, 0(x16)
        addi x8, x8, 1
        slt x13, x4, x10
        sltu x9, x13, x12
L858:
        slli x8, x9, 25
        xori x1, x9, 2047
        ori x15, x9, -54
        lbu x13, 80(x20)
        sltiu x4, x4, 2047
        lui x3, 825469
        bgeu x9, x3, L868
        lbu x11, 217(x20)
        lb x0, 254(x20)
        ori x2, x11, 2047
L868:
        slti x5, x3, -37
        slti x1, x2, -64
        sll x11, x6, x10
        ori x11, x12, 2047
        jal x8, L875
        xor x13, x11, x11
        and x4, x11, x8
L875:
        sub x0, x9, x15
        xor x11, x13, x4
        sh x1, 164(x20)
        lhu x13, 54(x20)
        sh x11, 10(x20)
        sub x5, x1, x4
        sra x7, x11, x13
        lbu x11, 106(x20)
        ori x11, x10, 2047
        sub x1, x1, x7
        or x15, x11, x15
        xor x9, x1, x11
        xor x12, x2, x6
        sra x5, x13, x14
        sub x10, x9, x12
        lbu x10, 96(x20)
        sb x4, 166(x20)
        lhu x1, 138(x20)
        slt x4, x1, x15
        addi x3, x4, -16
        lw x3, 68(x20)
        addi x11, x4, 1513
        sw x3, 112(x20)
        sltu x4, x14, x3
        andi x12, x6, 2047
        ebreak
