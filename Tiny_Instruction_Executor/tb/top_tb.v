`timescale 1ns/1ps
//===========================================================
// top_tb
//-----------------------------------------------------------
// Runs the fixed program already stored in instruction_memory.v:
//   mem[0]: LOADI R0, 5
//   mem[1]: LOADI R1, 3
//   mem[2]: ADD   R2, R0, R1
//   mem[3]: HALT
//
// Expected result: R2 = 8, halt asserted, pc stops advancing.
//===========================================================
module top_tb;

    reg clk;
    reg reset;

    wire [7:0] pc_out;
    wire       halt_out;
    wire [7:0] alu_result_out;
    wire       reg_write_out;
    wire [3:0] dest_out;

    top DUT (
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out),
        .halt_out(halt_out),
        .alu_result_out(alu_result_out),
        .reg_write_out(reg_write_out),
        .dest_out(dest_out)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        #12 reset = 0;

        // Let the program run. 4 instructions, single-cycle,
        // one clock each -> well clear of that by 100ns.
        #100;

    
        if (DUT.u_register_file.reg_file[0] == 8'd5)
            $display("PASS: R0 = %0d (expected 5)", DUT.u_register_file.reg_file[0]);
        else
            $display("FAIL: R0 = %0d (expected 5)", DUT.u_register_file.reg_file[0]);

        if (DUT.u_register_file.reg_file[1] == 8'd3)
            $display("PASS: R1 = %0d (expected 3)", DUT.u_register_file.reg_file[1]);
        else
            $display("FAIL: R1 = %0d (expected 3)", DUT.u_register_file.reg_file[1]);

        if (DUT.u_register_file.reg_file[2] == 8'd8)
            $display("PASS: R2 = %0d (expected 8)", DUT.u_register_file.reg_file[2]);
        else
            $display("FAIL: R2 = %0d (expected 8)", DUT.u_register_file.reg_file[2]);

        if (DUT.u_register_file.reg_file[3] == 8'd2)
            $display("PASS: R3 = %0d (expected 2)", DUT.u_register_file.reg_file[3]);
        else
            $display("FAIL: R3 = %0d (expected 2)", DUT.u_register_file.reg_file[3]);

        if (DUT.u_register_file.reg_file[4] == 8'd1)
            $display("PASS: R4 = %0d (expected 1)", DUT.u_register_file.reg_file[4]);
        else
            $display("FAIL: R4 = %0d (expected 1)", DUT.u_register_file.reg_file[4]);

        if (DUT.u_register_file.reg_file[5] == 8'd7)
            $display("PASS: R5 = %0d (expected 7)", DUT.u_register_file.reg_file[5]);
        else
            $display("FAIL: R5 = %0d (expected 7)", DUT.u_register_file.reg_file[5]);

        if (DUT.u_register_file.reg_file[6] == 8'd6)
            $display("PASS: R6 = %0d (expected 6)", DUT.u_register_file.reg_file[6]);
        else
            $display("FAIL: R6 = %0d (expected 6)", DUT.u_register_file.reg_file[6]);

        if (DUT.u_register_file.reg_file[7] == 8'd250)
            $display("PASS: R7 = %0d (expected 250)", DUT.u_register_file.reg_file[7]);
        else
            $display("FAIL: R7 = %0d (expected 250)", DUT.u_register_file.reg_file[7]);

        if (DUT.u_register_file.reg_file[8] == 8'd10)
            $display("PASS: R8 = %0d (expected 10)", DUT.u_register_file.reg_file[8]);
        else
            $display("FAIL: R8 = %0d (expected 10)", DUT.u_register_file.reg_file[8]);

        if (DUT.u_register_file.reg_file[9] == 8'd2)
            $display("PASS: R9 = %0d (expected 2)", DUT.u_register_file.reg_file[9]);
        else
            $display("FAIL: R9 = %0d (expected 2)", DUT.u_register_file.reg_file[9]);

        if (halt_out == 1'b1)
            $display("PASS: halt asserted after HALT instruction");
        else
            $display("FAIL: halt not asserted");

        $finish;
    end

    initial begin
        $dumpfile("waveforms/top.vcd");
        $dumpvars(0, top_tb);
    end

    initial begin
        $monitor("Time=%0t PC=%0d halt=%b reg_write=%b dest=%0d alu_result=%0d | R0=%0d R1=%0d R2=%0d",
                  $time, pc_out, halt_out, reg_write_out, dest_out, alu_result_out,
                  DUT.u_register_file.reg_file[0],
                  DUT.u_register_file.reg_file[1],
                  DUT.u_register_file.reg_file[2]);
    end

endmodule
