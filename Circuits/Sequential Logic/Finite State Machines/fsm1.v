module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always@(*) begin
		case (state)
			A: next_state = in ? A : B;
			B: next_state = in ? B : A;
		endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if(areset) 
            state <= B;
        else begin
            state <= next_state;
        end
    end

    // Output logic
    assign out = state;

endmodule