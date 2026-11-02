# vga_demo.S - draws 8 colour bars and a white border into the 160x120 framebuffer.
# Framebuffer: word at 0x20000000 + 4*(y*160 + x), colour = 0x0RGB (4 bits each).
# Afterwards the LEDs mirror the switches.
        .globl _start
_start:
        lui  s0, 0x20000          # s0 = framebuffer base
        mv   s1, s0               # s1 = write pointer
        li   t0, 0                # y = 0
row:    li   t1, 0                # bar = 0
bar:    li   t4, 0                # colour from the bar number: bit2=R, bit1=G, bit0=B
        andi t5, t1, 4
        beqz t5, nr
        li   t5, 0xF00
        or   t4, t4, t5
nr:     andi t5, t1, 2
        beqz t5, ng
        ori  t4, t4, 0x0F0
ng:     andi t5, t1, 1
        beqz t5, nb
        ori  t4, t4, 0x00F
nb:     li   t2, 20               # each bar is 20 pixels wide
px:     sw   t4, 0(s1)
        addi s1, s1, 4
        addi t2, t2, -1
        bnez t2, px
        addi t1, t1, 1
        li   t3, 8
        bne  t1, t3, bar
        addi t0, t0, 1
        li   t3, 120
        bne  t0, t3, row

        li   a0, 0xFFF            # white border
        mv   s1, s0               # top row
        li   t2, 160
top:    sw   a0, 0(s1)
        addi s1, s1, 4
        addi t2, t2, -1
        bnez t2, top
        li   t5, 76160            # bottom row = base + 119*160*4
        add  s1, s0, t5
        li   t2, 160
bot:    sw   a0, 0(s1)
        addi s1, s1, 4
        addi t2, t2, -1
        bnez t2, bot
        mv   s1, s0               # left column (step = one row = 640 bytes)
        li   t2, 120
left:   sw   a0, 0(s1)
        addi s1, s1, 640
        addi t2, t2, -1
        bnez t2, left
        addi s1, s0, 636          # right column = base + 159*4
        li   t2, 120
right:  sw   a0, 0(s1)
        addi s1, s1, 640
        addi t2, t2, -1
        bnez t2, right

        lui  t6, 0x10000          # LEDs mirror the switches
done:   lw   a1, 4(t6)
        sw   a1, 0(t6)
        j    done
