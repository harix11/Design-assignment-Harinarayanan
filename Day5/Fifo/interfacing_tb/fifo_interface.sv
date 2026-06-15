interface fifo_ports;
    logic       clock;
    logic       reset;
    logic       write_en;
    logic       read_en;
    logic [7:0] d_in;
    logic [7:0] d_out;
    logic       fifo_full;
    logic       fifo_empty;
endinterface

module fifo_interface;
    fifo_ports inf_t();
  
    fifo dut (
        inf_t.clock,
        inf_t.reset,
        inf_t.write_en,
        inf_t.read_en,
        inf_t.d_in,
        inf_t.d_out,
        inf_t.fifo_full,
        inf_t.fifo_empty
    );
  
    always #5 inf_t.clock = ~inf_t.clock;

    initial begin
        {inf_t.clock, inf_t.reset, inf_t.write_en, inf_t.read_en, inf_t.d_in} = 0;
    end 
   
    initial begin 
        inf_t.reset = 1;
        #10;
        inf_t.reset = 0;
        #10;
        
        inf_t.write_en = 1;                 
        inf_t.d_in = 8'hAA; #10;    
        inf_t.d_in = 8'hBB; #10;      
        inf_t.d_in = 8'hCC; #10;      
        inf_t.write_en = 0;                 
        #20;

        inf_t.read_en = 1;                
        #20;                                          
        inf_t.read_en = 0;                
        #20;
        
        inf_t.write_en = 1;
        inf_t.d_in = 8'h01; #10;
        inf_t.d_in = 8'h02; #10;
        inf_t.d_in = 8'h03; #10;
        inf_t.d_in = 8'h04; #10;
        inf_t.d_in = 8'h05; #10;
        inf_t.d_in = 8'h06; #10;
        inf_t.d_in = 8'h07; #10;
        inf_t.write_en = 0;
        #20;
        
        inf_t.read_en = 1;
        #80;                               
        inf_t.read_en = 0;
        #20;
        $finish();    
    end  
endmodule
