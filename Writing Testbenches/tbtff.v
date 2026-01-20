module top_module ();
    reg clk, reset, t;
    wire q;
    
    tff inst(.clk(clk), .reset(reset), .t(t), .q(q));
    
    initial begin
       reset = 1;
       t = 0;
       #12 reset = 0;
       t = 1;
    end
    
    initial begin
       clk = 0;
       forever #5 clk = ~clk;
    end
    
endmodule