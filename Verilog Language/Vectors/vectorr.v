// Create a combinational always block. This creates combinational logic that computes the same result
	// as sequential code. for-loops describe circuit *behaviour*, not *structure*, so they can only be used 
	// inside procedural blocks (e.g., always block).
	// The circuit created (wires and gates) does NOT do any iteration: It only produces the same result
	// AS IF the iteration occurred. In reality, a logic synthesizer will do the iteration at compile time to
	// figure out what circuit to produce. (In contrast, a Verilog simulator will execute the loop sequentially
	// during simulation.)

module top_module( 
    input [7:0] in,
    output [7:0] out
);
    always @(*) begin
        for(integer i = 0; i < 8 ; i++)
            out[i] = in[8-i-1];
    end

endmodule


// It is also possible to do this with a generate-for loop. Generate loops look like procedural for loops,
	// but are quite different in concept, and not easy to understand. Generate loops are used to make instantiations
	// of "things" (Unlike procedural loops, it doesn't describe actions). These "things" are assign statements,
	// module instantiations, net/variable declarations, and procedural blocks (things you can create when NOT inside 
	// a procedure). Generate loops (and genvars) are evaluated entirely at compile time. You can think of generate
	// blocks as a form of preprocessing to generate more code, which is then run though the logic synthesizer.

module top_module2( 
    input [7:0] in,
    output [7:0] out
);
    generate
        genvar i;
        for(i = 0; i < 8 ; i = i + 1) begin : reverse_bits
            assign out[i] = in[8-i-1];
        end
    endgenerate
endmodule