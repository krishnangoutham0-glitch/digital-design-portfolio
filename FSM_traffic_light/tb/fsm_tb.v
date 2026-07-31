`timescale 1ns/1ps

module fsm_tb;

    //==========================================================
    // Testbench Signals
    //==========================================================
    reg clk;
    reg reset;
    reg timer_done;

    wire red;
    wire yellow;
    wire green;

    //==========================================================
    // Instantiate DUT (Device Under Test)
    //==========================================================
    fsm dut (
        .clk(clk),
        .reset(reset),
        .timer_done(timer_done),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    //==========================================================
    // Clock Generation (10 ns Period)
    //==========================================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    //==========================================================
    // Stimulus
    //==========================================================
    initial begin

        // Initialize inputs
        reset      = 1;
        timer_done = 0;

        // Hold reset for one clock cycle
        #12;
        reset = 0;

        // -------------------------------
        // RED -> GREEN
        // -------------------------------
        #20;
        timer_done = 1;
        #10;
        timer_done = 0;

        // -------------------------------
        // GREEN -> YELLOW
        // -------------------------------
        #20;
        timer_done = 1;
        #10;
        timer_done = 0;

        // -------------------------------
        // YELLOW -> RED
        // -------------------------------
        #20;
        timer_done = 1;
        #10;
        timer_done = 0;

        // -------------------------------
        // Another complete cycle
        // -------------------------------
        #20;
        timer_done = 1;
        #10;
        timer_done = 0;

        #30;

        $finish;

    end

    //==========================================================
    // Monitor
    //==========================================================
    initial begin
        $display("Time\tReset\tTimer\tState");
        $monitor("%0t\t%b\t%b\tR=%b G=%b Y=%b",
                 $time,
                 reset,
                 timer_done,
                 red,
                 green,
                 yellow);
    end

    //==========================================================
    // Waveform Dump
    //==========================================================
    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_tb);
    end

endmodule