`timescale 1ns/1ps
// Switch-control test for sw/interactive.S: flips switches and checks what appears in the
// framebuffer. Uses pause (SW15) so the box is stationary while checking colours and size.
// Run with +dump to write the final paint-trail framebuffer to fb.txt.
module tb_interactive #(parameter PIPELINED = 1);
    reg         clk = 0, clk_vga = 0, rst = 1;
    reg  [15:0] sw  = 16'd0;
    wire [15:0] led;
    wire [3:0]  r, g, b;
    wire        hs, vs;
    integer     errors = 0;

    soc #(.INIT_FILE("interactive.mem"), .PIPELINED(PIPELINED)) dut (
        .clk(clk), .clk_vga(clk_vga), .rst(rst), .sw(sw), .led(led),
        .vga_r(r), .vga_g(g), .vga_b(b), .vga_hs(hs), .vga_vs(vs));

    always #10 clk     = ~clk;
    always #20 clk_vga = ~clk_vga;

    // box position = registers s2 (x18) and s3 (x19)
    wire [31:0] bx = dut.g_pipe.cpu.u_rf.regs[18];
    wire [31:0] by = dut.g_pipe.cpu.u_rf.regs[19];

    task px(input integer x, input integer y, input [11:0] exp, input [255:0] what);
        reg [11:0] got;
        begin
            got = dut.vga_i.fb[y*160 + x];
            if (got !== exp) begin
                $display("FAIL  %0s: fb(%0d,%0d) = %h, expected %h", what, x, y, got, exp);
                errors = errors + 1;
            end else $display("PASS  %0s", what);
        end
    endtask

    integer xa, xb, xc, xd, da, db, x0, y0, ya, yb;

    initial begin
        #100 rst = 0;

        // ---- speed: SW4-6 ----
        sw = 16'h0070;  #5_000_000;                       // speed 7, wait for the first clear
        px(150, 110, 12'h004, "dark blue background");
        xa = bx; #3_000_000; xb = bx; da = xb - xa;
        sw = 16'h0050;  #500_000; xc = bx; #3_000_000; xd = bx; db = xd - xc;   // speed 5
        if (da > db && db > 0) $display("PASS  speed switches: %0d px (speed 7) > %0d px (speed 5) in 3 ms", da, db);
        else begin $display("FAIL  speed switches: speed7=%0d speed5=%0d", da, db); errors = errors + 1; end

        // ---- colour switches SW0-2 (paused so the box stays still) ----
        sw = 16'h8074;  #3_000_000;                       // pause + red
        px(bx, by, 12'hF00, "SW2 -> red box");
        px(bx+7, by+7, 12'hF00, "box is 8x8");
        px(bx+8, by+8, 12'h004, "nothing outside the box");
        sw = 16'h8072;  #3_000_000;  px(bx, by, 12'h0F0, "SW1 -> green box");
        sw = 16'h8071;  #3_000_000;  px(bx, by, 12'h00F, "SW0 -> blue box");
        sw = 16'h8075;  #3_000_000;  px(bx, by, 12'hF0F, "SW0+SW2 -> magenta box");
        sw = 16'h8077;  #3_000_000;  px(bx, by, 12'hFFF, "SW0+SW1+SW2 -> white box");

        // ---- size SW11 and background SW10 (change = clear + redraw) ----
        sw = 16'h8874;  #6_000_000;
        px(bx+15, by+15, 12'hF00, "SW11 -> 16x16 box");
        sw = 16'h8C74;  #6_000_000;
        px(150, 110, 12'h300, "SW10 -> dark red background");

        // ---- LEDs mirror the switches ----
        if (led === sw) $display("PASS  LEDs mirror the switches (%h)", led);
        else begin $display("FAIL  LEDs = %h, switches = %h", led, sw); errors = errors + 1; end

        // ---- paint trail: SW9 ----
        sw = 16'h8274;  #6_000_000;                       // paused trail mode: config change clears
        x0 = bx; y0 = by;
        sw = 16'h0274;  #8_000_000;                       // run: the box leaves a trail
        px(x0, y0, 12'hF00, "SW9 -> paint trail");

        // ---- horizontal sweep SW8: y stays constant ----
        sw = 16'h0170;  #4_000_000;
        ya = by; xa = bx; #3_000_000; yb = by; xb = bx;
        if (ya == yb && xa != xb) $display("PASS  SW8 -> horizontal sweep (y constant at %0d, x %0d -> %0d)", yb, xa, xb);
        else begin $display("FAIL  horizontal sweep: y %0d -> %0d, x %0d -> %0d", ya, yb, xa, xb); errors = errors + 1; end

        // ---- rainbow paint trail picture ----
        sw = 16'h0270;  #3_000_000;                       // trail + automatic colours: clears
        sw = 16'h0270 | 16'h0080;  #12_000_000;           // 2 px/frame so it paints a long rainbow
        if ($test$plusargs("dump")) begin : dump_fb
            integer fd, n;
            fd = $fopen("fb.txt", "w");
            for (n = 0; n < 19200; n = n + 1) $fwrite(fd, "%h\n", dut.vga_i.fb[n]);
            $fclose(fd);
        end

        if (errors == 0) $display("ALL INTERACTIVE TESTS PASSED");
        else             $display("%0d INTERACTIVE TEST(S) FAILED", errors);
        $finish;
    end
endmodule
