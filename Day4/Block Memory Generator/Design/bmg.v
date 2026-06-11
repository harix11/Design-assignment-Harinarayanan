
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 19:57:46
// Design Name: 
// Module Name: bmg
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


module bmg(
    input clock, rst, wr_en,
    input [2:0] addr_write,
    input [2:0] addr_read,
    input [7:0] din,
    output reg [7:0] dout
);

    reg [7:0] memory_array [7:0];
    integer i;

    always @(posedge clock or negedge rst) begin
        if (~rst) begin 
            dout <= 8'h00;
            for (i= 0; i< 8; i = i + 1) begin 
                memory_array[i] <= 8'h00;
            end 
        end
        else begin
            if (wr_en)
                memory_array[addr_write] <= din; 
            else 
                dout <= memory_array[addr_read];
        end    
    end 
    
endmodule
