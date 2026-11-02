# interactive.S - bouncing box controlled by the 16 switches (read every frame).
#
#   SW0 blue   SW1 green   SW2 red     box colour = mix of the three (all off = automatic colours)
#   SW3        rainbow: automatic colour changes every frame (when SW0-2 are off)
#   SW4-SW6    speed 0 (slow) .. 7 (fast)
#   SW7        move 2 pixels per frame instead of 1
#   SW9 SW8    animation: 00 diagonal bounce, 01 horizontal sweep, 10 paint trail, 11 vertical sweep
#   SW10       background colour (dark blue / dark red)
#   SW11       box size 8 / 16 pixels
#   SW12       flick to reverse direction
#   SW15       pause the movement (colour changes still apply)
# The LEDs mirror the switches.
#
# registers: s0 framebuffer, s2/s3 x/y, s4/s5 x/y direction (+1/-1), s7 previous config,
#            s8 box size, s9 background, s10 previous SW12, s11 automatic colour, t6 I/O base
        .globl _start
_start:
        lui  s0, 0x20000          # framebuffer base 0x20000000
        lui  t6, 0x10000          # I/O base 0x10000000
        li   s2, 40               # x
        li   s3, 20               # y
        li   s4, 1                # x direction
        li   s5, 1                # y direction
        li   s11, 0xFA0           # automatic colour
        li   s10, 0               # previous SW12
        li   s7, -1               # previous config: forces a full redraw on the first frame

frame:  lw   a1, 4(t6)            # a1 = switches
        sw   a1, 0(t6)            # LEDs mirror the switches

        # ---- configuration: animation (SW8,9), background (SW10), size (SW11) ----
        li   t0, 0xF00
        and  a2, a1, t0
        beq  a2, s7, nocfg
        mv   s7, a2               # config changed: re-initialise
        srli t0, a1, 11
        andi t0, t0, 1
        li   s8, 8
        beqz t0, size_ok
        li   s8, 16
size_ok:
        srli t0, a1, 10
        andi t0, t0, 1
        li   s9, 0x004            # dark blue
        beqz t0, bg_ok
        li   s9, 0x300            # dark red
bg_ok:  li   t0, 160              # keep the box on screen for the new size
        sub  t0, t0, s8
        ble  s2, t0, xok
        mv   s2, t0
xok:    li   t0, 120
        sub  t0, t0, s8
        ble  s3, t0, yok
        mv   s3, t0
yok:    mv   a0, s9
        jal  ra, clear            # clear the screen with the background
        j    erased
nocfg:  srli t0, a1, 8            # paint-trail mode (2) does not erase
        andi t0, t0, 3
        li   t1, 2
        beq  t0, t1, erased
        mv   a0, s9
        jal  ra, box              # erase old box
erased:
        # ---- SW12: reverse direction on every flick ----
        srli t0, a1, 12
        andi t0, t0, 1
        beq  t0, s10, norev
        mv   s10, t0
        sub  s4, x0, s4
        sub  s5, x0, s5
norev:
        # ---- SW15: pause ----
        srli t0, a1, 15
        andi t0, t0, 1
        bnez t0, moved

        # ---- movement ----
        srli t5, a1, 7            # t5 = step (1 or 2 pixels)
        andi t5, t5, 1
        addi t5, t5, 1
        srli t0, a1, 8            # t0 = animation mode
        andi t0, t0, 3
        li   t1, 3
        beq  t0, t1, xdone        # vertical sweep: no x movement
        bgtz s4, xplus
        sub  s2, s2, t5
        j    xwall
xplus:  add  s2, s2, t5
xwall:  li   t1, 160
        sub  t1, t1, s8           # t1 = x limit
        bgtz s2, xnotlo
        li   s2, 0
        li   s4, 1
        jal  ra, recolor
xnotlo: blt  s2, t1, xdone
        mv   s2, t1
        li   s4, -1
        jal  ra, recolor
xdone:
        li   t1, 1
        beq  t0, t1, moved        # horizontal sweep: no y movement
        bgtz s5, yplus
        sub  s3, s3, t5
        j    ywall
yplus:  add  s3, s3, t5
ywall:  li   t1, 120
        sub  t1, t1, s8           # t1 = y limit
        bgtz s3, ynotlo
        li   s3, 0
        li   s5, 1
        jal  ra, recolor
ynotlo: blt  s3, t1, moved
        mv   s3, t1
        li   s5, -1
        jal  ra, recolor
moved:
        # ---- colour ----
        andi t1, a1, 8            # SW3 = rainbow
        bnez t1, rainbow
        srli t0, a1, 8
        andi t0, t0, 3
        li   t1, 2
        bne  t0, t1, norain       # trail mode also cycles the colour every frame
rainbow:
        jal  ra, recolor
norain: andi t0, a1, 7            # SW0..SW2
        beqz t0, useauto
        li   a0, 0
        andi t1, t0, 1
        beqz t1, nb
        ori  a0, a0, 0x00F        # SW0 blue
nb:     andi t1, t0, 2
        beqz t1, ng
        ori  a0, a0, 0x0F0        # SW1 green
ng:     andi t1, t0, 4
        beqz t1, nr
        li   t2, 0xF00            # SW2 red
        or   a0, a0, t2
nr:     j    drawit
useauto:
        mv   a0, s11
drawit: jal  ra, box              # draw the box

        # ---- speed: delay = 4000 << (7 - speed) ----
        srli t0, a1, 4
        andi t0, t0, 7
        li   t1, 7
        sub  t1, t1, t0
        li   t2, 4000
        sll  t2, t2, t1
dly:    addi t2, t2, -1
        bnez t2, dly
        j    frame

# recolor: next automatic colour (bright colours only)
recolor:
        li   a6, 0x321
        add  s11, s11, a6
        li   a6, 0x777
        and  s11, s11, a6
        li   a6, 0x888
        or   s11, s11, a6
        ret

# clear: fill the whole framebuffer with colour a0
clear:  mv   t1, s0
        li   t2, 19200
cl:     sw   a0, 0(t1)
        addi t1, t1, 4
        addi t2, t2, -1
        bnez t2, cl
        ret

# box: draw an s8 x s8 square of colour a0 at (s2, s3)
box:    slli t1, s3, 9            # y*512
        slli t2, s3, 7            # y*128
        add  t1, t1, t2           # y*640
        slli t2, s2, 2            # x*4
        add  t1, t1, t2
        add  t1, t1, s0           # pointer to the first pixel
        slli t4, s8, 2
        li   t2, 640
        sub  t2, t2, t4           # t2 = distance from the end of one box row to the start of the next
        mv   t3, s8               # rows
brow:   mv   t4, s8               # columns
bcol:   sw   a0, 0(t1)
        addi t1, t1, 4
        addi t4, t4, -1
        bnez t4, bcol
        add  t1, t1, t2
        addi t3, t3, -1
        bnez t3, brow
        ret
