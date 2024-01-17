`timescale 1ns/1ps


module CPU_tb;

reg clk;
reg reset;

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
    .InstMem_out(instMem_out)
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


