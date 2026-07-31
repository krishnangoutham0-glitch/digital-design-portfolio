`timescale 1ns/1ps

module baud_gen_tb;

    reg clk;
    reg reset;
    wire baud_tick;

    // Small values for quick simulation
    baud_gen #(
        .CLK_FREQ(100),
        .BAUD_RATE(10)
    ) dut (
        .clk(clk),
        .reset(reset),
        .baud_tick(baud_tick)
    );

    // 10 ns clock period
    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;

        #20;
        reset = 0;

        // Run long enough to observe several baud ticks
        #300;

        $finish;
    end

    // Print whenever a baud tick occurs
    always @(posedge clk) begin
        if (baud_tick)
            $display("[%0t ns] Baud Tick!", $time);
    end

endmodule