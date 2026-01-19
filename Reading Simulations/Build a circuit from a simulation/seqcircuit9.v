module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    always @(posedge clk) begin
        if(a)
            q <= 4'h4;
        else if(q < 4'h6)
            q <= q + 1;
        else
            q <= 4'h0;
    end

endmodule