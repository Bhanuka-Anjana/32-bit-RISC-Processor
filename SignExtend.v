//Implimentation of the sign extend module
module SignExtend(
    // Inputs
    input [15:0] Inst,
    // Outputs
    output reg [31:0] Extended
);

always @(Inst) begin
    Extended = {16'b0000000000000000, Immediate};
end
endmodule