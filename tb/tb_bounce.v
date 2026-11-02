`timescale 1ns/1ps
// Checks the bouncing-box animation: after 3 frames (LED = 3) the box must be at (43,23).
module tb_bounce #(parameter PIPELINED = 1);
    reg         clk = 0, clk_vga = 0, rst = 1;
    reg  [15:0] sw  = 16'd0;
    wire [15:0] led;
    wire [3:0]  r, g, b;
    wire        hs, vs;
    integer     errors = 0;

    soc #(.INIT_FILE("bounce.mem"), .PIPELINED(PIPELINED)) dut (
        .clk(clk), .clk_vga(clk_vga), .rst(rst), .sw(sw), .led(led),
        .vga_r(r), .vga_g(g), .vga_b(b), .vga_hs(hs), .vga_vs(vs));

    always #10 clk     = ~clk;
    always #20 clk_vga = ~clk_vga;

    task check_px(input integer x, input integer y, input [11:0] exp);
        reg [11:0] got;
        begin
            got = dut.vga_i.fb[y*160 + x];
            if (got !== exp) begin
                $display("FAIL  fb(%0d,%0d) = %h, expected %h", x, y, got, exp);
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        #100 rst = 0;
        wait (led == 16'd3);
        #40;
        check_px(43, 23, 12'hFA0);  check_px(50, 30, 12'hFA0);   // inside the box
        check_px(40, 20, 12'h004);  check_px(42, 23, 12'h004);   // old position erased
        check_px(51, 30, 12'h004);  check_px(43, 22, 12'h004);   // just outside the box
        check_px(100, 100, 12'h004);                              // background
        if ($test$plusargs("dump")) begin : dump_fb
            integer fd, n;
            fd = $fopen("fb.txt", "w");
            for (n = 0; n < 19200; n = n + 1) $fwrite(fd, "%h\n", dut.vga_i.fb[n]);
            $fclose(fd);
        end
        if (errors == 0) $display("PASS  bounce animation (frame 3: box at 43,23)");
        else             $display("%0d BOUNCE TEST(S) FAILED", errors);
        $finish;
    end
    initial begin #40_000_000; $display("FAIL  bounce timeout"); $finish; end
endmodule
