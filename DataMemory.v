module DataMemory(
  //Inputs
  input Sig_Mem_Write,Sig_Mem_Read, Clk,
  input reg [31:0] Address,Write_Data,

  //Outputs
  output reg [31:0] Read_Data
);

//Initialize Memory 
reg [31:0] MemReg[31:0];

always @(posedge Clk)
begin
  if(Sig_Mem_Read==1) begin
      Read_Data <= MemReg[Address];
  end
  else if(Sig_Mem_Write==1) begin
	    MemReg[Address] <=Write_Data;
  end
end
endmodule


