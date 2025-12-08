module top_module( 
    input  [99:0] a, b,
    input  cin,
    output [99:0] cout,
    output [99:0] sum
);

    wire [100:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : FA
            assign {cout[i], sum[i]} = a[i] + b[i] + carry[i];
            assign carry[i+1] = cout[i];
        end
    endgenerate

endmodule