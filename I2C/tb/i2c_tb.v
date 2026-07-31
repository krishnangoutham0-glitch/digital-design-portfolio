`timescale 1ns / 1ps

module i2c_master_tb;

    reg clk;
    reg rst;
    reg start;

    reg [6:0] slave_addr;
    reg [7:0] data_in;

    wire busy;
    wire done;
    wire ack_error;

    wire scl;
    wire sda;

    //----------------------------------------------------
    // Slave Model
    //----------------------------------------------------

    reg slave_drive;
    reg slave_data;

    assign sda = slave_drive ? slave_data : 1'bz;

    //----------------------------------------------------
    // DUT
    //----------------------------------------------------

    i2c_master dut
    (
        .clk(clk),
        .rst(rst),
        .start(start),
        .slave_addr(slave_addr),
        .data_in(data_in),
        .busy(busy),
        .done(done),
        .ack_error(ack_error),
        .scl(scl),
        .sda(sda)
    );

    //----------------------------------------------------
    // 50 MHz Clock
    //----------------------------------------------------

    initial
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    //----------------------------------------------------
    // Generate ACK
    //----------------------------------------------------

    initial
    begin
        slave_drive = 0;
        slave_data  = 0;

        forever
        begin

            @(negedge scl);

            // wait for address
            repeat(8)
                @(negedge scl);

            // ACK
            slave_drive = 1;
            slave_data  = 0;

            @(posedge scl);

            slave_drive = 0;

            // wait for data
            repeat(8)
                @(negedge scl);

            // ACK again
            slave_drive = 1;
            slave_data  = 0;

            @(posedge scl);

            slave_drive = 0;

        end
    end

    //----------------------------------------------------
    // Stimulus
    //----------------------------------------------------

    initial
    begin

        rst = 1;
        start = 0;

        slave_addr = 7'h50;
        data_in = 8'hA5;

        #100;

        rst = 0;

        #100;

        start = 1;

        #20;

        start = 0;

        wait(done);

        #500;

        $finish;

    end

    //----------------------------------------------------
    // Monitor
    //----------------------------------------------------

    initial
    begin

        $display("-----------------------------------------------");
        $display("Time\tState\tBusy\tDone\tACK_ERR");
        $display("-----------------------------------------------");

        $monitor("%0t\t%0d\t%b\t%b\t%b",
                 $time,
                 dut.state,
                 busy,
                 done,
                 ack_error);

    end

    //----------------------------------------------------
    // Waveform
    //----------------------------------------------------

    initial
    begin

        $dumpfile("i2c_master.vcd");
        $dumpvars(0,i2c_master_tb);

    end

endmodule