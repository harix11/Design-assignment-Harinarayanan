
module machine1(
    input wire clk,
    input wire rst,
    output reg [7:0] data_out,
    output reg wr_en
);
    always @(posedge clk) begin
        if (rst) begin
            data_out <= 8'h00;
            wr_en    <= 1'b0;
        end else begin
            data_out <= data_out + 1'b1;
            wr_en    <= 1'b1;
        end
    end
endmodule
