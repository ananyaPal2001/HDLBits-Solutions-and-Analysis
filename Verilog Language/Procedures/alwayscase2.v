// with case statement

module top_module_example(
    input [3:0] in,
    output reg [1:0] pos
);
    always @(*) begin
        case (in)
            4'h0: pos = 2'd0;
            4'h1: pos = 2'd0;
            4'h2: pos = 2'd1;
            4'h3: pos = 2'd1;
            4'h4: pos = 2'd2;
            4'h5: pos = 2'd2;
            4'h6: pos = 2'd2;
            4'h7: pos = 2'd2;
            4'h8: pos = 2'd3;
            4'h9: pos = 2'd3;
            4'hA: pos = 2'd3;
            4'hB: pos = 2'd3;
            4'hC: pos = 2'd3;
            4'hD: pos = 2'd3;
            4'hE: pos = 2'd3;
            4'hF: pos = 2'd3;
            default: pos = 2'd0;
        endcase
    end
endmodule

module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    
    always @(*) begin
        casez (in) //can use casex too but dangerous as x is treated as don't care too.
            4'b???1: pos = 2'd0; 
            4'b??10: pos = 2'd1; 
            4'b?100: pos = 2'd2;
            4'b1000: pos = 2'd3; 
            default: pos = 2'd0;
        endcase
    end

endmodule

// casez treats ? as a "don't care" condition. 
// In "casez", the ? character can match either a 0 or a 1, allowing for more flexible pattern matching.
// In "case", all bits must match exactly for a case item to be selected.
// In "casex", both ? and x are treated as "don't care" conditions, meaning they can match either 0 or 1.