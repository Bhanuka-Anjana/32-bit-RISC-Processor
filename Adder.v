module Adder (
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] sum
);

    always @*
        sum = a + b;

endmodule

