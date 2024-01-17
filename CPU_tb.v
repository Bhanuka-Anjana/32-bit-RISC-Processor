`timescale 1ns/1ps


module CPU_tb;

reg clk;
reg reset;

wire RegDest, Jump, Branch, Sig_Mem_Read, Sig_Mem_to_Reg,
     Sig_Mem_Write, ALUSrc, Sig_Reg_Write;
wire [2:0] ALUOp;
wire [31:0] pc_in ,pc_out,adder_out,instMem_out;

//Initiate CPU
CPU2 cpu(
    //Inputs
    .Clk(clk),
    .Rst(reset),

    //Outputs
    .Pc_in(pc_in),
    .Pc_out(pc_out),
    .Adder1_out(pc_in),
    .InstMem_out(instMem_out),
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


