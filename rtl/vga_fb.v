// vga_fb.v - 160x120 framebuffer (12-bit colour) shown on 640x480 @ 60 Hz VGA
//
// * Each framebuffer pixel is drawn 4x4 on screen (160*4 = 640, 120*4 = 480).
// * clk_v = 25 MHz pixel clock, clk_w = CPU clock (any frequency). The two ports of
//   the block RAM have independent clocks, so no extra synchroniser is needed.
// * CPU side: write port (pixel index = y*160 + x, data = 0xRGB, 4 bits each).
// * Video side: read port, 1-cycle BRAM latency, sync signals delayed to match.
// * The framebuffer starts with a colour-gradient test pattern so you can
//   check the monitor connection before any program draws anything.
module vga_fb (
    input         clk_w,      // CPU clock (write port)
    input         clk_v,      // 25 MHz pixel clock (read port + sync)
    // CPU write port
    input         we,
    input  [14:0] waddr,
    input  [11:0] wdata,
    // VGA pins
    output reg [3:0] vga_r  = 4'd0,
    output reg [3:0] vga_g  = 4'd0,
    output reg [3:0] vga_b  = 4'd0,
    output reg       vga_hs = 1'b1,
    output reg       vga_vs = 1'b1
);
    // 640x480 @ 60 Hz timing (negative sync polarity)
    localparam H_VIS = 640, H_FP = 16, H_SYNC = 96, H_TOT = 800;
    localparam V_VIS = 480, V_FP = 10, V_SYNC = 2,  V_TOT = 525;

    // ---------------- framebuffer memory ----------------
    (* ram_style = "block" *) reg [11:0] fb [0:32767];

    integer i, ix, iy;
    initial begin
        for (i = 0; i < 32768; i = i + 1) begin
            ix = i % 160;
            iy = i / 160;
            if (i < 19200) fb[i] = ((ix / 10) << 8) | ((iy / 8) << 4) | 12'h008;
            else           fb[i] = 12'h000;
        end
    end

    always @(posedge clk_w)
        if (we) fb[waddr] <= wdata;

    // ---------------- sync counters ----------------
    reg [9:0] hcnt = 10'd0;
    reg [9:0] vcnt = 10'd0;

    always @(posedge clk_v) begin
        if (hcnt == H_TOT - 1) begin
            hcnt <= 10'd0;
            vcnt <= (vcnt == V_TOT - 1) ? 10'd0 : vcnt + 10'd1;
        end else begin
            hcnt <= hcnt + 10'd1;
        end
    end

    wire active = (hcnt < H_VIS) && (vcnt < V_VIS);
    wire hs     = ~((hcnt >= H_VIS + H_FP) && (hcnt < H_VIS + H_FP + H_SYNC));
    wire vs     = ~((vcnt >= V_VIS + V_FP) && (vcnt < V_VIS + V_FP + V_SYNC));

    // ---------------- pixel address: (y/4)*160 + (x/4) ----------------
    wire [6:0]  fy = vcnt[8:2];
    wire [7:0]  fx = hcnt[9:2];
    wire [14:0] raddr = {1'b0, fy, 7'b0} + {3'b0, fy, 5'b0} + {7'b0, fx};   // fy*128 + fy*32 + fx

    // ---------------- 2-stage pipeline: BRAM read, then output register ----------------
    reg [11:0] pix    = 12'd0;
    reg        act_d1 = 1'b0, hs_d1 = 1'b1, vs_d1 = 1'b1;
    reg        act_q  = 1'b0;           // aligned with the VGA outputs (used by the testbench)

    always @(posedge clk_v) begin
        pix    <= fb[raddr];
        act_d1 <= active;
        hs_d1  <= hs;
        vs_d1  <= vs;

        act_q  <= act_d1;
        vga_hs <= hs_d1;
        vga_vs <= vs_d1;
        {vga_r, vga_g, vga_b} <= act_d1 ? pix : 12'h000;
    end
endmodule
