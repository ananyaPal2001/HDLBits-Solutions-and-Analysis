module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = ena[1] & (q[7:4] == 4'd9);
    assign ena[3] = ena[2] & (q[11:8] == 4'd9);
    
    always @(posedge clk) begin
        if(reset || (q == 16'h9999)) begin
           q <= 16'h0; 
        end else begin
            q[3:0] <= ena[1] ? 4'd0 : q[3:0] + 1'd1;
            q[7:4] <= ena[2] ? 4'd0 : ena[1] ? q[7:4] + 1'd1 : q[7:4];
            q[11:8] <= ena[3] ? 4'd0 : ena[2] ? q[11:8] + 1'd1 : q[11:8];
            q[15:12] <= ena[3] ? q[15:12] + 1'd1 : q[15:12];
        end
    end

endmodule