
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 23:10:19
// Design Name: 
// Module Name: bcd_adder
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


module bcd_adder (
    input [3:0] A,      
    input [3:0] B,      
    input Cin,          
    output [3:0] Sum,   
    output Cout         
);

    
    wire [3:0] Z;      
    wire K;             
    wire ignore_cout;   

    rca_fa rca1 (A, B, Cin, Z, K);
    
    assign Cout = K | (Z[3] & Z[2]) | (Z[3] & Z[1]);

  
  rca_fa rca2 (Z, {1'b0, Cout, Cout, 1'b0}, 1'b0, Sum, ignore_cout);

endmodule
