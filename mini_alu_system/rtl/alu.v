module alu #
(
    parameter WIDTH = 8
)
(
    input  wire [WIDTH-1:0] A,
    input  wire [WIDTH-1:0] B,
    input  wire [3:0]       opcode,

    output reg  [WIDTH-1:0] result
);

always @(*) begin
    case(opcode)

        // Arithmetic Operations
        4'b0000: result = A + B;          // ADD
        4'b0001: result = A - B;          // SUB

        // Logical Operations
        4'b0010: result = A & B;          // AND
        4'b0011: result = A | B;          // OR
        4'b0100: result = A ^ B;          // XOR
        4'b0101: result = ~(A ^ B);       // XNOR
        4'b1100: result = ~(A & B);       // NAND
        4'b1101: result = ~(A | B);       // NOR

        // Shift Operations
        4'b0110: result = A << 1;         // Left Shift
        4'b0111: result = A >> 1;         // Right Shift

        // Unary Operations
        4'b1000: result = A + 1;          // Increment
        4'b1001: result = A - 1;          // Decrement
        4'b1010: result = A;              // Pass A
        4'b1011: result = B;              // Pass B

        // Comparison
        4'b1110: result = (A == B);       // Equal -> 1, Else 0

        // Clear
        4'b1111: result = {WIDTH{1'b0}};  // Clear

        default: result = {WIDTH{1'b0}};

    endcase
end

endmodule