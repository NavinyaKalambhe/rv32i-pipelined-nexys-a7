`timescale 1ns/1ps
// LED demo (program.mem): LEDs = 55 + switches. Works for both cores.
module tb_soc #(parameter PIPELINED = 1);
    reg         clk = 0, clk_vga = 0, rst = 1;
    reg  [15:0] sw  = 16'd0;
    wire [15:0] led;
    wire [3:0]  vr, vg, vb;
    wire        vhs, vvs;
    integer     errors = 0;

    soc #(.INIT_FILE("program.mem"), .PIPELINED(PIPELINED)) dut (
        .clk(clk), .clk_vga(clk_vga), .rst(rst), .sw(sw), .led(led),
        .vga_r(vr), .vga_g(vg), .vga_b(vb), .vga_hs(vhs), .vga_vs(vvs));

    always #10 clk     = ~clk;       // 50 MHz CPU clock
    always #20 clk_vga = ~clk_vga;   // 25 MHz pixel clock

    task check(input [15:0] expected, input [255:0] name);
        begin
            if (led === expected) $display("PASS  %0s: LED = %0d", name, led);
            else begin
                $display("FAIL  %0s: LED = %0d, expected %0d", name, led, expected);
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        if (PIPELINED) $display("core: pipelined"); else $display("core: single-cycle");
        #100 rst = 0;
        #5000;
        check(16'd55, "sum 1..10 + switches(0)");
        sw = 16'd1;   #1000; check(16'd56,  "switch 0 on");
        sw = 16'd100; #1000; check(16'd155, "switches = 100");
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
