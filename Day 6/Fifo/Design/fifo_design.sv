
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 19:56:44
// Design Name: 
// Module Name: fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module fifo(
    input wire clock,
    input wire reset,
    input wire write_en,
    input wire read_en,
    input wire [7:0] d_in,
    output reg [7:0] d_out,
    output wire fifo_full,  
    output wire fifo_empty  
);
    reg [7:0] storage [7:0];
    reg [2:0] wptr;
    reg [2:0] rptr;
    integer idx;

    always @(posedge clock) begin
        if (reset) begin
            wptr  <= 3'b000; 
            rptr  <= 3'b000;
            d_out <= 8'b0;
            for(idx=0; idx<8; idx=idx+1)
                storage[idx] <= 8'b0;
        end
        else begin
            if (read_en == 1 && fifo_empty == 0) begin
                d_out <= storage[rptr];
                rptr  <= rptr + 3'b001;
            end

            if (write_en == 1 && fifo_full == 0) begin
                storage[wptr] <= d_in;
                wptr          <= wptr + 3'b001;
            end
        end
    end 
    
    assign fifo_empty = (wptr == rptr) ? 1'b1 : 1'b0;
    assign fifo_full  = ((wptr + 3'b001) == rptr) ? 1'b1 : 1'b0;
endmodule
