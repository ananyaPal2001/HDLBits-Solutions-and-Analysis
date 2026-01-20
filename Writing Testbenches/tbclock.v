module top_module ( );
    reg clk;
    dut inst(.clk(clk));
	initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
endmodule