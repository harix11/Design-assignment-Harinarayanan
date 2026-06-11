
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 19:58:06
// Design Name: 
// Module Name: bmg_tb
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


module bmg_tb();

    reg clk, rst, wr_en_sim;
    reg [2:0] addr_wr_tb;
    reg [2:0] addr_rd_tb;
    reg [7:0] din_sim;
    wire [7:0] dout_sim;
    
    bmg dut (clk, rst, wr_en_sim, addr_wr_tb, addr_rd_tb, din_sim, dout_sim);
    
    initial begin 
        clk = 0;
        rst = 0;
        wr_en_sim = 0;
        addr_wr_tb = 3'b000;
        addr_rd_tb = 3'b000;
        din_sim = 8'h00;
    end
    
    always #5 clk = ~clk;
    
    initial begin
        #15;
        rst = 1;
        wr_en_sim = 1;
        #10;
        
        addr_wr_tb = 3'd7;      
        din_sim = 8'h4A; 
        #20;
        
        addr_wr_tb = 3'd2;      
        din_sim =8'hF2;
        #20;
        
        addr_wr_tb = 3'd0;      
        din_sim = 8'h8C;  
        #20;
        
        wr_en_sim = 0;
        addr_rd_tb = 3'd5;   
        #10;
        
        addr_rd_tb = 3'd7;     
        #20;
        
        $finish;
    end            

endmodule
