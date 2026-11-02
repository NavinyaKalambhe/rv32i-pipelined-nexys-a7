// imem.v - instruction memory (4 KB by default), loaded from a hex file
module imem #(
    parameter ADDR_BITS = 10,                 // 2^10 words = 4 KB
    parameter INIT_FILE = "program.mem"
) (
    input  [31:0] addr,                       // byte address
    output [31:0] data
);
    reg [31:0] mem [0:(1<<ADDR_BITS)-1];
    integer i;

    initial begin
        for (i = 0; i < (1<<ADDR_BITS); i = i + 1)
            mem[i] = 32'h00000013;            // NOP (addi x0,x0,0)
        $readmemh(INIT_FILE, mem);
    end

    assign data = mem[addr[ADDR_BITS+1:2]];
endmodule
