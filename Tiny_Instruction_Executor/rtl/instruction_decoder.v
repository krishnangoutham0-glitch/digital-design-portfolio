`timescale 1ns/1ps
module instruction_decoder#(
parameter INSTR_WIDTH= 16)
(input [INSTR_WIDTH-1:0] instruction,
output  [3:0] opcode,
output  [3:0] dest,
output  [3:0] src1,
output  [3:0] src2);



assign opcode = instruction[INSTR_WIDTH-1:INSTR_WIDTH-4];
assign dest   = instruction[INSTR_WIDTH-5:INSTR_WIDTH-8];
assign src1   = instruction[INSTR_WIDTH-9:INSTR_WIDTH-12];
assign src2   = instruction[INSTR_WIDTH-13:0];


endmodule
