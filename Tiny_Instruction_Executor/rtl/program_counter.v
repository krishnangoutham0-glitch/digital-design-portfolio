`timescale 1ns/1ps
module  program_counter #( parameter ADDR_WIDTH = 8)
( input  clk,
  input  reset,
  input  [ADDR_WIDTH-1:0] pc_next,
 input  pc_write,
output reg [ADDR_WIDTH-1:0]  pc );

always@(posedge clk or posedge reset)
begin
if(reset)
pc<=0;
else if(pc_write)
pc <= pc_next;
end
endmodule
