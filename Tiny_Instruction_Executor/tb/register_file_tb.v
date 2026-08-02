`timescale 1ns/1ps

module register_file_tb;

parameter DATA_WIDTH = 8;
parameter REG_COUNT  = 16;

//-----------------------------------------------------
// Testbench Signals
//-----------------------------------------------------

reg clk;
reg reset;
reg write_enable;

reg [3:0] read_addr1;
reg [3:0] read_addr2;
reg [3:0] write_addr;

reg [DATA_WIDTH-1:0] write_data;

wire [DATA_WIDTH-1:0] read_data1;
wire [DATA_WIDTH-1:0] read_data2;

//-----------------------------------------------------
// DUT Instantiation
//-----------------------------------------------------

register_file DUT (
    .clk(clk),
    .reset(reset),
    .write_enable(write_enable),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

//-----------------------------------------------------
// Clock Generation
//-----------------------------------------------------

always #5 clk = ~clk;

//-----------------------------------------------------
// Test Sequence
//-----------------------------------------------------

initial begin

    // Initialize Signals
    clk          = 0;
    reset        = 1;
    write_enable = 0;

    read_addr1   = 0;
    read_addr2   = 0;
    write_addr   = 0;
    write_data   = 0;

    //-------------------------
    // Reset
    //-------------------------
    #20;
    reset = 0;

    //-------------------------
    // Write 5 into R0
    //-------------------------
    #10;
    write_enable = 1;
    write_addr   = 4'd0;
    write_data   = 8'd5;

    //-------------------------
    // Write 3 into R1
    //-------------------------
    #10;
    write_addr   = 4'd1;
    write_data   = 8'd3;

    //-------------------------
    // Disable Writing
    //-------------------------
    #10;
    write_enable = 0;

    //-------------------------
    // Read R0 and R1
    //-------------------------
    read_addr1 = 4'd0;
    read_addr2 = 4'd1;

    #20;

    //-------------------------
    // Write 8 into R2
    //-------------------------
    write_enable = 1;
    write_addr   = 4'd2;
    write_data   = 8'd8;

    #10;
    write_enable = 0;

    //-------------------------
    // Read R2
    //-------------------------
    read_addr1 = 4'd2;
    read_addr2 = 4'd0;

    #20;

    $finish;

end

//-----------------------------------------------------
// Monitor
//-----------------------------------------------------

initial begin

$monitor("Time=%0t Reset=%b WE=%b WA=%0d WD=%0d RA1=%0d RD1=%0d RA2=%0d RD2=%0d",
         $time,
         reset,
         write_enable,
         write_addr,
         write_data,
         read_addr1,
         read_data1,
         read_addr2,
         read_data2);

end

//-----------------------------------------------------
// Waveform
//-----------------------------------------------------

initial begin
    $dumpfile("waveforms/register_file.vcd");
    $dumpvars(0, register_file_tb);
end

endmodule