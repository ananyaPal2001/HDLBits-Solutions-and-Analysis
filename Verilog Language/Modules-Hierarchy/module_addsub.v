module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b_comp;
    wire cout1, cout2;
    assign b_comp = b ^ {32{sub}}; // If sub=1, b_comp = ~b; if sub=0, b_comp = b
    add16 inst1(a[15:0], b_comp[15:0], sub, sum[15:0], cout1); // a + ~b + 1 if sub=1, a + b if sub=0
    add16 inst2(a[31:16], b_comp[31:16], cout1, sum[31:16], cout2);

endmodule