module register_file #(
    parameter DATA_WIDTH = 8,
    parameter REG_COUNT  = 16
)(
    input clk,
    input reset,
    input write_enable,

    input [3:0] read_addr1,
    input [3:0] read_addr2,
    input [3:0] write_addr,

    input [DATA_WIDTH-1:0] write_data,

    output [DATA_WIDTH-1:0] read_data1,
    output [DATA_WIDTH-1:0] read_data2
);

//----------------------------------------------------
// Internal Register Array
//----------------------------------------------------

reg [DATA_WIDTH-1:0] reg_file [0:REG_COUNT-1];

// Loop variable used during reset
integer i;

//----------------------------------------------------
// Write Logic
//----------------------------------------------------

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        // Clear every register
        for (i = 0; i < REG_COUNT; i = i + 1)
            reg_file[i] <= 0;
    end

    else if (write_enable)
    begin
       
        reg_file[write_addr] <= write_data;
    end
end

//----------------------------------------------------
// Read Logic
//----------------------------------------------------

assign read_data1 = reg_file[read_addr1];

assign read_data2 = reg_file[read_addr2];

endmodule
