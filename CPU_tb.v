`timescale 1ns/1ps


module CPU_tb;

reg clk;
reg reset;

wire RegDest,  Branch, Sig_Mem_Read, Sig_Mem_to_Reg,
     Sig_Mem_Write, ALUSrc, Sig_Reg_Write, Branch_and_ZeroFlag,
     ZeroFlag;
wire [2:0] ALUOp;
wire [31:0] pc_in ,pc_out,adder1_out,instMem_out, 
            adder_out, Register_1_out, Register_2_out, Mux_out_to_register_data,
            Adder_out_to_mux, Mux_out_to_register_alu, ALUOut, DataMemory_out;

//Initiate CPU
CPU2 cpu(
    //Inputs
    .Clk(clk),
    .Rst(reset),

    //Outputs
    .Pc_in(pc_in),
    .Pc_out(pc_out),
    .Adder1_out(adder1_out),
    .InstMem_out(instMem_out),
    .RegDest(RegDest),
    .Branch(Branch),
    .Sig_Mem_Read(Sig_Mem_Read),
    .Sig_Mem_to_Reg(Sig_Mem_to_Reg),
    .Sig_Mem_Write(Sig_Mem_Write),
    .ALUSrc(ALUSrc),
    .Sig_Reg_Write(Sig_Reg_Write),
    .ALUOp(ALUOp),
    .Adder_out_to_mux(Adder_out_to_mux),
    .Mux_out_to_register_data(Mux_out_to_register_data),
    .Register_1_out(Register_1_out),
    .Register_2_out(Register_2_out),
    .Mux_out_to_register_alu(Mux_out_to_register_alu),
    .ALUOut(ALUOut),
    .ZeroFlag(ZeroFlag),
    .DataMemory_out(DataMemory_out),
    .Branch_and_ZeroFlag(Branch_and_ZeroFlag)
);

//Generate clock signal
always begin
    #5 clk = 1;
    #5 clk = 0;
end

//Test CPU
initial begin
    reset = 1;
    #10 reset = 0;
end
endmodule


