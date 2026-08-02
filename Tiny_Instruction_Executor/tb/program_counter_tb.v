
`timescale 1ns/1ps
module program_counter_tb;
parameter ADDR_WIDTH = 8;
reg clk;
reg reset;
reg  [ADDR_WIDTH-1:0] pc_next;
reg  pc_write;
wire [ADDR_WIDTH-1:0]  pc ;

 program_counter DUT(.clk(clk),.reset(reset), .pc_next(pc_next), .pc_write(pc_write) ,.pc(pc) );

always #5 clk = ~clk;
initial begin 
clk = 0;
reset = 1;
pc_write = 0; 
pc_next = 0;

#20 reset = 0; pc_write =1 ; pc_next = 0;
#10 pc_next = 1;
#10 pc_next = 2;
#10 pc_next = 3;
#20 pc_write = 0;
#10 pc_next = 4;
#20 reset = 1;
#20;

$finish;

end

initial begin
    $dumpfile("waveforms/program_counter.vcd");
    $dumpvars(0, program_counter_tb);
end


initial begin
    $monitor("Time=%0t  Reset=%b  PC_Write=%b  PC_Next=%0d  PC=%0d",
             $time, reset, pc_write, pc_next, pc);
end

endmodule
