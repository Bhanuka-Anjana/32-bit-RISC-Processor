module CU(
  input [3:0] Opcode,
  output reg  Branch, //Branch 
              Sig_Mem_Read, //Data Memory Read Mode Selector(0->No Read, 1->Read)
              Sig_Mem_to_Reg, //Register write data source selector(0->ALUOut, 1->DataMemoryOut)
              Sig_Mem_Write, //Data Memory Write Mode Selector(0->No Write, 1->Write)
              ALUSrc, //Select the 2 nd i/p of the ALU (0->Register2, 1->SignExtendOut)
              Sig_Reg_Write, //set write data into Register file(0->Read, 1->Write)

  output reg [2:0] ALUOp
);
  
always @(Opcode) begin
    if (Opcode == 4'b0010)  // add
    begin
      Branch = 0;
      Sig_Mem_Read = 0;
      Sig_Mem_to_Reg = 0;
      Sig_Mem_Write = 0;
      ALUSrc = 0;
      Sig_Reg_Write = 1;
      ALUOp = 3'b000;
    end
    else if (Opcode == 4'b1111)  // jmp
    begin
      Branch = 1;
      Sig_Mem_Read = 0;
      Sig_Mem_to_Reg = 0;
      Sig_Mem_Write = 0;
      ALUSrc = 0;
      Sig_Reg_Write = 0;
      ALUOp = 3'b101;
    end
    else if (Opcode == 4'b1110)  // bne
    begin
      Branch = 1;
      Sig_Mem_Read = 0;
      Sig_Mem_to_Reg = 0;
      Sig_Mem_Write = 0;
      ALUSrc = 0;
      Sig_Reg_Write = 0;
      ALUOp = 3'b111;
    end
    else if (Opcode == 4'b0011)  // not
    begin
      Branch = 0;
      Sig_Mem_Read = 0;
      Sig_Mem_to_Reg = 0;
      Sig_Mem_Write = 0;
      ALUSrc = 0;
      Sig_Reg_Write = 1;
      ALUOp = 3'b011;
    end
    else if (Opcode == 4'b0001)  // or
    begin
      Branch = 0;
      Sig_Mem_Read = 0;
      Sig_Mem_to_Reg = 0;
      Sig_Mem_Write = 0;
      ALUSrc = 0;
      Sig_Reg_Write = 1;
      ALUOp = 3'b100;
    end
    else if (Opcode == 4'b0000)  // and 
    begin
      Branch = 0;
      Sig_Mem_Read = 0;
      Sig_Mem_to_Reg = 0;
      Sig_Mem_Write = 0;
      ALUSrc = 0;
      Sig_Reg_Write = 1;
      ALUOp = 3'b010;
    end
    else if (Opcode == 4'b0110)  // sub
    begin
      Branch = 0;
      Sig_Mem_Read = 0;
      Sig_Mem_to_Reg = 0;
      Sig_Mem_Write = 0;
      ALUSrc = 0;
      Sig_Reg_Write = 1;
      ALUOp = 3'b001;
    end
    else if (Opcode == 4'b1000)  // ld
    begin
      Branch = 0;
      Sig_Mem_Read = 1;
      Sig_Mem_to_Reg = 1;
      Sig_Mem_Write = 0;
      ALUSrc = 1;
      Sig_Reg_Write = 1;
      ALUOp = 3'b110;
    end
    else if (Opcode == 4'b1010)  // sd
    begin
      Branch = 0;
      Sig_Mem_Read = 0;
      Sig_Mem_to_Reg = 0;
      Sig_Mem_Write = 1;
      ALUSrc = 1;
      Sig_Reg_Write = 0;
      ALUOp = 3'b110;
    end
    else if (Opcode == 4'b0111)  // ldi
    begin
      Branch = 0;
      Sig_Mem_Read = 0;
      Sig_Mem_to_Reg = 0;
      Sig_Mem_Write = 0;
      ALUSrc = 1;
      Sig_Reg_Write = 1;
      ALUOp = 3'b110;
    end
    else begin  //default - nop
      Branch = 0;
      Sig_Mem_Read = 0;
      Sig_Mem_to_Reg = 0;
      Sig_Mem_Write = 0;
      ALUSrc = 0;
      Sig_Reg_Write = 0;
      ALUOp = 3'b000;
    end
  end
endmodule

