
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 23:10:43
// Design Name: 
// Module Name: bcd_adder_tb
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


module bcd_adder_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    bcd_adder uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .Sum(Sum), 
        .Cout(Cout)
    );

    initial begin
        A = 0; B = 0; Cin = 0;
        
       
        #10;
        
       
        A = 4'd4; B = 4'd3; Cin = 0; #10;
        
       
        A = 4'd8; B = 4'd1; Cin = 0; #10;
        
        
        A = 4'd7; B = 4'd5; Cin = 0; #10;
        
        
        A = 4'd9; B = 4'd9; Cin = 1; #10;
        
        A = 4'd8; B = 4'd8; Cin = 0; #10;

        $finish;
    end
      
endmodule
