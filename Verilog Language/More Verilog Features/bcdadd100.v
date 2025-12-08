module top_module( 
    input  [399:0] a, 
    input  [399:0] b,
    input  cin,
    output cout,
    output [399:0] sum
);
    
    wire [100:0] c;
    assign c[0] = cin;

    
    generate
        genvar i;
        for (i = 0; i < 100; i = i + 1) begin : BCD_ADD
            bcd_fadd u (
                .a   (a[4*i +: 4]), // 4 bit slicing
                .b   (b[4*i +: 4]),
                .cin (c[i]),
                .sum (sum[4*i +: 4]),
                .cout(c[i+1])
            );
        end
    endgenerate

    assign cout = c[100];

endmodule

