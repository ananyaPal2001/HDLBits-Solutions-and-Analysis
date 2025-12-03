// 8-bit wire where b[0] is the most-significant bit. wire [0:7] b = 8'b10110011
// 6-bit wire input (negative ranges are allowed) input wire [0:-5] c;

/*
wire [2:0] a, c;   // Two vectors
assign a = 3'b101;  // a = 101
assign b = a;       // b =   1  implicitly-created wire takes a[0]
assign c = b;       // c = 001  <-- bug
my_module i1 (d,e); // d and e are implicitly one-bit wide if not declared.
This could be a bug if the port was intended to be a vector.
*/

// 256 unpacked elements, each of which is a 8-bit packed vector of reg. -> reg [7:0] mem [255:0];   
// 29 unpacked elements, each of which is a 1-bit reg. -> reg mem2 [28:0];  

// Only the lower 4 bits of w -> w[3:0]      
// The lowest bit of x -> x[1] in x[2:1]
// ...also the lowest bit of x -> x[1:1]      
// Two lowest bits of z -> z[-1:-2]    
// Illegal. Vector part-select must match the direction of the declaration. -> b[3:0]      
// The *upper* 4 bits of b. -> b[0:3]   (Direction matters here.)
// Assign upper 4 bits of b to lower 4 bits of w. w[3]=b[0], w[2]=b[1], etc. -> assign w[3:0] = b[0:3];    

`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );

    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
endmodule
