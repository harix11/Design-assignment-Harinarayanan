
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 18:57:56
// Design Name: 
// Module Name: rca_tb
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


module rca_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    rca_fa uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .Sum(Sum), 
        .Cout(Cout)
    );

    initial begin
        // Initialize Inputs
        A = 0; B = 0; Cin = 0;
       
        #10;
       
        A = 4'b0011; B = 4'b0100; Cin = 0; #10;
        
        A = 4'b1111; B = 4'b0001; Cin = 0; #10;
        
        A = 4'b0111; B = 4'b0111; Cin = 1; #10;
        
        A = 4'b1010; B = 4'b0101; Cin = 0; #10;

        $finish; 
    end
      
endmodule
