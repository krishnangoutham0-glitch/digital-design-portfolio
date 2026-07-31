`timescale 1ns/1ps

module universal_shift_register (
    input  wire       clk,
    input  wire       reset,
    input  wire [1:0] mode,
    input  wire       serial_left,
    input  wire       serial_right,
    input  wire [3:0] parallel_in,
    output reg  [3:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 4'b0000;
    else begin
        case (mode)

            // Hold
            2'b00:
                q <= q;

            // Shift Right
            2'b01:
                q <= {serial_left, q[3:1]};

            // Shift Left
            2'b10:
                q <= {q[2:0], serial_right};

            // Parallel Load
            2'b11:
                q <= parallel_in;

            default:
                q <= q;

        endcase
    end
end

endmodule