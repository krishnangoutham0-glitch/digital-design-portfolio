`timescale 1ns/1ps
module fsm(
    input  wire clk,
    input  wire reset,
    input  wire timer_done,

    output reg red,
    output reg yellow,
    output reg green
);

    //==========================================================
    // State Encoding
    //==========================================================
    localparam RED    = 2'b00;
    localparam GREEN  = 2'b01;
    localparam YELLOW = 2'b10;

    reg [1:0] current_state;
    reg [1:0] next_state;

    //==========================================================
    // State Register
    //==========================================================
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            current_state <= RED;
        else
            current_state <= next_state;
    end

    //==========================================================
    // Next-State Logic
    //==========================================================
    always @(*)
    begin
        case (current_state)

            RED:
            begin
                if (timer_done)
                    next_state = GREEN;
                else
                    next_state = RED;
            end

            GREEN:
            begin
                if (timer_done)
                    next_state = YELLOW;
                else
                    next_state = GREEN;
            end

            YELLOW:
            begin
                if (timer_done)
                    next_state = RED;
                else
                    next_state = YELLOW;
            end

            default:
                next_state = RED;

        endcase
    end

    //==========================================================
    // Output Logic (Moore FSM)
    //==========================================================
    always @(*)
    begin
        // Default Outputs
        red    = 1'b0;
        yellow = 1'b0;
        green  = 1'b0;

        case (current_state)

            RED:
                red = 1'b1;

            GREEN:
                green = 1'b1;

            YELLOW:
                yellow = 1'b1;

            default:
                red = 1'b1;

        endcase
    end

endmodule