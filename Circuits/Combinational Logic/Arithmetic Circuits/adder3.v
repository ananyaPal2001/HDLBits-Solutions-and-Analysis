module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    assign {cout[0],sum[0]} = a[0] + b[0] + cin;
    generate 
        genvar i;
        for (i = 1; i < 3; i = i + 1) begin : ripple3
            assign {cout[i],sum[i]} = a[i] + b[i] + cout[i-1];
        end
    endgenerate

endmodule