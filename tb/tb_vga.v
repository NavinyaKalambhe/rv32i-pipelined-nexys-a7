`timescale 1ns/1ps
// VGA testbench: runs sw/vga_demo.mem, then checks
//   1) framebuffer contents drawn by the CPU
//   2) horizontal sync period (800 pixel clocks = 32 us)
// Run with  +dump  to also check the vsync period (16.8 ms) and write one frame to frame.txt
module tb_vga #(parameter PIPELINED = 1);
    reg         clk = 0, clk_vga = 0, rst = 1;
    reg  [15:0] sw  = 16'd0;
    wire [15:0] led;
    wire [3:0]  r, g, b;
    wire        hs, vs;
    integer     errors = 0;

    soc #(.INIT_FILE("vga_demo.mem"), .PIPELINED(PIPELINED)) dut (
        .clk(clk), .clk_vga(clk_vga), .rst(rst), .sw(sw), .led(led),
        .vga_r(r), .vga_g(g), .vga_b(b), .vga_hs(hs), .vga_vs(vs));

    always #10 clk     = ~clk;       // 50 MHz
    always #20 clk_vga = ~clk_vga;   // 25 MHz

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

    integer fd;
    reg     dumping = 0;
    time    t1, t2;

    always @(posedge clk_vga)
        if (dumping && dut.vga_i.act_q) $fwrite(fd, "%0d %0d %0d\n", r, g, b);

    initial begin
        #100 rst = 0;
        #5_000_000;                                   // CPU has finished drawing

        check_px(0,   0,   12'hFFF);  check_px(80, 0,   12'hFFF);   // top border
        check_px(80,  119, 12'hFFF);  check_px(0,  60,  12'hFFF);   // bottom, left border
        check_px(159, 60,  12'hFFF);                                 // right border
        check_px(5,   10,  12'h000);  check_px(25,  10, 12'h00F);   // black, blue
        check_px(45,  10,  12'h0F0);  check_px(65,  10, 12'h0FF);   // green, cyan
        check_px(85,  10,  12'hF00);  check_px(105, 10, 12'hF0F);   // red, magenta
        check_px(125, 10,  12'hFF0);  check_px(145, 10, 12'hFFF);   // yellow, white
        if (errors == 0) $display("PASS  framebuffer contents");

        @(negedge hs); t1 = $time;
        @(negedge hs); t2 = $time;
        if (t2 - t1 == 32000) $display("PASS  hsync period = %0d ns", t2 - t1);
        else begin $display("FAIL  hsync period = %0d ns, expected 32000", t2 - t1); errors = errors + 1; end

        if ($test$plusargs("dump")) begin
            fd = $fopen("frame.txt", "w");
            @(negedge vs); t1 = $time; dumping = 1;
            @(negedge vs); t2 = $time; dumping = 0;
            $fclose(fd);
            if (t2 - t1 == 16800000) $display("PASS  vsync period = %0d ns", t2 - t1);
            else begin $display("FAIL  vsync period = %0d ns, expected 16800000", t2 - t1); errors = errors + 1; end
        end

        if (errors == 0) $display("ALL VGA TESTS PASSED");
        else             $display("%0d VGA TEST(S) FAILED", errors);
        $finish;
    end
endmodule
