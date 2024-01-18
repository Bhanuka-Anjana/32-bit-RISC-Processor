
module Mux_2X1 (
    input Select,
    input wire [31:0] A, B,

    output reg [31:0] Q
);

always @(Select or A or B) begin
    if (Select == 0)
        Q <= A;
    else
        Q <= B;
    end
endmodule
