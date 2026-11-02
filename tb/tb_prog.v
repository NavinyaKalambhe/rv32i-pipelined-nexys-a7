`timescale 1ns/1ps
// Runs any self-checking program: it passes when the program writes 0xAAAA to the LEDs,
// and fails on any other non-zero LED value (= failing test number) or on timeout.
//   vvp sim +prog=sw/hazard_test.mem [+max=50000]
// Also reports cycles, retired instructions and CPI.
module tb_prog #(parameter PIPELINED = 1);
    reg         clk = 0, clk_vga = 0, rst = 1;
    reg  [15:0] sw  = 16'd0;
    wire [15:0] led;
    wire [3:0]  vr, vg, vb;
    wire        vhs, vvs;

    soc #(.INIT_FILE("program.mem"), .PIPELINED(PIPELINED)) dut (
        .clk(clk), .clk_vga(clk_vga), .rst(rst), .sw(sw), .led(led),
        .vga_r(vr), .vga_g(vg), .vga_b(vb), .vga_hs(vhs), .vga_vs(vvs));

    always #10 clk     = ~clk;
    always #20 clk_vga = ~clk_vga;

    reg [1023:0] fname;
    integer max_cycles;
    reg done = 0;
    integer cyc, ins, stl, fls, cpi100;

    initial begin
        #1;
        if ($value$plusargs("prog=%s", fname)) $readmemh(fname, dut.imem_i.mem);
    end

    always @(led) begin
        if (!done && !rst && led !== 16'd0) begin
            done = 1;
            cyc = dut.cycles; ins = dut.perf_instret; stl = dut.perf_stalls; fls = dut.perf_flushes;
            cpi100 = (ins > 0) ? (cyc * 100) / ins : 0;
            if (led === 16'hAAAA)
                $display("PASS  %0s  PIPELINED=%0d  cycles=%0d  instr=%0d  CPI=%0d.%02d  stalls=%0d  taken-branches=%0d",
                         fname, PIPELINED, cyc, ins, cpi100/100, cpi100%100, stl, fls);
            else
                $display("FAIL  %0s  PIPELINED=%0d  failing test number = %0d", fname, PIPELINED, led);
            $finish;
        end
    end

    initial begin
        if (!$value$plusargs("max=%d", max_cycles)) max_cycles = 50000;
        #100 rst = 0;
        repeat (max_cycles) @(posedge clk);
        if (!done) $display("FAIL  %s timeout after %0d cycles (LED=%h)", fname, max_cycles, led);
        $finish;
    end
endmodule
