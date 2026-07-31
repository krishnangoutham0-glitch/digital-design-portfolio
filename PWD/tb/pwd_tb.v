`timescale 1ns/1ps

module pwm_tb;

    parameter WIDTH = 8;

    reg clk;
    reg rst;
    reg [WIDTH-1:0] duty;
    wire pwm_out;

    pwm #(
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .duty(duty),
        .pwm_out(pwm_out)
    );

    // Clock Generation (10 ns period)
    always #5 clk = ~clk;

    initial begin
        clk  = 0;
        rst  = 1;
        duty = 0;

        #20;
        rst = 0;

        // 0%
        duty = 0;
        #3000;

        // 25%
        duty = 64;
        #3000;

        // 50%
        duty = 128;
        #3000;

        // 75%
        duty = 192;
        #3000;

        // ~100%
        duty = 255;
        #3000;

        $finish;
    end

    initial begin
        $dumpfile("pwm.vcd");
        $dumpvars(0, pwm_tb);
    end

endmodule