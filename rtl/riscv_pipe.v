// riscv_pipe.v - 5-stage pipelined RV32I core (IF, ID, EX, MEM, WB)
//
// Hazard handling
//   * Data hazards  : forwarding EX/MEM -> EX and MEM/WB -> EX, plus a
//                     write-through register file (WB -> ID).
//   * Load-use      : 1-cycle stall (bubble into EX, PC and IF/ID held).
//   * Control       : branches/JAL/JALR resolve in EX, predict-not-taken,
//                     2 wrong-path instructions are flushed (2-cycle penalty).
//   * ECALL/EBREAK : the core spins on the instruction (acts as "halt").
//   * FENCE / CSR  : executed as NOP.
//
// Memory interface (same as riscv_single):
//   imem: combinational read of the word at imem_addr
//   dmem: word bus + byte strobes, combinational read (MEM stage)
module riscv_pipe (
    input         clk,
    input         rst,
    // instruction memory
    output [31:0] imem_addr,
    input  [31:0] imem_data,
    // data memory / peripherals (MEM stage)
    output [31:0] dmem_addr,
    output reg [31:0] dmem_wdata,
    output reg [3:0]  dmem_wstrb,
    input  [31:0] dmem_rdata,
    // performance counters
    output [31:0] perf_instret,     // instructions retired
    output [31:0] perf_stalls,      // load-use stall cycles
    output [31:0] perf_flushes      // taken branches / jumps (each costs 2 cycles)
);
    localparam [31:0] NOP = 32'h00000013;   // addi x0, x0, 0

    // ======================= pipeline registers =======================
    // IF/ID
    reg [31:0] id_pc   = 32'd0;
    reg [31:0] id_inst = NOP;
    reg        id_valid = 1'b0;
    // ID/EX
    reg        ex_valid = 1'b0;
    reg [31:0] ex_pc = 32'd0, ex_rs1_data = 32'd0, ex_rs2_data = 32'd0, ex_imm = 32'd0;
    reg [4:0]  ex_rs1 = 5'd0, ex_rs2 = 5'd0, ex_rd = 5'd0;
    reg [2:0]  ex_funct3 = 3'd0;
    reg [3:0]  ex_alu_ctrl = 4'd0;
    reg        ex_reg_write = 1'b0, ex_alu_src_a = 1'b0, ex_alu_src_b = 1'b0;
    reg        ex_mem_read = 1'b0, ex_mem_write = 1'b0, ex_link = 1'b0;
    reg        ex_branch = 1'b0, ex_jal = 1'b0, ex_jalr = 1'b0, ex_halt = 1'b0;
    // EX/MEM
    reg        mem_valid = 1'b0, mem_reg_write = 1'b0, mem_is_load = 1'b0, mem_write = 1'b0;
    reg [31:0] mem_result = 32'd0, mem_store_data = 32'd0;
    reg [4:0]  mem_rd = 5'd0;
    reg [2:0]  mem_funct3 = 3'd0;
    // MEM/WB
    reg        wb_valid = 1'b0, wb_reg_write = 1'b0;
    reg [4:0]  wb_rd = 5'd0;
    reg [31:0] wb_data = 32'd0;

    // hazard / redirect signals
    wire        stall;
    wire        redirect;
    wire [31:0] redirect_pc;

    // ============================ IF ============================
    reg  [31:0] pc = 32'd0;
    wire [31:0] pc_plus4 = pc + 32'd4;

    always @(posedge clk) begin
        if (rst)           pc <= 32'd0;
        else if (redirect) pc <= redirect_pc;
        else if (!stall)   pc <= pc_plus4;
    end
    assign imem_addr = pc;

    always @(posedge clk) begin
        if (rst || redirect) begin           // flush: insert a bubble
            id_pc <= 32'd0; id_inst <= NOP; id_valid <= 1'b0;
        end else if (!stall) begin
            id_pc <= pc;    id_inst <= imem_data; id_valid <= 1'b1;
        end                                   // stall: hold
    end

    // ============================ ID ============================
    wire [4:0] id_rd     = id_inst[11:7];
    wire [2:0] id_funct3 = id_inst[14:12];
    wire [4:0] id_rs1    = id_inst[19:15];
    wire [4:0] id_rs2    = id_inst[24:20];

    wire       d_reg_write, d_alu_src_a, d_alu_src_b, d_mem_read, d_mem_write;
    wire       d_branch, d_jal, d_jalr, d_halt, d_uses_rs1, d_uses_rs2;
    wire [1:0] d_wb_sel;
    wire [3:0] d_alu_ctrl;

    control u_ctrl (
        .opcode(id_inst[6:0]), .funct3(id_funct3), .funct7_5(id_inst[30]),
        .reg_write(d_reg_write), .alu_src_a(d_alu_src_a), .alu_src_b(d_alu_src_b),
        .mem_read(d_mem_read), .mem_write(d_mem_write), .wb_sel(d_wb_sel),
        .branch(d_branch), .jal(d_jal), .jalr(d_jalr), .halt(d_halt),
        .uses_rs1(d_uses_rs1), .uses_rs2(d_uses_rs2), .alu_ctrl(d_alu_ctrl)
    );

    wire [31:0] id_imm;
    imm_gen u_imm (.inst(id_inst), .imm(id_imm));

    wire [31:0] id_rs1_data, id_rs2_data;
    regfile #(.BYPASS(1)) u_rf (
        .clk(clk), .we(wb_reg_write),
        .ra1(id_rs1), .ra2(id_rs2), .wa(wb_rd), .wd(wb_data),
        .rd1(id_rs1_data), .rd2(id_rs2_data)
    );

    // load-use hazard: the instruction in EX is a load whose result ID needs
    assign stall = ex_mem_read && (ex_rd != 5'd0) &&
                   ((d_uses_rs1 && ex_rd == id_rs1) || (d_uses_rs2 && ex_rd == id_rs2));

    always @(posedge clk) begin
        if (rst || redirect || stall) begin  // bubble: all controls off
            ex_valid <= 1'b0;   ex_reg_write <= 1'b0; ex_mem_read <= 1'b0;
            ex_mem_write <= 1'b0; ex_link <= 1'b0;    ex_branch <= 1'b0;
            ex_jal <= 1'b0;     ex_jalr <= 1'b0;      ex_halt <= 1'b0;
            ex_alu_src_a <= 1'b0; ex_alu_src_b <= 1'b0; ex_alu_ctrl <= 4'd0;
            ex_rd <= 5'd0;      ex_rs1 <= 5'd0;       ex_rs2 <= 5'd0;
            ex_pc <= 32'd0;     ex_imm <= 32'd0;      ex_funct3 <= 3'd0;
            ex_rs1_data <= 32'd0; ex_rs2_data <= 32'd0;
        end else begin
            ex_valid <= id_valid;
            ex_pc <= id_pc;     ex_imm <= id_imm;     ex_funct3 <= id_funct3;
            ex_rs1_data <= id_rs1_data; ex_rs2_data <= id_rs2_data;
            ex_rs1 <= id_rs1;   ex_rs2 <= id_rs2;     ex_rd <= id_rd;
            ex_alu_ctrl  <= d_alu_ctrl;
            ex_reg_write <= d_reg_write;
            ex_alu_src_a <= d_alu_src_a; ex_alu_src_b <= d_alu_src_b;
            ex_mem_read  <= d_mem_read;  ex_mem_write <= d_mem_write;
            ex_link      <= (d_wb_sel == 2'b10);
            ex_branch <= d_branch; ex_jal <= d_jal; ex_jalr <= d_jalr; ex_halt <= d_halt;
        end
    end

    // ============================ EX ============================
    // forwarding (newest value wins: EX/MEM before MEM/WB before register file)
    wire fwd_a_mem = mem_reg_write && (mem_rd != 5'd0) && (mem_rd == ex_rs1);
    wire fwd_a_wb  = wb_reg_write  && (wb_rd  != 5'd0) && (wb_rd  == ex_rs1);
    wire fwd_b_mem = mem_reg_write && (mem_rd != 5'd0) && (mem_rd == ex_rs2);
    wire fwd_b_wb  = wb_reg_write  && (wb_rd  != 5'd0) && (wb_rd  == ex_rs2);

    wire [31:0] fa = fwd_a_mem ? mem_result : fwd_a_wb ? wb_data : ex_rs1_data;
    wire [31:0] fb = fwd_b_mem ? mem_result : fwd_b_wb ? wb_data : ex_rs2_data;

    wire [31:0] ex_alu_a = ex_alu_src_a ? ex_pc  : fa;
    wire [31:0] ex_alu_b = ex_alu_src_b ? ex_imm : fb;
    wire [31:0] ex_alu_y;
    alu u_alu (.a(ex_alu_a), .b(ex_alu_b), .ctrl(ex_alu_ctrl), .y(ex_alu_y));

    wire eq  = (fa == fb);
    wire lt  = ($signed(fa) < $signed(fb));
    wire ltu = (fa < fb);
    reg take;
    always @* begin
        case (ex_funct3)
            3'b000:  take = eq;
            3'b001:  take = ~eq;
            3'b100:  take = lt;
            3'b101:  take = ~lt;
            3'b110:  take = ltu;
            3'b111:  take = ~ltu;
            default: take = 1'b0;
        endcase
    end
    wire branch_taken = ex_branch & take;

    assign redirect    = ex_jal | ex_jalr | branch_taken | ex_halt;
    assign redirect_pc = ex_halt ? ex_pc :
                         ex_jalr ? {ex_alu_y[31:1], 1'b0} :
                                   (ex_pc + ex_imm);

    wire [31:0] ex_result = ex_link ? (ex_pc + 32'd4) : ex_alu_y;

    always @(posedge clk) begin
        if (rst) begin
            mem_valid <= 1'b0; mem_reg_write <= 1'b0; mem_is_load <= 1'b0; mem_write <= 1'b0;
            mem_result <= 32'd0; mem_store_data <= 32'd0; mem_rd <= 5'd0; mem_funct3 <= 3'd0;
        end else begin
            mem_valid      <= ex_valid & ~ex_halt;    // a halting EBREAK does not retire
            mem_reg_write  <= ex_reg_write;
            mem_is_load    <= ex_mem_read;
            mem_write      <= ex_mem_write;
            mem_result     <= ex_result;
            mem_store_data <= fb;
            mem_rd         <= ex_rd;
            mem_funct3     <= ex_funct3;
        end
    end

    // ============================ MEM ============================
    assign dmem_addr = mem_result;
    wire [1:0] off = mem_result[1:0];

    always @* begin
        case (mem_funct3[1:0])
            2'b00:   dmem_wdata = {4{mem_store_data[7:0]}};
            2'b01:   dmem_wdata = {2{mem_store_data[15:0]}};
            default: dmem_wdata = mem_store_data;
        endcase
        if (!mem_write) dmem_wstrb = 4'b0000;
        else case (mem_funct3[1:0])
            2'b00:   dmem_wstrb = 4'b0001 << off;
            2'b01:   dmem_wstrb = off[1] ? 4'b1100 : 4'b0011;
            default: dmem_wstrb = 4'b1111;
        endcase
    end

    reg [7:0]  ld_byte;
    reg [15:0] ld_half;
    reg [31:0] load_data;
    always @* begin
        case (off)
            2'd0: ld_byte = dmem_rdata[7:0];
            2'd1: ld_byte = dmem_rdata[15:8];
            2'd2: ld_byte = dmem_rdata[23:16];
            default: ld_byte = dmem_rdata[31:24];
        endcase
        ld_half = off[1] ? dmem_rdata[31:16] : dmem_rdata[15:0];
        case (mem_funct3)
            3'b000:  load_data = {{24{ld_byte[7]}}, ld_byte};
            3'b001:  load_data = {{16{ld_half[15]}}, ld_half};
            3'b010:  load_data = dmem_rdata;
            3'b100:  load_data = {24'd0, ld_byte};
            3'b101:  load_data = {16'd0, ld_half};
            default: load_data = dmem_rdata;
        endcase
    end

    wire [31:0] mem_value = mem_is_load ? load_data : mem_result;

    always @(posedge clk) begin
        if (rst) begin
            wb_valid <= 1'b0; wb_reg_write <= 1'b0; wb_rd <= 5'd0; wb_data <= 32'd0;
        end else begin
            wb_valid     <= mem_valid;
            wb_reg_write <= mem_reg_write;
            wb_rd        <= mem_rd;
            wb_data      <= mem_value;
        end
    end
    // ============================ WB ============================
    // The register file write port is driven directly by wb_reg_write / wb_rd / wb_data.

    // ===================== performance counters =====================
    reg [31:0] c_instret = 32'd0, c_stalls = 32'd0, c_flushes = 32'd0;
    always @(posedge clk) begin
        if (rst) begin
            c_instret <= 32'd0; c_stalls <= 32'd0; c_flushes <= 32'd0;
        end else begin
            if (wb_valid)              c_instret <= c_instret + 32'd1;
            if (stall)                 c_stalls  <= c_stalls  + 32'd1;
            if (redirect && !ex_halt)  c_flushes <= c_flushes + 32'd1;
        end
    end
    assign perf_instret = c_instret;
    assign perf_stalls  = c_stalls;
    assign perf_flushes = c_flushes;
endmodule
