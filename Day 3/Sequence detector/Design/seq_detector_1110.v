
`timescale 1ns / 1ps

module seq_det_1110(
    input clk,
    input rst,
    input din,
    output reg det
);

parameter idle = 2'b00;
parameter s1   = 2'b01;
parameter s2   = 2'b10;
parameter s3   = 2'b11;

reg [1:0] ps, ns;


always @(posedge clk) begin
    if(rst) begin
        ps <= idle;
    end
    else begin
        ps <= ns;
    end
end


always @(*) begin
    
    det = 0;
    ns = ps; 

    case(ps)
        idle: begin
            if(din == 1) begin
                ns = s1;     // Got '1'
            end
            else begin
                ns = idle;   // Got '0'
            end
        end
        
        s1: begin
            if(din == 1) begin
                ns = s2;     // Got '11'
            end
            else begin
                ns = idle;   // Got '10' 
            end
        end
        
        s2: begin
            if(din == 1) begin
                ns = s3;     // Got '111'
            end
            else begin
                ns = idle;   // Got '110' (Broken sequence)
            end
        end
        
        s3: begin
            if(din == 0) begin
                ns = idle;   // reset to idle
                det = 1;     // 
            end
            else begin
                ns = s3;    
            end
        end
        
        default: begin
            ns = idle;
            det = 0;
        end
    endcase
end

endmodule
