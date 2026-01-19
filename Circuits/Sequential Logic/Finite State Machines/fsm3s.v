module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    
    reg [1:0] state, next_state;
    
    parameter A=0, B=1, C=2, D=3;

    // State transition logic
    always @(*) begin
        case(in)
            1'b0: next_state = (state == A | state == C) ? A : C ;
            1'b1: next_state = (state == C) ? D : B;
        endcase    
    end

    // State flip-flops with asynchronous reset
    always @(posedge clk) begin
        if(reset)
           state <= A;
        else 
           state <= next_state;
    end

    // Output logic
    assign out = (state == D) ? 1'b1 : 1'b0;

endmodule