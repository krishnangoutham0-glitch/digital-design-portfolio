`timescale 1ns/1ps

module lfsr_4bit (
    input  wire clk,
    input  wire reset,
    output reg  [3:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 4'b0001;              // Non-zero seed
    else
        q <= {q[2:0], q[3] ^ q[2]}; // Feedback from Q3 XOR Q2
end

endmodule