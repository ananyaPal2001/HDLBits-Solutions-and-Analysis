module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    reg [2:0] LEDR_next;
    
    always @(posedge KEY[0]) begin
		LEDR <= LEDR_next;
    end
    
    always @(*) begin
        case(KEY[1]) 
            1'b0: LEDR_next = {(LEDR[1] ^ LEDR[2]), LEDR[0], LEDR[2]};
            1'b1: LEDR_next = SW;
        endcase 
    end

endmodule