module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [4:0] c;
    assign c[0] = cin;
    
    bcd_fadd inst [3:0] (.a(a), .b(b), .cin(c[3:0]), .cout(c[4:1]), .sum(sum));
    
    assign cout = c[4];

endmodule