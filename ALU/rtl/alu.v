`timescale 1ns/1ps

module alu (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] opcode,

    output reg [3:0] Result,
    output reg Carry,
    output reg Overflow,
    output Zero,
    output Negative
);

reg [4:0] temp;

always @(*) begin

    
    Result   = 4'b0000;
    Carry    = 1'b0;
    Overflow = 1'b0;
    temp      = 5'b00000;

    case(opcode)

        // ADD
        3'b000:
        begin
            temp = A + B;
            Result = temp[3:0];
            Carry = temp[4];

            Overflow =
                (~A[3] & ~B[3] & Result[3]) |
                ( A[3] &  B[3] & ~Result[3]);
        end

        // SUB
        3'b001:
        begin
            temp = A - B;
            Result = temp[3:0];
            Carry = temp[4];

            Overflow =
                (~A[3] & B[3] & Result[3]) |
                ( A[3] & ~B[3] & ~Result[3]);
        end

        // AND
        3'b010:
            Result = A & B;

        // OR
        3'b011:
            Result = A | B;

        // XOR
        3'b100:
            Result = A ^ B;

        // NOT
        3'b101:
            Result = ~A;

        // Shift Left
        3'b110:
            Result = A << 1;

        // Shift Right
        3'b111:
            Result = A >> 1;

    endcase

end

assign Zero = (Result == 4'b0000);

assign Negative = Result[3];

endmodule