module DataMemory(
  input reg [31:0] Address,Write_Data,
  input Mem_Write,Mem_Read,
  output reg [31:0] Read_Data
);

reg [31:0] MemReg[15:0];

always @(Address, Write_Data, Mem_Write, Mem_Read)
  begin
     if(Mem_Read==1) begin
         Read_Data <= MemReg[Address];
     end
     else if(Mem_Write==1) begin
	 MemReg[Address]<=Write_Data;
     end
     end
endmodule

