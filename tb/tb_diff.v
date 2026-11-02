`timescale 1ns/1ps
// Differential test: runs the same program on the single-cycle reference core and on the
// pipelined core, then compares (1) the stream of register writes and (2) the stream of
// memory stores. Any hazard bug in the pipeline shows up as a mismatch.
//   vvp sim +prog=sw/random_1.mem
module tb_diff;
    reg clk = 0, rst = 1;
    always #10 clk = ~clk;

    // shared program image (4096 words)
    reg [31:0] prog [0:4095];
    integer k;
    reg [1023:0] fname;
    initial begin
        for (k = 0; k < 4096; k = k + 1) prog[k] = 32'h00000013;
        if (!$value$plusargs("prog=%s", fname)) fname = "random_1.mem";
        $readmemh(fname, prog);
    end

    // ---- reference: single-cycle ----
    wire [31:0] s_ia, s_id, s_da, s_dw, s_dr;
    wire [3:0]  s_ds;
    assign s_id = prog[s_ia[13:2]];
    riscv_single ref_core (.clk(clk), .rst(rst), .imem_addr(s_ia), .imem_data(s_id),
        .dmem_addr(s_da), .dmem_wdata(s_dw), .dmem_wstrb(s_ds), .dmem_rdata(s_dr),
        .perf_instret(), .perf_stalls(), .perf_flushes());
    dmem ref_mem (.clk(clk), .addr(s_da), .wdata(s_dw), .wstrb(s_ds), .rdata(s_dr));

    // ---- device under test: pipelined ----
    wire [31:0] p_ia, p_id, p_da, p_dw, p_dr, p_instret, p_stalls, p_flushes;
    wire [3:0]  p_ds;
    assign p_id = prog[p_ia[13:2]];
    riscv_pipe dut_core (.clk(clk), .rst(rst), .imem_addr(p_ia), .imem_data(p_id),
        .dmem_addr(p_da), .dmem_wdata(p_dw), .dmem_wstrb(p_ds), .dmem_rdata(p_dr),
        .perf_instret(p_instret), .perf_stalls(p_stalls), .perf_flushes(p_flushes));
    dmem dut_mem (.clk(clk), .addr(p_da), .wdata(p_dw), .wstrb(p_ds), .rdata(p_dr));

    // ---- record the two commit streams ----
    reg [36:0] s_wr [0:16383];  integer s_nw = 0;     // {rd, value}
    reg [36:0] p_wr [0:16383];  integer p_nw = 0;
    reg [67:0] s_st [0:8191];   integer s_ns = 0;     // {addr, data, strobe}
    reg [67:0] p_st [0:8191];   integer p_ns = 0;

    integer cyc = 0, halt_cyc = 0, halt_ins = 0;
    reg halt_seen = 0;

    always @(posedge clk) if (!rst) begin
        cyc = cyc + 1;
        if (ref_core.reg_write && ref_core.rd != 0) begin
            s_wr[s_nw] = {ref_core.rd, ref_core.wb_data}; s_nw = s_nw + 1;
        end
        if (s_ds != 0) begin s_st[s_ns] = {s_da, s_dw, s_ds}; s_ns = s_ns + 1; end

        if (dut_core.wb_reg_write && dut_core.wb_rd != 0) begin
            p_wr[p_nw] = {dut_core.wb_rd, dut_core.wb_data}; p_nw = p_nw + 1;
        end
        if (p_ds != 0) begin p_st[p_ns] = {p_da, p_dw, p_ds}; p_ns = p_ns + 1; end

        if (dut_core.ex_halt && !halt_seen) begin
            halt_seen = 1; halt_cyc = cyc; halt_ins = p_instret;
        end
    end

    integer i, errors, cpi100, max_cycles;
    initial begin
        if (!$value$plusargs("max=%d", max_cycles)) max_cycles = 20000;
        #100 rst = 0;
        repeat (max_cycles) @(posedge clk);

        errors = 0;
        if (s_nw !== p_nw) begin
            $display("FAIL  register-write count: reference=%0d pipelined=%0d", s_nw, p_nw);
            errors = errors + 1;
        end
        for (i = 0; i < s_nw && i < p_nw && errors < 5; i = i + 1)
            if (s_wr[i] !== p_wr[i]) begin
                $display("FAIL  reg write #%0d: reference x%0d=%h, pipelined x%0d=%h",
                         i, s_wr[i][36:32], s_wr[i][31:0], p_wr[i][36:32], p_wr[i][31:0]);
                errors = errors + 1;
            end
        if (s_ns !== p_ns) begin
            $display("FAIL  store count: reference=%0d pipelined=%0d", s_ns, p_ns);
            errors = errors + 1;
        end
        for (i = 0; i < s_ns && i < p_ns && errors < 5; i = i + 1)
            if (s_st[i] !== p_st[i]) begin
                $display("FAIL  store #%0d differs: ref=%h pipe=%h", i, s_st[i], p_st[i]);
                errors = errors + 1;
            end

        cpi100 = (halt_ins > 0) ? (halt_cyc * 100) / halt_ins : 0;
        if (!halt_seen) begin $display("FAIL  program did not reach EBREAK in %0d cycles", max_cycles); errors = errors + 1; end
        if (errors == 0)
            $display("PASS  %0s: %0d register writes and %0d stores identical; pipelined CPI = %0d.%02d (stalls=%0d, taken branches=%0d)",
                     fname, s_nw, s_ns, cpi100/100, cpi100%100, p_stalls, p_flushes);
        $finish;
    end
endmodule
