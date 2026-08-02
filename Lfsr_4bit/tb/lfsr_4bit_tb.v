`timescale 1ns/1ps

module lfsr_4bit_tb;

reg clk;
reg reset;
wire [3:0] q;

// Instantiate DUT
lfsr_4bit dut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock Generation
always #5 clk = ~clk;

// Stimulus
initial begin
    $dumpfile("sim/lfsr_4bit.vcd");
    $dumpvars(0, lfsr_4bit_tb);

    clk = 0;
    reset = 1;

    // Hold reset for two clock cycles
    @(negedge clk);
    @(negedge clk);
    reset = 0;

    // Run for 20 clock cycles
    repeat (20)
        @(negedge clk);

    $finish;
end

// Monitor Output
always @(posedge clk) begin
    $display("Time=%0t Q=%b", $time, q);
end

endmodule