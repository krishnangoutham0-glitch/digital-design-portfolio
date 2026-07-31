module uart_tx(
    input  wire       clk,
    input  wire       reset,
    input  wire       baud_tick,

    input  wire       tx_start,
    input  wire [7:0] tx_data,

    output reg        tx,
    output reg        busy
);

    // FSM States
    localparam IDLE  = 2'b00;
    localparam START = 2'b01;
    localparam DATA  = 2'b10;
    localparam STOP  = 2'b11;

    reg [1:0] state;
    reg [7:0] shift_reg;
    reg [2:0] bit_count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state     <= IDLE;
            tx        <= 1'b1;
            busy      <= 1'b0;
            shift_reg <= 8'd0;
            bit_count <= 3'd0;
        end
        else begin
            case(state)

            //----------------------------------------
            // IDLE
            //----------------------------------------
            IDLE: begin
                tx   <= 1'b1;
                busy <= 1'b0;

                if(tx_start) begin
                    busy      <= 1'b1;
                    shift_reg <= tx_data;
                    bit_count <= 3'd0;
                    state     <= START;
                end
            end

            //----------------------------------------
            // START BIT
            //----------------------------------------
            START: begin
                if(baud_tick) begin
                    tx    <= 1'b0;      // Start bit
                    state <= DATA;
                end
            end

            //----------------------------------------
            // DATA BITS
            //----------------------------------------
            DATA: begin
                if(baud_tick) begin

                    tx <= shift_reg[0];

                    shift_reg <= shift_reg >> 1;

                    if(bit_count == 3'd7)
                        state <= STOP;

                    bit_count <= bit_count + 1'b1;

                end
            end

            //----------------------------------------
            // STOP BIT
            //----------------------------------------
            STOP: begin
                if(baud_tick) begin
                    tx   <= 1'b1;      // Stop bit
                    busy <= 1'b0;
                    state <= IDLE;
                end
            end

            default:
                state <= IDLE;

            endcase
        end
    end

endmodule