`timescale 1ns/1ps

module top_tb;

reg clk;
reg reset;
reg up_down;

reg [7:0] A;
reg [7:0] B;

wire [3:0] count;
wire [7:0] result;
wire [7:0] data_out;

/////////////////////////////////////////////////////
// DUT
/////////////////////////////////////////////////////

top DUT
(
    .clk(clk),
    .reset(reset),
    .up_down(up_down),

    .A(A),
    .B(B),

    .count(count),
    .result(result),
    .data_out(data_out)
);

/////////////////////////////////////////////////////
// Clock
/////////////////////////////////////////////////////

always #5 clk = ~clk;

/////////////////////////////////////////////////////
// Stimulus
/////////////////////////////////////////////////////

initial
begin

    clk = 0;
    reset = 1;
    up_down = 1;

    A = 8'd21;
    B = 8'd3;

    #20;
    reset = 0;

    // Run through all 16 operations
    #160;

    $display("\n---------------- RAM CONTENT ----------------");

    $display("RAM[0]  = %0d", DUT.U_RAM.mem[0]);
    $display("RAM[1]  = %0d", DUT.U_RAM.mem[1]);
    $display("RAM[2]  = %0d", DUT.U_RAM.mem[2]);
    $display("RAM[3]  = %0d", DUT.U_RAM.mem[3]);
    $display("RAM[4]  = %0d", DUT.U_RAM.mem[4]);
    $display("RAM[5]  = %0d", DUT.U_RAM.mem[5]);
    $display("RAM[6]  = %0d", DUT.U_RAM.mem[6]);
    $display("RAM[7]  = %0d", DUT.U_RAM.mem[7]);
    $display("RAM[8]  = %0d", DUT.U_RAM.mem[8]);
    $display("RAM[9]  = %0d", DUT.U_RAM.mem[9]);
    $display("RAM[10] = %0d", DUT.U_RAM.mem[10]);
    $display("RAM[11] = %0d", DUT.U_RAM.mem[11]);
    $display("RAM[12] = %0d", DUT.U_RAM.mem[12]);
    $display("RAM[13] = %0d", DUT.U_RAM.mem[13]);
    $display("RAM[14] = %0d", DUT.U_RAM.mem[14]);
    $display("RAM[15] = %0d", DUT.U_RAM.mem[15]);

    $finish;

end

/////////////////////////////////////////////////////
// Waveform
/////////////////////////////////////////////////////

initial
begin
    $dumpfile("top.vcd");
    $dumpvars(0, top_tb);
end

/////////////////////////////////////////////////////
// Monitor
/////////////////////////////////////////////////////

initial
begin
    $monitor("Time=%0t Count=%0d Result=%0d RAM_Out=%0d",
              $time, count, result, data_out);
end

endmodule