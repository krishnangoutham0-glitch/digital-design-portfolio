`timescale 1ns/1ps
//===========================================================
// Control Unit
//-----------------------------------------------------------
// Decodes the instruction opcode into the control signals
// needed by the rest of the datapath (Register File, ALU,
// Program Counter).
//
// NOTE ON OPCODE MAP:
// This map was reconciled against instruction_memory.v and
// instruction_decoder.v, which already have verified
// simulations using:
//   LOADI = 4'b0001
//   ADD   = 4'b0011
//   HALT  = 4'b1001
// Those three values are kept exactly as-is. The remaining
// ALU instructions (SUB/AND/XOR/OR/NOT/SHL/SHR) are assigned
// to the unused 4-bit codes below. If you add instructions
// later, extend this table -- do not reuse a code that is
// already verified elsewhere.
//===========================================================
module control_unit (
    input  [3:0] opcode,
    input  [7:0] pc,

    output reg       reg_write,   // enable Register File write
    output reg       pc_write,    // enable Program Counter update
    output reg       halt,        // processor halted
    output reg [3:0] alu_op,      // operation sent to the ALU
    output reg       imm_select,  // 1 = ALU's B operand is the immediate (src2 field), not a register
    output reg [7:0] pc_next      // next PC value
);

    //-------------------------------------------------------
    // ALU operation codes (must match alu.v exactly)
    //-------------------------------------------------------
    localparam ALU_ADD    = 4'b0000;
    localparam ALU_SUB    = 4'b0001;
    localparam ALU_AND    = 4'b0010;
    localparam ALU_OR     = 4'b0011;
    localparam ALU_XOR    = 4'b0100;
    localparam ALU_NOT    = 4'b0101;
    localparam ALU_SHL    = 4'b0110;
    localparam ALU_SHR    = 4'b0111;
    localparam ALU_PASS_A = 4'b1000;
    localparam ALU_PASS_B = 4'b1001;

    //-------------------------------------------------------
    // Instruction opcodes (must match instruction_memory.v)
    //-------------------------------------------------------
    localparam OP_SUB   = 4'b0000;
    localparam OP_LOADI = 4'b0001;   // verified in instruction_memory.v
    localparam OP_AND   = 4'b0010;
    localparam OP_ADD   = 4'b0011;   // verified in instruction_memory.v
    localparam OP_XOR   = 4'b0100;
    localparam OP_OR    = 4'b0101;
    localparam OP_NOT   = 4'b0110;
    localparam OP_SHL   = 4'b0111;
    localparam OP_SHR   = 4'b1000;
    localparam OP_HALT  = 4'b1001;   // verified in instruction_memory.v

    always @(*) begin
        //---------------------------------------------------
        // Defaults (HALT-safe: nothing changes, nothing writes)
        //---------------------------------------------------
        reg_write  = 1'b0;
        pc_write   = 1'b0;
        halt       = 1'b0;
        alu_op     = ALU_ADD;
        imm_select = 1'b0;
        pc_next    = pc;

        case (opcode)

            OP_ADD: begin
                reg_write = 1'b1;
                pc_write  = 1'b1;
                alu_op    = ALU_ADD;
                pc_next   = pc + 1;
            end

            OP_SUB: begin
                reg_write = 1'b1;
                pc_write  = 1'b1;
                alu_op    = ALU_SUB;
                pc_next   = pc + 1;
            end

            OP_AND: begin
                reg_write = 1'b1;
                pc_write  = 1'b1;
                alu_op    = ALU_AND;
                pc_next   = pc + 1;
            end

            OP_OR: begin
                reg_write = 1'b1;
                pc_write  = 1'b1;
                alu_op    = ALU_OR;
                pc_next   = pc + 1;
            end

            OP_XOR: begin
                reg_write = 1'b1;
                pc_write  = 1'b1;
                alu_op    = ALU_XOR;
                pc_next   = pc + 1;
            end

            OP_NOT: begin
                reg_write = 1'b1;
                pc_write  = 1'b1;
                alu_op    = ALU_NOT;
                pc_next   = pc + 1;
            end

            OP_SHL: begin
                reg_write = 1'b1;
                pc_write  = 1'b1;
                alu_op    = ALU_SHL;
                pc_next   = pc + 1;
            end

            OP_SHR: begin
                reg_write = 1'b1;
                pc_write  = 1'b1;
                alu_op    = ALU_SHR;
                pc_next   = pc + 1;
            end

            OP_LOADI: begin
                // Immediate (src2 field) is routed straight through the
                // ALU using PASS_B, then written into the register file.
                reg_write  = 1'b1;
                pc_write   = 1'b1;
                alu_op     = ALU_PASS_B;
                imm_select = 1'b1;
                pc_next    = pc + 1;
            end

            OP_HALT: begin
                reg_write = 1'b0;
                pc_write  = 1'b0;
                halt      = 1'b1;
                alu_op    = ALU_ADD;
                pc_next   = pc;
            end

            default: begin
                reg_write  = 1'b0;
                pc_write   = 1'b0;
                halt       = 1'b0;
                alu_op     = ALU_ADD;
                imm_select = 1'b0;
                pc_next    = pc;
            end

        endcase
    end

endmodule
