// regfile.v - 32 x 32-bit register file, 2 async read ports, 1 sync write port.
// x0 is hardwired to zero.
// BYPASS = 1 : a read of the register being written this cycle returns the new
//              value (needed by the pipeline: WB writes while ID reads).
//              Must stay 0 for the single-cycle core (it would be a comb. loop).
module regfile #(
    parameter BYPASS = 0
) (
    input         clk,
    input         we,
    input  [4:0]  ra1,
    input  [4:0]  ra2,
    input  [4:0]  wa,
    input  [31:0] wd,
    output [31:0] rd1,
    output [31:0] rd2
);
    reg [31:0] regs [0:31];
    integer i;
    initial for (i = 0; i < 32; i = i + 1) regs[i] = 32'd0;

    always @(posedge clk)
        if (we && wa != 5'd0) regs[wa] <= wd;

    wire [31:0] r1 = (ra1 == 5'd0) ? 32'd0 : regs[ra1];
    wire [31:0] r2 = (ra2 == 5'd0) ? 32'd0 : regs[ra2];

    generate
        if (BYPASS) begin : g_bypass
            assign rd1 = (we && wa != 5'd0 && wa == ra1) ? wd : r1;
            assign rd2 = (we && wa != 5'd0 && wa == ra2) ? wd : r2;
        end else begin : g_nobypass
            assign rd1 = r1;
            assign rd2 = r2;
        end
    endgenerate
endmodule
