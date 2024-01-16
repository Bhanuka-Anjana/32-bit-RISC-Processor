module registers (
    input [4:0] read_register_1, read_register_2, write_register, // 5-bit register address 
    input [31:0] write_data, // data to be written to the register
    input sig_reg_write, // set to 1 if register is to be written, 0 otherwise
    output reg [31:0] read_data_1, read_data_2 // data read from register
    );

    reg [31:0] registers [0:31]; // 32 registers

    always @(write_register, write_data) begin
        if (sig_reg_write) begin
            registers[write_register] <= write_data;
        end
     end

    always @(read_register_1, read_register_2) begin
        if (!sig_reg_write) begin
            read_data_1 = registers[read_register_1];
            read_data_2 = registers[read_register_2];
        end
    end
endmodule
