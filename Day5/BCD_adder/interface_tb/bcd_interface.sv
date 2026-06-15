
interface bcd_if;
    logic [3:0] a;
    logic [3:0] b;
    logic       cin;
    logic [3:0] s;
    logic       cout;
endinterface

module bcd_interface;
    bcd_if inf();

    bcd dut (
        inf.a,
        inf.b,
        inf.cin,
        inf.s,
        inf.cout
    );

    initial begin
        inf.a = 4'd0;
        inf.b = 4'd0;
        inf.cin = 1'b0;
        #10;

        inf.a = 4'd4;
        inf.b = 4'd5;
        inf.cin = 1'b0;
        #10;

        inf.a = 4'd7;
        inf.b = 4'd6;
        inf.cin = 1'b0;
        #10;

        inf.a = 4'd9;
        inf.b = 4'd9;
        inf.cin = 1'b1;
        #10;

        inf.a = 4'd3;
        inf.b = 4'd5;
        inf.cin = 1'b1;
        #10;
        
        $finish();
    end
endmodule
