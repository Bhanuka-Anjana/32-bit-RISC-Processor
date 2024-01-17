//Implement AND gate
module ANDGate(
    // Inputs
    input A,
    input B,

    // Outputs
    output reg Out
);
    assign Out = A & B;
endmodule