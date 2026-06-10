
`timescale 1ns / 1ps

module seq_det_1110_tb;

    reg clk;
    reg rst;
    reg din;

    wire det;

    seq_det_1110 uut (
        clk, 
        rst, 
        din, 
        det
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 1;
        din = 0;

        #20;
        rst = 0;
        
        #10 din = 1; 
        #10 din = 1; 
        #10 din = 1; 
        #10 din = 0; 
        
        #10 din = 1; 
        #10 din = 1; 
        #10 din = 0; 
        
        #10 din = 1; 
        #10 din = 1; 
        #10 din = 1; 
        #10 din = 1; 
        #10 din = 0; 
        #10 din = 0; 

        #40;
        $finish;
    end
      
    initial begin
        $monitor("Time = %0t | rst = %b | din = %b | Current State = %b | det = %b", 
                 $time, rst, din, uut.ps, det);
    end
      
endmodule
