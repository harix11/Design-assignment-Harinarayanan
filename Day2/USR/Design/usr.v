
`timescale 1ns / 1ps

/////////////////////////////////////////////////////////////////////////////////


module usr_shiftreg(
    input clk,
    input rst,
    input [1:0] sel,
    input sin,
    input [3:0] pin,
    output reg sout,
    output reg [3:0] pout
);

reg [3:0] temp;

always @(posedge clk)
begin
    if(rst)
    begin
        temp <= 4'b0000;
        pout <= 4'b0000;
        sout <= 1'b0;
    end
    else
    begin
        case(sel)

        
        2'b00:
        begin
            sout <= temp[0];
            temp <= {sin, temp[3:1]};
        end

        2'b01:
        begin
            temp <= {sin, temp[3:1]};
            pout <= temp;
        end
  
        2'b10:
        begin
            sout <= temp[0];
            temp <= {1'b0, temp[3:1]};
        end
  
        2'b11:
        begin
            temp <= pin;
            pout <= pin;
        end
      endcase
    end
end

endmodule
