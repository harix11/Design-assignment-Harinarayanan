
`timescale 1ns/1ps

module top_tb;
    reg clk;
    reg rst;
    wire [7:0] final_out;
    wire out_valid;

    top_module uut (
        .clk(clk),
        .rst(rst),
        .final_out(final_out),
        .out_valid(out_valid)
    );

    // 10ns clock period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        #20;
        rst = 0;

        // Run long enough to see the FIFO fill up and output several times
        #250; 
        
        $display("Simulation Finished.");
        $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | Valid_Out=%b | Final_Data=%d", 
                 $time, rst, out_valid, final_out);
    end
endmodule
