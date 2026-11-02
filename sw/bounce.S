# bounce.S - animated 8x8 box bouncing around the 160x120 VGA framebuffer.
# The LEDs show the frame counter.
        .globl _start
_start:
        lui  s0, 0x20000          # framebuffer base 0x20000000
        li   a0, 0x004            # dark blue background
        mv   s1, s0
        li   t0, 19200
fill:   sw   a0, 0(s1)
        addi s1, s1, 4
        addi t0, t0, -1
        bnez t0, fill

        li   s2, 40               # x
        li   s3, 20               # y
        li   s4, 1                # dx
        li   s5, 1                # dy
        li   s6, 0xFA0            # box colour
        li   s7, 0                # frame counter
        lui  t6, 0x10000          # I/O base
frame:  li   a0, 0x004
        jal  ra, box              # erase old position
        add  s2, s2, s4
        add  s3, s3, s5
        beqz s2, flipx
        li   t0, 152
        bne  s2, t0, nox
flipx:  sub  s4, x0, s4
        jal  ra, recolor
nox:    beqz s3, flipy
        li   t0, 112
        bne  s3, t0, noy
flipy:  sub  s5, x0, s5
        jal  ra, recolor
noy:    mv   a0, s6
        jal  ra, box              # draw new position
        li   t0, 30000            # delay
dly:    addi t0, t0, -1
        bnez t0, dly
        addi s7, s7, 1
        sw   s7, 0(t6)
        j    frame

recolor:
        li   t0, 0x321
        add  s6, s6, t0
        li   t0, 0x777
        and  s6, s6, t0
        li   t0, 0x888
        or   s6, s6, t0
        ret

# box: draw an 8x8 square of colour a0 at (s2, s3)
box:    slli t1, s3, 9            # y*512
        slli t2, s3, 7            # y*128
        add  t1, t1, t2           # y*640
        slli t2, s2, 2            # x*4
        add  t1, t1, t2
        add  t1, t1, s0
        li   t3, 8
brow:   li   t4, 8
bcol:   sw   a0, 0(t1)
        addi t1, t1, 4
        addi t4, t4, -1
        bnez t4, bcol
        addi t1, t1, 608          # next row: 640 - 8*4
        addi t3, t3, -1
        bnez t3, brow
        ret
