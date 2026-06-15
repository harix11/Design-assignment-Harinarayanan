
module fa(
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule

module rca(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] s,
    output wire cout
);
    wire c1, c2, c3;

    fa fa0(a[0], b[0], cin, s[0], c1);
    fa fa1(a[1], b[1], c1, s[1], c2);
    fa fa2(a[2], b[2], c2, s[2], c3);
    fa fa3(a[3], b[3], c3, s[3], cout);
endmodule

module bcd(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] s,
    output wire cout
);
    wire [3:0] s1;
    wire co1;
    wire [3:0] corr;
    wire co2;

    rca rca1(a, b, cin, s1, co1);

    assign cout = co1 | (s1[3] & s1[2]) | (s1[3] & s1[1]);
    assign corr = {1'b0, cout, cout, 1'b0};

    rca rca2(s1, corr, 1'b0, s, co2);
endmodule
