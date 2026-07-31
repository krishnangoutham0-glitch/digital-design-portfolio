`timescale 1ns/1ps

module universal_shift_register_tb;

reg clk;
reg reset;
reg [1:0] mode;
reg serial_left;
reg serial_right;
reg [3:0] parallel_in;

wire [3:0] q;

universal_shift_register dut (
    .clk(clk),
    .reset(reset),
    .mode(mode),
    .serial_left(serial_left),
    .serial_right(serial_right),
    .parallel_in(parallel_in),
    .q(q)
);

// Clock Generation
always #5 clk = ~clk;

initial begin

    $dumpfile("universal_shift_register.vcd");
    $dumpvars(0, universal_shift_register_tb);

      clk = 0;  
reset = 1;
mode = 2'b00;
serial_left = 0;
serial_right = 0;
parallel_in = 4'b0000;

@(negedge clk);
reset = 0;

// Parallel Load
@(negedge clk);
mode = 2'b11;
parallel_in = 4'b1010;

// Hold
@(negedge clk);
mode = 2'b00;

// Shift Right
@(negedge clk);
mode = 2'b01;
serial_left = 1;

// Shift Right Again
@(negedge clk);
serial_left = 0;

// Shift Left
@(negedge clk);
mode = 2'b10;
serial_right = 1;

// Shift Left Again
@(negedge clk);
serial_right = 0;

// Parallel Load Again
@(negedge clk);
mode = 2'b11;
parallel_in = 4'b0101;

// Hold
@(negedge clk);
mode = 2'b00;

@(posedge clk);
$finish;

end

always @(posedge clk)
    $display("Time=%0t Mode=%b Q=%b", $time, mode, q);

endmodule
