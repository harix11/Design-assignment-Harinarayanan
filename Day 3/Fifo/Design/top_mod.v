
`timescale 1ns / 1ps

module top_module(
    input wire clk,
    input wire rst,
    output wire [7:0] final_out,
    output wire out_valid
);
    wire [7:0] m1_data;
    wire       m1_wr_en;
    
    wire [7:0] fifo_to_m2_data;
    wire       fifo_full;
    wire       fifo_empty;
    wire       m2_rd_en;

    machine1 u_machine1 (
        .clk(clk),
        .rst(rst),
        .data_out(m1_data),
        .wr_en(m1_wr_en)
    );

   
    fifo u_fifo (
        .clk(clk),
        .rst(rst),
        .wrenb(m1_wr_en),
        .rdenb(m2_rd_en),
        .data_in(m1_data),
        .data_out(fifo_to_m2_data),
        .full(fifo_full),
        .empty(fifo_empty)
    );

    machine2 u_machine2 (
        .clk(clk),
        .rst(rst),
        .fifo_data_out(fifo_to_m2_data),
        .fifo_empty(fifo_empty),
        .fifo_rdenb(m2_rd_en),
        .final_out(final_out),
        .out_valid(out_valid)
    );
endmodule
