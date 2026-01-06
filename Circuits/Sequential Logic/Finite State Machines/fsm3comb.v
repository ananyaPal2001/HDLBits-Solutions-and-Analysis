module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always @(*) begin
        case(in)
            1'b0: next_state = (state == A | state == C) ? A : C ;
            1'b1: next_state = (state == C) ? D : B;
        endcase
    end

    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state == D) ? 1'b1 : 1'b0;

endmodule