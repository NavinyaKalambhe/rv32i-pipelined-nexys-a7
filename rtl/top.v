// top.v - Nexys A7 top level
// 100 MHz board clock -> 50 MHz CPU clock and 25 MHz VGA pixel clock
// (640x480@60Hz needs ~25.175 MHz; 25 MHz works on practically all monitors).
module top (
    input         CLK100MHZ,
    input         CPU_RESETN,    // active-low reset button
    input  [15:0] SW,
    output [15:0] LED,
    output [3:0]  VGA_R,
    output [3:0]  VGA_G,
    output [3:0]  VGA_B,
    output        VGA_HS,
    output        VGA_VS
);
    // Program loaded into instruction memory:
    //   "interactive.mem" switch-controlled bouncing box (default)
    //   "bounce.mem"      bouncing box animation
    //   "vga_demo.mem"    colour bars
    //   "program.mem"     LED demo
    localparam PROGRAM = "interactive.mem";

    reg [1:0] div = 2'b00;
    always @(posedge CLK100MHZ) div <= div + 1'b1;

    wire clk_cpu, clk_vga;
    BUFG cpu_buf (.I(div[0]), .O(clk_cpu));   // 50 MHz
    BUFG vga_buf (.I(div[1]), .O(clk_vga));   // 25 MHz

    // reset synchroniser (active-high inside the design)
    reg [1:0] rst_sync = 2'b11;
    always @(posedge clk_cpu) rst_sync <= {rst_sync[0], ~CPU_RESETN};
    wire rst = rst_sync[1];

    // switch synchroniser
    reg [15:0] sw_s1 = 16'd0, sw_s2 = 16'd0;
    always @(posedge clk_cpu) begin
        sw_s1 <= SW;
        sw_s2 <= sw_s1;
    end

    soc #(.INIT_FILE(PROGRAM), .PIPELINED(1)) soc_i (
        .clk(clk_cpu), .clk_vga(clk_vga), .rst(rst), .sw(sw_s2), .led(LED),
        .vga_r(VGA_R), .vga_g(VGA_G), .vga_b(VGA_B),
        .vga_hs(VGA_HS), .vga_vs(VGA_VS)
    );
endmodule
