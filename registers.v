module Registers (
    //Inputs
    input [4:0] Read_Register_1, Read_Register_2, Write_Register, // 5-bit register address 
    input [31:0] Write_Data, // data to be written to the register
    input Clk,Sig_Reg_Write, // set to 1 if register is to be written, 0 otherwise

    //Outputs
    output reg [31:0] Read_Data_1, Read_Data_2 // data read from register
    );

    reg [31:0] Registers [0:31]; // 32 array of registers

    initial begin
        Registers[0] = 32'h00000000; // R0
        Registers[1] = 32'h00000000; // R1
        Registers[2] = 32'h00000000; // R2
        Registers[31] = 32'h00000000; // R32
    end

    assign Read_Data_1 = Registers[Read_Register_1];
    assign Read_Data_2 = Registers[Read_Register_2];

    always @(posedge Clk) begin
        if (Sig_Reg_Write == 1) begin
            Registers[Write_Register] <= Write_Data;
        end
    end
endmodule