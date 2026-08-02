`timescale 1ns/1ps

module instruction_decoder_tb;

parameter INSTR_WIDTH = 16;

// Testbench signals
reg  [INSTR_WIDTH-1:0] instruction;
wire [3:0] opcode;
wire [3:0] dest;
wire [3:0] src1;
wire [3:0] src2;

// DUT
instruction_decoder DUT (
    .instruction(instruction),
    .opcode(opcode),
    .dest(dest),
    .src1(src1),
    .src2(src2)
);

// Stimulus
initial begin

    instruction = 16'b0000_0000_0000_0000;

    #20 instruction = 16'b0001_0000_0000_0101; // LOADI R0,5
    #20 instruction = 16'b0001_0001_0000_0011; // LOADI R1,3
    #20 instruction = 16'b0011_0010_0000_0001; // ADD R2,R0,R1
    #20 instruction = 16'b1001_0000_0000_0000; // HALT

    #20 $finish;

end

// Monitor
initial begin
    $monitor("Time=%0t Instruction=%016b Opcode=%b Dest=%b Src1=%b Src2=%b",
             $time, instruction, opcode, dest, src1, src2);
end

// Waveform
initial begin
    $dumpfile("waveforms/instruction_decoder.vcd");
    $dumpvars(0, instruction_decoder_tb);
end

endmodule