`timescale 1ns/1ps
module instruction_memory #(
parameter ADDR_WIDTH = 8,
parameter INSTR_WIDTH= 16)
( input [ADDR_WIDTH-1:0] address,
output reg [INSTR_WIDTH-1:0] instruction);

reg [INSTR_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

initial begin
        mem[0] = 16'b0001_0000_0000_0101; // LOADI R0, 5
        mem[1] = 16'b0001_0001_0000_0011; // LOADI R1, 3
        mem[2] = 16'b0011_0010_0000_0001; // ADD   R2, R0, R1
        mem[3] = 16'b1001_0000_0000_0000; // HALT
end
always@(*)
assign instruction = mem[address];
endmodule
