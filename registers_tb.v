

module registers_tb;

  reg [4:0] read_register_1, read_register_2, write_register;
  reg [31:0] write_data;
  reg sig_reg_write;
  wire [31:0] read_data_1, read_data_2;

  // Instantiate the registers module
  registers dut (
    .Read_Register_1(read_register_1),
    .Read_Register_2(read_register_2),
    .Write_Register(write_register),
    .Write_Data(write_data),
    .Sig_Reg_Write(sig_reg_write),
    .Read_Data_1(read_data_1),
    .Read_Data_2(read_data_2)
  );

  // Initial block to apply stimuli
  initial begin
    // Write to register 3
    write_register = 3;
    write_data = 20;
    sig_reg_write = 1;
    #10;

    // Read from register 2 and 4
    read_register_1 = 3;
    read_register_2 = 4;
    sig_reg_write = 0;
    #10;

    // Write to register 0
    write_register = 0;
    write_data = 10;
    sig_reg_write = 1;
    #10;

    // Read from register 0 and 3
    read_register_1 = 0;
    read_register_2 = 3;
    sig_reg_write = 0;
    #10;

  end

endmodule
