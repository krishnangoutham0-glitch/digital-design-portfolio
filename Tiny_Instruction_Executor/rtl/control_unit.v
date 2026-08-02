module control_unit(

    input [3:0] opcode,
    input [7:0] pc,

    output reg reg_write,
    output reg pc_write,
    output reg halt,
    output reg [3:0] alu_op,
    output reg [7:0] pc_next

);

//-----------------------------------------------------
// ALU Operation Codes
//-----------------------------------------------------

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

//-----------------------------------------------------
// Instruction Opcodes
//-----------------------------------------------------

localparam OP_ADD    = 4'b0000;
localparam OP_SUB    = 4'b0001;
localparam OP_AND    = 4'b0010;
localparam OP_OR     = 4'b0011;
localparam OP_XOR    = 4'b0100;
localparam OP_NOT    = 4'b0101;
localparam OP_SHL    = 4'b0110;
localparam OP_SHR    = 4'b0111;
localparam OP_LOADI  = 4'b1000;
localparam OP_HALT   = 4'b1001;

//-----------------------------------------------------
// Control Logic
//-----------------------------------------------------

always @(*) begin

    //-------------------------------------------------
    // Default Values
    //-------------------------------------------------

    reg_write = 1'b0;
    pc_write  = 1'b0;
    halt      = 1'b0;
    alu_op    = ALU_ADD;
    pc_next   = pc;

    case(opcode)

        //-------------------------------------------------
        // ADD
        //-------------------------------------------------
        OP_ADD:
        begin
            reg_write = 1'b1;
            pc_write  = 1'b1;
            halt      = 1'b0;
            alu_op    = ALU_ADD;
            pc_next   = pc + 1;
        end

        //-------------------------------------------------
        // SUB
        //-------------------------------------------------
        OP_SUB:
        begin
            reg_write = 1'b1;
            pc_write  = 1'b1;
            alu_op    = ALU_SUB;
            pc_next   = pc + 1;
        end

        //-------------------------------------------------
        // AND
        //-------------------------------------------------
        OP_AND:
        begin
            reg_write = 1'b1;
            pc_write  = 1'b1;
            alu_op    = ALU_AND;
            pc_next   = pc + 1;
        end

        //-------------------------------------------------
        // OR
        //-------------------------------------------------
        OP_OR:
        begin
            reg_write = 1'b1;
            pc_write  = 1'b1;
            alu_op    = ALU_OR;
            pc_next   = pc + 1;
        end

        //-------------------------------------------------
        // XOR
        //-------------------------------------------------
        OP_XOR:
        begin
            reg_write = 1'b1;
            pc_write  = 1'b1;
            alu_op    = ALU_XOR;
            pc_next   = pc + 1;
        end

        //-------------------------------------------------
        // NOT
        //-------------------------------------------------
        OP_NOT:
        begin
            reg_write = 1'b1;
            pc_write  = 1'b1;
            alu_op    = ALU_NOT;
            pc_next   = pc + 1;
        end

        //-------------------------------------------------
        // Shift Left
        //-------------------------------------------------
        OP_SHL:
        begin
            reg_write = 1'b1;
            pc_write  = 1'b1;
            alu_op    = ALU_SHL;
            pc_next   = pc + 1;
        end

        //-------------------------------------------------
        // Shift Right
        //-------------------------------------------------
        OP_SHR:
        begin
            reg_write = 1'b1;
            pc_write  = 1'b1;
            alu_op    = ALU_SHR;
            pc_next   = pc + 1;
        end

        //-------------------------------------------------
        // LOADI
        //-------------------------------------------------
        OP_LOADI:
        begin
            reg_write = 1'b1;
            pc_write  = 1'b1;
            alu_op    = ALU_PASS_B;
            pc_next   = pc + 1;
        end

        //-------------------------------------------------
        // HALT
        //-------------------------------------------------
        OP_HALT:
        begin
            reg_write = 1'b0;
            pc_write  = 1'b0;
            halt      = 1'b1;
            alu_op    = ALU_ADD;
            pc_next   = pc;
        end

        //-------------------------------------------------
        // Default
        //-------------------------------------------------
        default:
        begin
            reg_write = 1'b0;
            pc_write  = 1'b0;
            halt      = 1'b0;
            alu_op    = ALU_ADD;
            pc_next   = pc;
        end

    endcase

end

endmodule