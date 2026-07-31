`timescale 1ns/1ps

module pwm_tb;

    pwm dut();

    initial begin
        $display("PWM Testbench");
        $finish;
    end

endmodule