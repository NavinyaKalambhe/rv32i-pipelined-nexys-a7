// soc.v - CPU + instruction memory + data memory + I/O + VGA framebuffer
//
// PIPELINED = 1 : 5-stage pipelined core (default)
// PIPELINED = 0 : single-cycle reference core
//
// Memory map (data side)
//   0x0000_0000 - 0x0000_0FFF : data RAM (4 KB)
//   0x1000_0000               : LEDs            (read/write, [15:0])
//   0x1000_0004               : switches        (read)
//   0x1000_0008               : cycle counter   (read)
//   0x1000_000C               : instructions retired (read)
//   0x1000_0010               : load-use stall cycles (read)
//   0x1000_0014               : taken branches/jumps (read)
//   0x2000_0000 + 4*(y*160+x) : VGA framebuffer 160x120, write only, use SW,
//                               data = 0x0RGB (4 bits per colour)
module soc #(
    parameter INIT_FILE = "program.mem",
    parameter PIPELINED = 1
) (
    input         clk,          // CPU clock
    input         clk_vga,      // 25 MHz pixel clock
    input         rst,
    input  [15:0] sw,
    output [15:0] led,
    output [3:0]  vga_r,
    output [3:0]  vga_g,
    output [3:0]  vga_b,
    output        vga_hs,
    output        vga_vs
);
    wire [31:0] imem_addr, imem_data;
    wire [31:0] dmem_addr, dmem_wdata, ram_rdata;
    wire [3:0]  dmem_wstrb;
    reg  [31:0] dmem_rdata;
    wire [31:0] perf_instret, perf_stalls, perf_flushes;
    reg  [15:0] led_r  = 16'd0;
    reg  [31:0] cycles = 32'd0;

    wire is_io = (dmem_addr[31:28] == 4'h1);
    wire is_fb = (dmem_addr[31:28] == 4'h2);

    generate
        if (PIPELINED) begin : g_pipe
            riscv_pipe cpu (
                .clk(clk), .rst(rst),
                .imem_addr(imem_addr), .imem_data(imem_data),
                .dmem_addr(dmem_addr), .dmem_wdata(dmem_wdata),
                .dmem_wstrb(dmem_wstrb), .dmem_rdata(dmem_rdata),
                .perf_instret(perf_instret), .perf_stalls(perf_stalls), .perf_flushes(perf_flushes)
            );
        end else begin : g_single
            riscv_single cpu (
                .clk(clk), .rst(rst),
                .imem_addr(imem_addr), .imem_data(imem_data),
                .dmem_addr(dmem_addr), .dmem_wdata(dmem_wdata),
                .dmem_wstrb(dmem_wstrb), .dmem_rdata(dmem_rdata),
                .perf_instret(perf_instret), .perf_stalls(perf_stalls), .perf_flushes(perf_flushes)
            );
        end
    endgenerate

    imem #(.INIT_FILE(INIT_FILE)) imem_i (
        .addr(imem_addr), .data(imem_data)
    );

    dmem dmem_i (
        .clk(clk), .addr(dmem_addr), .wdata(dmem_wdata),
        .wstrb((is_io | is_fb) ? 4'b0000 : dmem_wstrb), .rdata(ram_rdata)
    );

    vga_fb vga_i (
        .clk_w(clk), .clk_v(clk_vga),
        .we(is_fb & (&dmem_wstrb)),
        .waddr(dmem_addr[16:2]),
        .wdata(dmem_wdata[11:0]),
        .vga_r(vga_r), .vga_g(vga_g), .vga_b(vga_b),
        .vga_hs(vga_hs), .vga_vs(vga_vs)
    );

    always @(posedge clk) begin
        if (rst) begin
            led_r  <= 16'd0;
            cycles <= 32'd0;
        end else begin
            cycles <= cycles + 32'd1;
            if (is_io && (|dmem_wstrb) && dmem_addr[4:2] == 3'd0)
                led_r <= dmem_wdata[15:0];
        end
    end
    assign led = led_r;

    always @* begin
        if (is_io) begin
            case (dmem_addr[4:2])
                3'd0:    dmem_rdata = {16'd0, led_r};
                3'd1:    dmem_rdata = {16'd0, sw};
                3'd2:    dmem_rdata = cycles;
                3'd3:    dmem_rdata = perf_instret;
                3'd4:    dmem_rdata = perf_stalls;
                3'd5:    dmem_rdata = perf_flushes;
                default: dmem_rdata = 32'd0;
            endcase
        end else if (is_fb) begin
            dmem_rdata = 32'd0;          // framebuffer is write-only
        end else begin
            dmem_rdata = ram_rdata;
        end
    end
endmodule
