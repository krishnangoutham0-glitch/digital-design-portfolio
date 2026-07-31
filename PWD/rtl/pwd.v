module pwm #(
    parameter WIDTH = 8
)(
    input  wire             clk,
    input  wire             rst,
    input  wire [WIDTH-1:0] duty,
    output reg              pwm_out
);

    reg [WIDTH-1:0] counter;

    // Counter
    always @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    // PWM Generation
    always @(posedge clk or posedge rst) begin
        if (rst)
            pwm_out <= 1'b0;
        else if (counter < duty)
            pwm_out <= 1'b1;
        else
            pwm_out <= 1'b0;
    end

endmodule