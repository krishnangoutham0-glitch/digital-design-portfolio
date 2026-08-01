`timescale 1ns / 1ps

//-------------------------------------------------------------
// Module Name : counter
// Description : 4-bit Synchronous Up/Down Counter
//-------------------------------------------------------------

module counter (
    input  wire       clk,
    input  wire       reset,
    input  wire       up_down,
    output reg [3:0]  count
);

always @(posedge clk or posedge reset) begin

    if (reset)
        count <= 4'd0;

    else if (up_down)
        count <= count + 1'b1;

    else
        count <= count - 1'b1;

end

endmodule