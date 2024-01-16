`timescale 1ms/1ms

module DataMemory_tb();
  reg [31:0] address, write_data;
  reg mem_write, mem_read;
  wire [31:0] read_data;

  DataMemory dut (
    .Address(address),
    .Write_Data(write_data),
    .Mem_Write(mem_write),
    .Mem_Read(mem_read),
    .Read_Data(read_data)
  );

  initial begin
    #10 address = 3; write_data = 150; mem_write = 1; mem_read = 0;
    #10 address = 3; mem_write = 0; mem_read = 1;
    #10;
  end

endmodule


