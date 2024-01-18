module Adder (
    //Inputs
    input [31:0] A,
    input [31:0] B,

    //Outputs
    output reg [31:0] Sum
);

always @(A,B) begin
    Sum <= A + B;
end
endmodule

