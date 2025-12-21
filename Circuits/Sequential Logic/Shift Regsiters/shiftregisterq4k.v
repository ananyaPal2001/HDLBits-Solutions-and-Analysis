module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg q01, q12, q23;
    
    always @(posedge clk) begin
        if(~resetn) begin
           q01 <= 1'b0;
           q12 <= 1'b0;
           q23 <= 1'b0;
           out <= 1'b0;
        end else begin
           q01 <= in;
           q12 <= q01;
           q23 <= q12;
           out <= q23;
        end
    end

endmodule