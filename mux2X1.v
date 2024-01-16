
module mux_2X1 (
    input wire select,
    input wire [31:0] a,
    input wire [31:0] b,
    output reg [31:0] q
);

    always @*
        if (select == 0)
            q = a;
        else
            q = b;

endmodule
