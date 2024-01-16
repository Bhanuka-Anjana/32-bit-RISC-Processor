//ALU implimentation
module ALU(
    // Inputs
    input [31:0] A,B,
    input [3:0] ALUControl,

    // Outputs
    output reg [31:0] ALUOut,
    output reg Zero // Zero flag
);

    always @* begin
        case(ALUControl)
            4'b0000: ALUOut <= A + B; // add
            4'b0001: ALUOut <= A - B; // sub
            4'b0010: ALUOut <= A & B; // and
            4'b0011: ALUOut <= A | B; // or
            4'b0100: ALUOut <= ~(A | B); // not
            4'b1000: ALUOut <= A < B; // slt
            default: ALUOut <= 0;
        endcase
        Zero <= (ALUOut == 0);
    end
endmodule
