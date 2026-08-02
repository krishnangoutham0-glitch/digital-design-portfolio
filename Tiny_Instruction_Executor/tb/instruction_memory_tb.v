`timescale 1ns/1ps

module instruction_memory_tb;

parameter ADDR_WIDTH  = 8;
parameter INSTR_WIDTH = 16;

// Testbench signals
reg  [ADDR_WIDTH-1:0] address;
wire [INSTR_WIDTH-1:0] instruction;

// DUT Instantiation
instruction_memory DUT (
    .address(address),
    .instruction(instruction)
);

// Stimulus
initial begin

    // Initialize
    address = 0;

    #20 address = 0;
    #20 address = 1;
    #20 address = 2;
    #20 address = 3;

    #20 $finish;

end

// Dump waveform
initial begin
    $dumpfile("waveforms/instruction_memory.vcd");
    $dumpvars(0, instruction_memory_tb);
end

// Monitor
initial begin
    $monitor("Time=%0t  Address=%0d  Instruction=%016b",
             $time, address, instruction);
end

endmodule
