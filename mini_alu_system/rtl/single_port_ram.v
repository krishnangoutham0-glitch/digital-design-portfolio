`timescale 1ns/1ps

module single_port_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4,
    parameter DEPTH      = 16
)(
    input  wire                      clk,
    input  wire                      we,
    input  wire [ADDR_WIDTH-1:0]     addr,
    input  wire [DATA_WIDTH-1:0]     data_in,
    output reg  [DATA_WIDTH-1:0]     data_out
);

    // Memory Array
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    always @(posedge clk)
    begin
        if (we)
            mem[addr] <= data_in;

        data_out <= mem[addr];
    end

endmodule