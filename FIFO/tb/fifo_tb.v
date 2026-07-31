`timescale 1ns/1ps

module fifo_tb;

parameter DATA_WIDTH = 8;
parameter DEPTH      = 4;
parameter ADDR_WIDTH = 2;

reg clk;
reg reset;
reg wr_en;
reg rd_en;
reg [DATA_WIDTH-1:0] data_in;

wire [DATA_WIDTH-1:0] data_out;
wire full;
wire empty;

reg [7:0] i;

fifo dut(
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("fifo.vcd");
    $dumpvars(0,fifo_tb);

    clk=0;
    reset=1;
    wr_en=0;
    rd_en=0;
    data_in=0;

    //-----------------
    // Reset
    //-----------------
    @(negedge clk);
    reset=0;

    //-----------------
    // Fill FIFO
    //-----------------
    $display("\n===== Filling FIFO =====");

    for(i=0;i<DEPTH;i=i+1)
    begin
        @(negedge clk);
        wr_en=1;
        rd_en=0;
        data_in=8'h10+i;
    end

    @(negedge clk);
    wr_en=0;

    //-----------------
    // Extra Write
    //-----------------
    $display("\n===== Write when FULL =====");

    @(negedge clk);
    wr_en=1;
    data_in=8'hFF;

    @(negedge clk);
    wr_en=0;

    //-----------------
    // Read two
    //-----------------
    $display("\n===== Read Two =====");

    for(i=0;i<2;i=i+1)
    begin
        @(negedge clk);
        rd_en=1;
    end

    @(negedge clk);
    rd_en=0;

    //-----------------
    // Wrap Around
    //-----------------
    $display("\n===== Wrap Around =====");

    for(i=0;i<2;i=i+1)
    begin
        @(negedge clk);
        wr_en=1;
        data_in=8'h20+i;
    end

    @(negedge clk);
    wr_en=0;

    //-----------------
    // Empty FIFO
    //-----------------
    $display("\n===== Empty FIFO =====");

    while(!empty)
    begin
        @(negedge clk);
        rd_en=1;
    end

    @(negedge clk);
    rd_en=0;

    //-----------------
    // Extra Read
    //-----------------
    $display("\n===== Read when EMPTY =====");

    @(negedge clk);
    rd_en=1;

    @(negedge clk);
    rd_en=0;

    //-----------------
    // Simultaneous R/W
    //-----------------
    $display("\n===== Simultaneous Read/Write =====");

    // write one word

    @(negedge clk);
    wr_en=1;
    data_in=8'h55;

    @(negedge clk);
    wr_en=0;

    // simultaneous

    @(negedge clk);
    wr_en=1;
    rd_en=1;
    data_in=8'hAA;

    @(negedge clk);
    wr_en=0;
    rd_en=0;

    repeat(3)
        @(negedge clk);

    $finish;

end

always @(posedge clk)
begin
    $display("T=%0t WR=%b RD=%b DIN=%h DOUT=%h WP=%0d RP=%0d CNT=%0d FULL=%b EMPTY=%b",
    $time,
    wr_en,
    rd_en,
    data_in,
    data_out,
    dut.wr_ptr,
    dut.rd_ptr,
    dut.count,
    full,
    empty);
end

endmodule