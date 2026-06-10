
module machine2(
    input wire clk,
    input wire rst,
    input wire [7:0] fifo_data_out,
    input wire fifo_empty,
    output reg fifo_rdenb,
    output reg [7:0] final_out,
    output reg out_valid
);
    reg [1:0] state;

    always @(posedge clk) begin
        if (rst) begin
            state      <= 2'b00;
            fifo_rdenb <= 1'b0;
            final_out  <= 8'h00;
            out_valid  <= 1'b0;
        end else begin
            case (state)
                2'b00: begin // Cycle 1: Idle/Wait
                    out_valid  <= 1'b0;
                    fifo_rdenb <= 1'b0;
                    state      <= 2'b01;
                end
                
                2'b01: begin // Cycle 2: Request Read
                    if (!fifo_empty) begin
                        fifo_rdenb <= 1'b1; 
                    end
                    state <= 2'b10;
                end
                
                2'b10: begin // Cycle 3: Capture and Output
                    fifo_rdenb <= 1'b0;
                    // If we requested a read in the previous cycle, valid data is here now
                    if (fifo_rdenb) begin 
                        final_out <= fifo_data_out;
                        out_valid <= 1'b1;
                    end else begin
                        out_valid <= 1'b0;
                    end
                    state <= 2'b00;
                end
                
                default: state <= 2'b00;
            endcase
        end
    end
endmodule
