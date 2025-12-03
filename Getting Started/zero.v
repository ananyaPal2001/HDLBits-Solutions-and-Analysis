#Build a circuit with no inputs and one output that outputs a constant 0 (logic low).
module always_low (
    output wire out
);
    assign out = 1'b0;
endmodule