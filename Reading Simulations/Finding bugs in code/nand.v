module top_module (input a, input b, input c, output out);//

    reg out_x;
    andgate inst1 ( out_x, a, b, c, 1'b1, 1'b1);
    assign out = ~out_x;

endmodule