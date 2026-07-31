`timescale 1ns/1ps

module uart_tx_tb;

    reg clk;
    reg reset;
    reg tx_start;
    reg [7:0] tx_data;

    wire baud_tick;
    wire tx;
    wire busy;

    //--------------------------------------------------
    // Clock Generation (10 ns period)
    //--------------------------------------------------
    always #5 clk = ~clk;

    //--------------------------------------------------
    // Baud Generator
    //--------------------------------------------------
    baud_gen #(
        .CLK_FREQ(100),
        .BAUD_RATE(10)
    ) baud_inst (
        .clk(clk),
        .reset(reset),
        .baud_tick(baud_tick)
    );

    //--------------------------------------------------
    // UART Transmitter
    //--------------------------------------------------
    uart_tx tx_inst (
        .clk(clk),
        .reset(reset),
        .baud_tick(baud_tick),

        .tx_start(tx_start),
        .tx_data(tx_data),

        .tx(tx),
        .busy(busy)
    );

    //--------------------------------------------------
    // Stimulus
    //--------------------------------------------------
    initial begin

        $dumpfile("uart_tx.vcd");
        $dumpvars(0, uart_tx_tb);

        clk      = 0;
        reset    = 1;
        tx_start = 0;
        tx_data  = 8'h00;

        #20;
        reset = 0;

        //--------------------------------------------------
        // Send 0x55
        //--------------------------------------------------
        #30;
        tx_data  = 8'h55;
        tx_start = 1;

        #10;
        tx_start = 0;

        wait(busy == 0);

        //--------------------------------------------------
        // Wait before next transmission
        //--------------------------------------------------
        #100;

        //--------------------------------------------------
        // Send 0xA3
        //--------------------------------------------------
        tx_data  = 8'hA3;
        tx_start = 1;

        #10;
        tx_start = 0;

        wait(busy == 0);

        #100;

        $finish;

    end

    //--------------------------------------------------
    // Monitor
    //--------------------------------------------------
    initial begin
        $display("----------------------------------------------");
        $display(" Time\tTX\tBusy\tBaud");
        $display("----------------------------------------------");

        $monitor("%0t\t%b\t%b\t%b",
                 $time,
                 tx,
                 busy,
                 baud_tick);
    end

endmodule