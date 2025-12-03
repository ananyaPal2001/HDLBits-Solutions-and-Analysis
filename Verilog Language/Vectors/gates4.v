module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and = & in;
    assign out_or = | in;
    assign out_xor = ^ in;

endmodule

// use bitwise reduction operators like &, |, ^ to reduce vector to single bit