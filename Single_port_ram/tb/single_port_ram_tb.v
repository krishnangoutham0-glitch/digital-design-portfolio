module single_port_ram_tb;
parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 4;
parameter DEPTH      = 16;

reg clk;
reg we;
reg [ADDR_WIDTH-1:0] addr;
reg [DATA_WIDTH-1:0] data_in;
wire [DATA_WIDTH-1:0] data_out;

single_port_ram #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
) dut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("single_port_ram.vcd");
    $dumpvars(0, single_port_ram_tb);

    clk = 0;
    we = 0;
    addr = 0;
    data_in = 0;

    //--------------------------------------------------
    // Write 0xAA to Address 0
    //--------------------------------------------------
    @(negedge clk);
    we = 1;
    addr = 4'd0;
    data_in = 8'hAA;

    //--------------------------------------------------
    // Write 0x55 to Address 5
    //--------------------------------------------------
    @(negedge clk);
    addr = 4'd5;
    data_in = 8'h55;

    //--------------------------------------------------
    // Read Address 0
    //--------------------------------------------------
    @(negedge clk);
    we = 0;
    addr = 4'd0;

    //--------------------------------------------------
    // Read Address 5
    //--------------------------------------------------
    @(negedge clk);
    addr = 4'd5;

    //--------------------------------------------------
    // Read Address 10 (never written)
    //--------------------------------------------------
    @(negedge clk);
    addr = 4'd10;

    repeat(3)
        @(negedge clk);

    $finish;
end

always @(posedge clk)
begin
    $display("Time=%0t WE=%b ADDR=%0d DATA_IN=%h DATA_OUT=%h",
             $time, we, addr, data_in, data_out);
end

endmodule