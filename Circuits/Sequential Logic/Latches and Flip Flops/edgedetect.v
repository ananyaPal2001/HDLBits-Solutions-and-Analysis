module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    
    reg [7:0] in_d;   

    always @(posedge clk) begin
        pedge <= in & ~in_d; 
        in_d  <= in;
    end

endmodule