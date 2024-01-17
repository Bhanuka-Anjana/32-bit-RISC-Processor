//Assemble the all part of the cpu and test
`timescale 1ns/1ps

module CPU() ;
    //Inputs
    input Clk;
    input Rst;

//Connections for program counter
    output wire [31:0] Pc_in ,Pc_out;
    PC pc(
        //Inputs
        .Clk(Clk),
        .Rst(Rst),
        .Pc_in(Pc_in),

        //Outputs
        .Pc_out(Pc_out)
    )

//Connections for instruction memory
    output wire [31:0] Inst;
    InstructionMemo inst_mem(
        //Inputs
        .CLK(Clk),
        .ADDRESS(Pc_out),

        //Outputs
        .Inst(Inst)
    )
    
    //Connections for Control Unit
    output wire RegDest, Jump, Branch, Sig_Mem_Read, Sig_Mem_to_Reg, Sig_Mem_Write, ALUSrc, Sig_Reg_Write;
    output wire [2:0] ALUOp;

    CU cu(
        //Inputs
        .Opcode(inst[31:28]),

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
    )

    //Connections for Register File
    output wire [4:0] Read_Data_1, Read_Data_2;
    registers reg_file(
        //Inputs
        .Read_Register_1(inst[25:21]),
        .Read_Register_2(inst[20:16]),
        .Write_Register(inst[15:11]),
        .Write_Data(Write_Data),
        .Sig_Reg_Write(Sig_Reg_Write),

        //Outputs
        .Read_Data_1(Read_Data_1),
        .Read_Data_2(Read_Data_2)
    )

    //Connections for Sign Extend
    output wire [31:0] Sign_Extend;
    SignExtend sign_extend(
        //Inputs
        .Inst(inst[15:0]),

        //Outputs
        .Extend(Sign_Extend)
    )

    //Connections for Mux 2 to 1
    output wire [31:0] ALU_in_2;
    Mux2X1 mux2X1(
        //Inputs
        .a(Read_Data_2),
        .b(Sign_Extend),
        .select(ALUSrc),

        //Outputs
        .q(ALU_in_2)
    )

    //Connections for ALU
    output wire [31:0] ALUOut;
    output wire Zero;
    ALU alu(
        //Inputs
        .A(Read_Data_1),
        .B(ALU_in_2),
        .ALUControl(ALUOp),

        //Outputs
        .ALUOut(ALUOut),
        .Zero(Zero)
    )

    //Connections for Data Memory
    output wire [31:0] Read_Data
    DataMemory data_mem(
        //Inputs
        .Address(ALUOut),
        .Write_Data(Read_Data_2),
        .Sig_Mem_Write(Sig_Mem_Write),
        .Sig_Mem_Read(Sig_Mem_Read),

        //Outputs
        .Read_Data(Read_Data)
    )

    //Connections for Mux 2 to 1 for Write Data to Register from ALU or Memory
    output wire [31:0] Write_Data_To_Reg;
    Mux2X1 mux2X1_2(
        //Inputs
        .a(ALUOut),
        .b(Read_Data),
        .select(Sig_Mem_to_Reg),

        //Outputs
        .q(Write_Data_To_Reg)
    )

    //Connections for Branch 
    output wire Output_From_Branch;
    ANDGate and_gate(
        //Inputs
        .A(Zero),
        .B(Branch),

        //Outputs
        .Out(Output_From_Branch)
    )

    //Connections for Mux 2 to 1 for PC
    output wire [31:0] Output_For_Normal_Case;
    Mux2X1 mux2X1_3(
        //Inputs
        .a(Pc_out),
        .b(4),
        .select(Output_From_Branch),

        //Outputs
        .q(Output_For_Normal_Case)
    )


endmodule