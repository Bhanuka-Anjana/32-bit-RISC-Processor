module CPU2(
    //Inputs
    input Clk,
    input Rst,

    //Outputs
    output wire RegDest, Jump, Branch, Sig_Mem_Read, Sig_Mem_to_Reg,
               Sig_Mem_Write, ALUSrc, Sig_Reg_Write,
    output wire [2:0] ALUOp,
    output wire [31:0] Pc_in ,Pc_out, Adder1_out, InstMem_out, 
                Register_1_out, Register_2_out, Mux_out_to_register_data,
                Adder_out_to_mux
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

//connect with control unit
    CU cu(
        //Inputs
        .Opcode(InstMem_out[31:28]),

        //Outputs
        .RegDest(RegDest),
        .Jump(Jump),
        .Branch(Branch),
        .Sig_Mem_Read(Sig_Mem_Read),
        .Sig_Mem_to_Reg(Sig_Mem_to_Reg),
        .Sig_Mem_Write(Sig_Mem_Write),
        .ALUSrc(ALUSrc),
        .Sig_Reg_Write(Sig_Reg_Write),
        .ALUOp(ALUOp)
    );

//connect with register file
registers regs(
    //Inputs
    .Read_Register_1(InstMem_out[27:23]),
    .Read_Register_2(InstMem_out[22:18]),
    .Write_Register(InstMem_out[17:13]),
    .Write_Data(Mux_out_to_register_data),
    .Sig_Reg_Write(Sig_Reg_Write),

    //Outputs
    .Read_Data_1(Register_1_out),
    .Read_Data_2(Register_2_out)
);

//connect with jump adder
Adder adder2(
    //Inputs
    .a(Adder1_out),
    .b(InstMem_out),

    //Outputs
    .sum(Adder_out_to_mux)
);

//connect with pc input mux
mux_2X1 mux1(
    //Inputs
    .select(1),
    .a(Adder_out_to_mux),
    .b(Adder1_out),

    //Outputs
    .q(Pc_in)
);
endmodule
