`timescale 1ns/1ps

module control_unit_tb;

    reg  [3:0] opcode;
    reg  [7:0] pc;

    wire       reg_write;
    wire       pc_write;
    wire       halt;
    wire [3:0] alu_op;
    wire       imm_select;
    wire [7:0] pc_next;

    control_unit DUT (
        .opcode(opcode),
        .pc(pc),
        .reg_write(reg_write),
        .pc_write(pc_write),
        .halt(halt),
        .alu_op(alu_op),
        .imm_select(imm_select),
        .pc_next(pc_next)
    );

    initial begin
        pc = 8'd10;

        // ADD  -> expect alu_op=0000, reg_write=1, pc_write=1, pc_next=11
        opcode = 4'b0011; #20;

        // SUB  -> expect alu_op=0001
        opcode = 4'b0000; #20;

        // AND  -> expect alu_op=0010
        opcode = 4'b0010; #20;

        // OR   -> expect alu_op=0011
        opcode = 4'b0101; #20;

        // XOR  -> expect alu_op=0100
        opcode = 4'b0100; #20;

        // NOT  -> expect alu_op=0101
        opcode = 4'b0110; #20;

        // SHL  -> expect alu_op=0110
        opcode = 4'b0111; #20;

        // SHR  -> expect alu_op=0111
        opcode = 4'b1000; #20;

        // LOADI -> expect alu_op=1001 (PASS_B), imm_select=1
        opcode = 4'b0001; #20;

        // HALT -> expect halt=1, reg_write=0, pc_write=0, pc_next=pc (unchanged)
        opcode = 4'b1001; #20;

        // Undefined opcode -> expect all-safe defaults, halt=0
        opcode = 4'b1111; #20;

        $finish;
    end

    initial begin
        $dumpfile("waveforms/control_unit.vcd");
        $dumpvars(0, control_unit_tb);
    end

    initial begin
        $monitor("Time=%0t Opcode=%b PC=%0d | reg_write=%b pc_write=%b halt=%b alu_op=%b imm_select=%b pc_next=%0d",
                  $time, opcode, pc, reg_write, pc_write, halt, alu_op, imm_select, pc_next);
    end

endmodule
