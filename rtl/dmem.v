// dmem.v - data memory (4 KB by default) with byte write strobes
module dmem #(
    parameter ADDR_BITS = 10
) (
    input         clk,
    input  [31:0] addr,                       // byte address
    input  [31:0] wdata,
    input  [3:0]  wstrb,
    output [31:0] rdata
);
    reg [31:0] mem [0:(1<<ADDR_BITS)-1];
    integer i;
    initial for (i = 0; i < (1<<ADDR_BITS); i = i + 1) mem[i] = 32'd0;

    wire [ADDR_BITS-1:0] idx = addr[ADDR_BITS+1:2];

    always @(posedge clk) begin
        if (wstrb[0]) mem[idx][7:0]   <= wdata[7:0];
        if (wstrb[1]) mem[idx][15:8]  <= wdata[15:8];
        if (wstrb[2]) mem[idx][23:16] <= wdata[23:16];
        if (wstrb[3]) mem[idx][31:24] <= wdata[31:24];
    end

    assign rdata = mem[idx];
endmodule
