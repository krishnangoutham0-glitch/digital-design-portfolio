`timescale 1ns/1ps

module ring_counter_tb;

reg clk;
reg reset;

wire [3:0] q;

// DUT
ring_counter dut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock Generation (10 ns period)
always #5 clk = ~clk;

initial begin
    $dumpfile("ring_counter.vcd");
    $dumpvars(0, ring_counter_tb);

    clk = 0;
    reset = 1;

    $display("Time=%0t  Q=%b", $time, q);

    #20;
    reset = 0;

    #120;
    $finish;
end

// Display output on every rising edge
always @(posedge clk) begin
    $display("Time=%0t  Q=%b", $time, q);
end

endmodule