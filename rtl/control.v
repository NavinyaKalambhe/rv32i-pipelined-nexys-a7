// control.v - main decoder + ALU control for RV32I (shared by both cores)
module control (
    input  [6:0] opcode,
    input  [2:0] funct3,
    input        funct7_5,      // inst[30]
    output reg   reg_write,
    output reg   alu_src_a,     // 1: PC,  0: rs1
    output reg   alu_src_b,     // 1: imm, 0: rs2
    output reg   mem_read,      // load
    output reg   mem_write,     // store
    output reg [1:0] wb_sel,    // 00: ALU, 01: memory, 10: PC+4
    output reg   branch,
    output reg   jal,
    output reg   jalr,
    output reg   halt,          // ECALL / EBREAK: the core spins on this instruction
    output reg   uses_rs1,      // for load-use hazard detection
    output reg   uses_rs2,
    output reg [3:0] alu_ctrl
);
    localparam OP_R      = 7'b0110011;
    localparam OP_I      = 7'b0010011;
    localparam OP_LOAD   = 7'b0000011;
    localparam OP_STORE  = 7'b0100011;
    localparam OP_BRANCH = 7'b1100011;
    localparam OP_JAL    = 7'b1101111;
    localparam OP_JALR   = 7'b1100111;
    localparam OP_LUI    = 7'b0110111;
    localparam OP_AUIPC  = 7'b0010111;
    localparam OP_FENCE  = 7'b0001111;   // treated as NOP (single hart, no caches)
    localparam OP_SYSTEM = 7'b1110011;   // ECALL/EBREAK -> halt; CSR ops -> NOP

    // Keep these codes identical to the ones in alu.v
    localparam ALU_ADD   = 4'd0;
    localparam ALU_SUB   = 4'd1;
    localparam ALU_SLL   = 4'd2;
    localparam ALU_SLT   = 4'd3;
    localparam ALU_SLTU  = 4'd4;
    localparam ALU_XOR   = 4'd5;
    localparam ALU_SRL   = 4'd6;
    localparam ALU_SRA   = 4'd7;
    localparam ALU_OR    = 4'd8;
    localparam ALU_AND   = 4'd9;
    localparam ALU_PASSB = 4'd10;

    reg [3:0] alu_fn;
    always @* begin
        case (funct3)
            3'b000:  alu_fn = (opcode == OP_R && funct7_5) ? ALU_SUB : ALU_ADD;
            3'b001:  alu_fn = ALU_SLL;
            3'b010:  alu_fn = ALU_SLT;
            3'b011:  alu_fn = ALU_SLTU;
            3'b100:  alu_fn = ALU_XOR;
            3'b101:  alu_fn = funct7_5 ? ALU_SRA : ALU_SRL;
            3'b110:  alu_fn = ALU_OR;
            default: alu_fn = ALU_AND;
        endcase
    end

    always @* begin
        reg_write = 1'b0;  alu_src_a = 1'b0;  alu_src_b = 1'b0;
        mem_read  = 1'b0;  mem_write = 1'b0;  wb_sel    = 2'b00;
        branch    = 1'b0;  jal       = 1'b0;  jalr      = 1'b0;
        halt      = 1'b0;  uses_rs1  = 1'b0;  uses_rs2  = 1'b0;
        alu_ctrl  = ALU_ADD;

        case (opcode)
            OP_R:      begin reg_write = 1; uses_rs1 = 1; uses_rs2 = 1; alu_ctrl = alu_fn; end
            OP_I:      begin reg_write = 1; uses_rs1 = 1; alu_src_b = 1; alu_ctrl = alu_fn; end
            OP_LOAD:   begin reg_write = 1; uses_rs1 = 1; alu_src_b = 1; mem_read = 1; wb_sel = 2'b01; end
            OP_STORE:  begin mem_write = 1; uses_rs1 = 1; uses_rs2 = 1; alu_src_b = 1; end
            OP_BRANCH: begin branch = 1; uses_rs1 = 1; uses_rs2 = 1; end
            OP_JAL:    begin reg_write = 1; jal = 1; wb_sel = 2'b10; end
            OP_JALR:   begin reg_write = 1; jalr = 1; uses_rs1 = 1; alu_src_b = 1; wb_sel = 2'b10; end
            OP_LUI:    begin reg_write = 1; alu_src_b = 1; alu_ctrl = ALU_PASSB; end
            OP_AUIPC:  begin reg_write = 1; alu_src_a = 1; alu_src_b = 1; end
            OP_SYSTEM: begin if (funct3 == 3'b000) halt = 1; end
            default: ;     // FENCE and unknown opcodes behave as NOP
        endcase
    end
endmodule
