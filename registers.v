module registers (
    input [4:0] Read_Register_1, Read_Register_2, Write_Register, // 5-bit register address 
    input [31:0] Write_Data, // data to be written to the register
    input Sig_Reg_Write, // set to 1 if register is to be written, 0 otherwise
    output reg [31:0] Read_Data_1, Read_Data_2 // data read from register
    );

    reg [31:0] Registers [0:31]; // 32 registers

    always @(Write_Register, Write_Data) begin
        if (Sig_Reg_Write) begin
            Registers[Write_Register] <= Write_Data;
        end
    end

    always @(Read_Register_1, Read_Register_2) begin
        if (!Sig_Reg_Write) begin
            Read_Data_1 = Registers[Read_Register_1];
            Read_Data_2 = Registers[Read_Register_2];
        end
    end
endmodule