
`timescale 1ns / 1ps

module fifo_tb;

    class fifo_transaction;
        rand bit       reset;
        rand bit       write_en;
        rand bit       read_en;
        rand bit [7:0] d_in;

        bit [7:0] d_out;
        bit       fifo_full;
        bit       fifo_empty;

        constraint c1 { 
            reset    dist {0 := 9, 1 := 1};
            write_en dist {0 := 3, 1 := 7};
            read_en  dist {0 := 6, 1 := 4};
            d_in     dist {8'hFF:=10, 8'hAA:=5, 8'h55:=5};                                  
        }

        function void display();
            $display("reset=%0b | wr=%0b rd=%0b | d_in=%0h | d_out=%0h | full=%0b empty=%0b",
                      reset, write_en, read_en, d_in, d_out, fifo_full, fifo_empty);
        endfunction
    endclass

    reg        clk;
    reg        rst;
    reg        w_en;
    reg        r_en;
    reg  [7:0] data_in;
    wire [7:0] data_out;
    wire       full;
    wire       empty;

    fifo dut (
        .clock(clk),
        .reset(rst),
        .write_en(w_en),
        .read_en(r_en),
        .d_in(data_in),
        .d_out(data_out),
        .fifo_full(full),
        .fifo_empty(empty)
    );

    always #5 clk = ~clk;

    initial begin
    fifo_transaction tr;
        clk = 0;
        tr = new();

        $display("--- Starting FIFO Simulation ---");

        repeat(15) begin
            @(posedge clk); 
            
            if (!tr.randomize()) begin
                $display("Randomization failed!");
            end

            rst     = tr.reset;
            w_en    = tr.write_en;
            r_en    = tr.read_en;
            data_in = tr.d_in;

            #1; 

            tr.d_out      = data_out;
            tr.fifo_full  = full;
            tr.fifo_empty = empty;

            tr.display();
        end

        $display("--- Simulation Finished ---");
        $finish;
    end

endmodule
