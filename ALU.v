//ALU implimentation
module ALU(
    // Inputs
    input [31:0] A,B,
    input [2:0] ALUControl,

    // Outputs
    output reg [31:0] ALUOut,
    output reg Zero // Zero flag
);

    always @* begin
        case(ALUControl)
            3'b001: ALUOut <= A - B; // sub
            3'b000: ALUOut <= A + B; // add
            3'b010: ALUOut <= A & B; // and
            3'b100: ALUOut <= A | B; // or
            3'b011: ALUOut <= ~(A | B); // not
            //3'b1000: ALUOut <= A < B; // slt
            default: ALUOut <= 0;
        endcase
        Zero <= (ALUOut == 0);
    end
endmodule
