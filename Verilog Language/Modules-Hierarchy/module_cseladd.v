module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [31:16] sum_in1, sum_in2;
    wire cout1, cout2, cout3, cin;
    add16 inst1(a[15:0], b[15:0], 1'b0, sum[15:0], cout1);
    add16 inst2(a[31:16], b[31:16], 1'b0, sum_in1, cout2);
    add16 inst3(a[31:16], b[31:16], 1'b1, sum_in2, cout2);
    
    assign sum[31:16] = cout1 ? sum_in2 : sum_in1;

endmodule