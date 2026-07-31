`timescale 1ns/1ps

module top(

    input  wire       clk,
    input  wire       reset,
    input  wire       up_down,

    input  wire [7:0] A,
    input  wire [7:0] B,

    output wire [3:0] count,
    output wire [7:0] result,
    output wire [7:0] data_out

);


/////////////////////////////////////////////////////
// Counter
/////////////////////////////////////////////////////

counter U_COUNTER
(
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .enable(1'b1),
    .count(count)
);
/////////////////////////////////////////////////////
// ALU
/////////////////////////////////////////////////////

alu #(
    .WIDTH(8)
)
U_ALU
(
    .A(A),
    .B(B),
    .opcode(count),
    .result(result)
);

/////////////////////////////////////////////////////
// RAM
/////////////////////////////////////////////////////

single_port_ram
#(
    .DATA_WIDTH(8),
    .ADDR_WIDTH(4),
    .DEPTH(16)
)
U_RAM
(
    .clk(clk),
    .we(1'b1),          // Always Write
    .addr(count),       // Counter = Address
    .data_in(result),   // ALU Result

    .data_out(data_out)
);

endmodule