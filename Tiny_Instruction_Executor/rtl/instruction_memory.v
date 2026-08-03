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
        mem[3] = 16'b0000_0011_0000_0001; // SUB   R3, R0, R1
        mem[4] = 16'b0010_0100_0000_0001; // AND   R4, R0, R1
        mem[5] = 16'b0101_0101_0000_0001; // OR    R5, R0, R1
        mem[6] = 16'b0100_0110_0000_0001; // XOR   R6, R0, R1
        mem[7] = 16'b0110_0111_0000_0000; // NOT   R7, R0
        mem[8] = 16'b0111_1000_0000_0000; // SHL   R8, R0
        mem[9] = 16'b1000_1001_0000_0000; // SHR   R9, R0
        mem[10] = 16'b1001_0000_0000_0000;// HALT
end
always @(*) begin
    instruction = mem[address];
end
endmodule
