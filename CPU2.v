module CPU2(
    //Inputs
    input Clk,
    input Rst,

    //Outputs
    output wire [31:0] Pc_in ,Pc_out, Adder1_out, InstMem_out
    );

//Connections for program counter
    PC pc(
        //Inputs
        .Clk(Clk),
        .Rst(Rst),
        .Pc_in(Pc_in),

        //Outputs
        .Pc_out(Pc_out)
    );

//Connect with Pc counter adder
    Adder adder1(
        //Inputs
        .a(Pc_out),
        .b(1),

        //Outputs
        .sum(Adder1_out)
);

//connect with instruction memory
    InstructionMemo im(
        //Inputs
        .Clk(Clk),
        .Address(Pc_out),

        //Outputs
        .Inst(InstMem_out)
    );

endmodule
