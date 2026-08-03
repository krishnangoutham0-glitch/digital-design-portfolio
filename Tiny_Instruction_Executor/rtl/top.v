`timescale 1ns/1ps
//===========================================================
// top
//-----------------------------------------------------------
// Wires together the six verified modules into a minimal
// single-cycle instruction executor:
//
//   PC -> Instruction Memory -> Decoder -> Control Unit
//                                   |
//                                   v
//                            Register File <-> ALU
//
// Immediate handling:
//   LOADI uses the 4-bit src2 field as an immediate value.
//   control_unit asserts imm_select, which selects the
//   zero-extended immediate as the ALU's B operand instead
//   of the second register read port.
//===========================================================
module top #(
    parameter ADDR_WIDTH  = 8,
    parameter INSTR_WIDTH = 16,
    parameter DATA_WIDTH  = 8,
    parameter REG_COUNT   = 16
)(
    input  clk,
    input  reset,

    // Debug / observability outputs
    output [ADDR_WIDTH-1:0] pc_out,
    output                  halt_out,
    output [DATA_WIDTH-1:0] alu_result_out,
    output                  reg_write_out,
    output [3:0]            dest_out
);

    //-------------------------------------------------------
    // Internal wires
    //-------------------------------------------------------
    wire [ADDR_WIDTH-1:0]  pc_w;
    wire [ADDR_WIDTH-1:0]  pc_next_w;
    wire                   pc_write_w;

    wire [INSTR_WIDTH-1:0] instruction_w;

    wire [3:0] opcode_w;
    wire [3:0] dest_w;
    wire [3:0] src1_w;
    wire [3:0] src2_w;

    wire       reg_write_w;
    wire       halt_w;
    wire [3:0] alu_op_w;
    wire       imm_select_w;

    wire [DATA_WIDTH-1:0] read_data1_w;
    wire [DATA_WIDTH-1:0] read_data2_w;
    wire [DATA_WIDTH-1:0] alu_b_w;
    wire [DATA_WIDTH-1:0] alu_result_w;
    wire                  alu_zero_w;

    //-------------------------------------------------------
    // Program Counter
    //-------------------------------------------------------
    program_counter #(
        .ADDR_WIDTH(ADDR_WIDTH)
    ) u_pc (
        .clk(clk),
        .reset(reset),
        .pc_next(pc_next_w),
        .pc_write(pc_write_w),
        .pc(pc_w)
    );

    //-------------------------------------------------------
    // Instruction Memory
    //-------------------------------------------------------
    instruction_memory #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .INSTR_WIDTH(INSTR_WIDTH)
    ) u_imem (
        .address(pc_w),
        .instruction(instruction_w)
    );

    //-------------------------------------------------------
    // Instruction Decoder
    //-------------------------------------------------------
    instruction_decoder #(
        .INSTR_WIDTH(INSTR_WIDTH)
    ) u_decoder (
        .instruction(instruction_w),
        .opcode(opcode_w),
        .dest(dest_w),
        .src1(src1_w),
        .src2(src2_w)
    );

    //-------------------------------------------------------
    // Control Unit
    //-------------------------------------------------------
    control_unit u_control_unit (
        .opcode(opcode_w),
        .pc(pc_w),
        .reg_write(reg_write_w),
        .pc_write(pc_write_w),
        .halt(halt_w),
        .alu_op(alu_op_w),
        .imm_select(imm_select_w),
        .pc_next(pc_next_w)
    );

    //-------------------------------------------------------
    // Register File
    //-------------------------------------------------------
    register_file #(
        .DATA_WIDTH(DATA_WIDTH),
        .REG_COUNT(REG_COUNT)
    ) u_register_file (
        .clk(clk),
        .reset(reset),
        .write_enable(reg_write_w),
        .read_addr1(src1_w),
        .read_addr2(src2_w),
        .write_addr(dest_w),
        .write_data(alu_result_w),
        .read_data1(read_data1_w),
        .read_data2(read_data2_w)
    );

    //-------------------------------------------------------
    // Immediate mux: LOADI feeds the zero-extended src2 field
    // into the ALU's B operand instead of a register value.
    //-------------------------------------------------------
    assign alu_b_w = imm_select_w
                     ? {{(DATA_WIDTH-4){1'b0}}, src2_w}
                     : read_data2_w;

    //-------------------------------------------------------
    // ALU
    //-------------------------------------------------------
    alu #(
        .DATA_WIDTH(DATA_WIDTH)
    ) u_alu (
        .A(read_data1_w),
        .B(alu_b_w),
        .opcode(alu_op_w),
        .Result(alu_result_w),
        .Zero(alu_zero_w)
    );

    //-------------------------------------------------------
    // Debug outputs
    //-------------------------------------------------------
    assign pc_out         = pc_w;
    assign halt_out        = halt_w;
    assign alu_result_out  = alu_result_w;
    assign reg_write_out   = reg_write_w;
    assign dest_out        = dest_w;

endmodule
