`timescale 1ns/1ps

module alu_tb;

    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] opcode;

    wire [3:0] Result;
    wire Carry;
    wire Overflow;
    wire Zero;
    wire Negative;

    // DUT
    alu dut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .Result(Result),
        .Carry(Carry),
        .Overflow(Overflow),
        .Zero(Zero),
        .Negative(Negative)
    );

    integer i, j, k;

    initial begin

        // Waveform dump
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        $display("-------------------------------------------------------------");
        $display("Time\tOP\tA\tB\tResult\tC\tV\tZ\tN");
        $display("-------------------------------------------------------------");

        // Test every possible combination
        for (k = 0; k < 8; k = k + 1) begin
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin

                    opcode = k;
                    A = i;
                    B = j;

                    #10;

                    $display("%0t\t%b\t%0d\t%0d\t%0d\t%b\t%b\t%b\t%b",
                             $time,
                             opcode,
                             A,
                             B,
                             Result,
                             Carry,
                             Overflow,
                             Zero,
                             Negative);
                end
            end
        end

        $display("\n========================================");
        $display("All 2048 test cases completed.");
        $display("========================================");

        $finish;

    end

endmodule