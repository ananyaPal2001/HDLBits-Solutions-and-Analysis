module top_module (
    input a, b, c, d, e,
    output [24:0] out );

    wire [4:0] abcde; // DECLARE IT AS A WIRE "PACK" [n-1:0]
    assign abcde = {a,b,c,d,e};
    assign out = {{5{a}},{5{b}}, {5{c}}, {5{d}}, {5{e}}} ~^ {5{abcde}};

endmodule