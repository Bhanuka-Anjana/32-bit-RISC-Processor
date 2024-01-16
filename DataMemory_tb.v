`timescale 1ms/1ms

module DataMemory_tb();
  reg [31:0] address, write_data;
  reg sig_mem_write, sig_mem_read;
  wire [31:0] read_data;

  DataMemory dut (
    .Address(address),
    .Write_Data(write_data),
    .Sig_Mem_Write(sig_mem_write),
    .Sig_Mem_Read(sig_mem_read),
    .Read_Data(read_data)
  );

  initial begin
    #10 address = 3; write_data = 150; sig_mem_write = 1; sig_mem_read = 0;
    #10 address = 3; sig_mem_write = 0; sig_mem_read = 1;
    #10;
  end

endmodule


