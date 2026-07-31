`timescale 1ns/1ps

module counter #(
    parameter WIDTH = 4
)(
    input  wire             clk,
    input  wire             reset,
    input  wire             up_down,
    input  wire             enable,
    output reg [WIDTH-1:0]  count
);

always @(posedge clk or posedge reset)
begin
    if (reset)
        count <= 0;
    else if (enable)
    begin
        if (up_down)
            count <= count + 1;
        else
            count <= count - 1;
    end
end

endmodule