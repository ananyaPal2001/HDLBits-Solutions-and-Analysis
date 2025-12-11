module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire c0,c1,c2,c3;
    
    FA inst [3:0] (.x(x), .y(y), .cin({c2,c1,c0,1'b0}), .sum(sum[3:0]), .cout({c3,c2,c1,c0}));
    assign sum[4] = c3;

endmodule

module FA (input x, input y, input cin, output sum, output cout);
    assign {cout, sum} = x + y + cin;    
endmodule

//or simply
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
   assign sum = x + y;

endmodule