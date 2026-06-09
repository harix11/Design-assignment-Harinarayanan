
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 11:57:19
// Design Name: 
// Module Name: full_adder
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


module full_adder(input a,b,c,output s,cout);
wire w1,w2,w3,w4;
xor(w1,a,b);
xor(s,w1,c);
and(w2,b,c);
and(w3,b,a);
and(w4,a,c);
or(cout,w2,w3,w4);
endmodule
