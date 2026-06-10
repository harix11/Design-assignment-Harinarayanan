
module fifo(
    input wire clk,
    input wire rst,
    input wire wrenb,
    input wire rdenb,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output wire full,  
    output wire empty  
);
    reg [7:0] mem [7:0];
    reg [2:0] wr_ptr;
    reg [2:0] rd_ptr;
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            for(i=0; i<8; i=i+1)
                mem[i] <= 8'b0;
            wr_ptr   <= 3'b000; 
            rd_ptr   <= 3'b000;
            data_out <= 8'b0;
        end
        else begin
            if (wrenb == 1 && full == 0) begin
                mem[wr_ptr] <= data_in;
                wr_ptr      <= wr_ptr + 3'b001;
            end
            
            if (rdenb == 1 && empty == 0) begin
                data_out <= mem[rd_ptr];
                rd_ptr   <= rd_ptr + 3'b001;
            end
        end
    end 
    
    // Moved outside the always block
    assign full  = ((wr_ptr + 3'b001) == rd_ptr) ? 1'b1 : 1'b0;
    assign empty = (wr_ptr == rd_ptr) ? 1'b1 : 1'b0;
endmodule
