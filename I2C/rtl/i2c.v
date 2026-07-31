`timescale 1ns / 1ps

module i2c_master
#(
    parameter CLK_FREQ = 50000000,
    parameter I2C_FREQ = 100000
)
(
    input wire clk,
    input wire rst,

    input wire start,
    input wire [6:0] slave_addr,
    input wire [7:0] data_in,

    output reg busy,
    output reg done,
    output reg ack_error,

    output reg scl,

    inout wire sda
);

    //---------------------------------------------------------
    // Clock Divider
    //---------------------------------------------------------

    localparam DIVIDER = CLK_FREQ / (I2C_FREQ * 2);

    reg [15:0] clk_count;

    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            clk_count <= 0;
            scl <= 1;
        end
        else if(busy)
        begin
            if(clk_count == DIVIDER-1)
            begin
                clk_count <= 0;
                scl <= ~scl;
            end
            else
                clk_count <= clk_count + 1;
        end
        else
        begin
            clk_count <= 0;
            scl <= 1;
        end
    end

    //---------------------------------------------------------
    // SDA Tri-state
    //---------------------------------------------------------

    reg sda_out;
    reg sda_oe;

    assign sda = (sda_oe) ? sda_out : 1'bz;

    wire sda_in;

    assign sda_in = sda;

    //---------------------------------------------------------
    // Shift Register
    //---------------------------------------------------------

    reg [7:0] shift_reg;

    //---------------------------------------------------------
    // Bit Counter
    //---------------------------------------------------------

    reg [3:0] bit_count;

    //---------------------------------------------------------
    // FSM States
    //---------------------------------------------------------

    localparam IDLE         = 4'd0;
    localparam START_STATE  = 4'd1;
    localparam LOAD_ADDR    = 4'd2;
    localparam SEND_ADDR    = 4'd3;
    localparam ADDR_ACK     = 4'd4;
    localparam LOAD_DATA    = 4'd5;
    localparam SEND_DATA    = 4'd6;
    localparam DATA_ACK     = 4'd7;
    localparam STOP_STATE   = 4'd8;
    localparam DONE_STATE   = 4'd9;

    reg [3:0] state;
//---------------------------------------------------------
// Main FSM
//---------------------------------------------------------

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        state       <= IDLE;
        busy        <= 0;
        done        <= 0;
        ack_error   <= 0;

        sda_out     <= 1;
        sda_oe      <= 1;

        shift_reg   <= 8'd0;
        bit_count   <= 0;
    end
    else
    begin

        case(state)

        //-------------------------------------------------
        // IDLE
        //-------------------------------------------------

        IDLE:
        begin
            done <= 0;
            ack_error <= 0;

            sda_out <= 1;
            sda_oe  <= 1;

            busy <= 0;

            if(start)
            begin
                busy <= 1;
                state <= START_STATE;
            end
        end

        //-------------------------------------------------
        // START
        //-------------------------------------------------

        START_STATE:
        begin
            // SDA goes LOW while SCL is HIGH

            sda_out <= 0;
            sda_oe  <= 1;

            state <= LOAD_ADDR;
        end

        //-------------------------------------------------
        // LOAD ADDRESS
        //-------------------------------------------------

        LOAD_ADDR:
        begin
            shift_reg <= {slave_addr,1'b0};   // Write

            bit_count <= 7;

            state <= SEND_ADDR;
        end

        //-------------------------------------------------
        // SEND ADDRESS
        //-------------------------------------------------

        SEND_ADDR:
        begin

            if(scl==0)
            begin

                sda_out <= shift_reg[7];

                shift_reg <= {shift_reg[6:0],1'b0};

                if(bit_count==0)
                    state <= ADDR_ACK;
                else
                    bit_count <= bit_count-1;

            end

        end

        //-------------------------------------------------
        // ADDRESS ACK
        //-------------------------------------------------

        ADDR_ACK:
        begin

            sda_oe <= 0;

            if(scl==1)
            begin

                if(sda_in==1)
                    ack_error <= 1;

                state <= LOAD_DATA;

            end

        end

        //-------------------------------------------------
        // LOAD DATA
        //-------------------------------------------------

        LOAD_DATA:
        begin

            sda_oe <= 1;

            shift_reg <= data_in;

            bit_count <= 7;

            state <= SEND_DATA;

        end

        //-------------------------------------------------
        // SEND DATA
        //-------------------------------------------------

        SEND_DATA:
        begin

            if(scl==0)
            begin

                sda_out <= shift_reg[7];

                shift_reg <= {shift_reg[6:0],1'b0};

                if(bit_count==0)
                    state <= DATA_ACK;
                else
                    bit_count <= bit_count-1;

            end

        end

        //-------------------------------------------------
        // DATA ACK
        //-------------------------------------------------

        DATA_ACK:
        begin

            sda_oe <= 0;

            if(scl==1)
            begin

                if(sda_in==1)
                    ack_error <= 1;

                state <= STOP_STATE;

            end

        end

        //-------------------------------------------------
        // STOP
        //-------------------------------------------------

        STOP_STATE:
        begin

            sda_oe <= 1;

            sda_out <= 0;

            if(scl==1)
            begin
                sda_out <= 1;
                state <= DONE_STATE;
            end

        end

        //-------------------------------------------------
        // DONE
        //-------------------------------------------------

        DONE_STATE:
        begin

            busy <= 0;
            done <= 1;

            state <= IDLE;

        end

        default:
            state <= IDLE;

        endcase

    end

end

endmodule