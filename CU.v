module CU(
  input [3:0] Opcode,
  output reg RegDest, 
  Branch, 
  Sig_Mem_Read, 
  Sig_Mem_to_Reg,
  Sig_Mem_Write, 
  ALUSrc, 
  Sig_Reg_Write,

  output reg [2:0] ALUOp
);
  //reg [2:0] ALUOpMem_to_Reg;

  always @* begin
    if (Opcode == 4'b0010)  // add
    begin
      RegDest = 1'b0;
      Branch = 1'b0;
      Sig_Mem_Read = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
      Sig_Mem_Write = 1'b0;
      ALUSrc = 1'b0;
      Sig_Reg_Write = 1'b1;
      ALUOp = 3'b000;
    end
    else if (Opcode == 4'b0110)  // sub
    begin
      RegDest = 1'b0;
      Branch = 1'b0;
      Sig_Mem_Read = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
      Sig_Mem_Write = 1'b0;
      ALUSrc = 1'b0;
      Sig_Reg_Write = 1'b1;
      ALUOp = 3'b000;
    end
    else if (Opcode == 4'b0000)  // and 
    begin
      RegDest = 1'b1;
      Branch = 1'b0;
      Sig_Mem_Read = 1'b1;
      Sig_Mem_to_Reg = 1'b1;
      Sig_Mem_Write = 1'b1;
      ALUSrc = 1'b0;
      Sig_Reg_Write = 1'b1;
      ALUOp = 3'b010;
    end
    else if (Opcode == 4'b0001)  // or
    begin
      RegDest = 1'b0;
      Branch = 1'b0;
      Sig_Mem_Read = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
      Sig_Mem_Write = 1'b0;
      ALUSrc = 1'b0;
      Sig_Reg_Write = 1'b1;
      ALUOp = 3'b000;
    end
    else if (Opcode == 4'b0011)  // not
    begin
      RegDest = 1'b0;
      Branch = 1'b0;
      Sig_Mem_Read = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
      Sig_Mem_Write = 1'b0;
      ALUSrc = 1'b0;
      Sig_Reg_Write = 1'b1;
      ALUOp = 3'b000;
    end
    else if (Opcode == 4'b1000)  // ld
    begin
      RegDest = 1'b0;
      Branch = 1'b0;
      Sig_Mem_Read = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
      Sig_Mem_Write = 1'b0;
      ALUSrc = 1'b0;
      Sig_Reg_Write = 1'b1;
      ALUOp = 3'b000;
    end
    else if (Opcode == 4'b1010)  // sd
    begin
      RegDest = 1'b0;
      Branch = 1'b0;
      Sig_Mem_Read = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
      Sig_Mem_Write = 1'b0;
      ALUSrc = 1'b0;
      Sig_Reg_Write = 1'b1;
      ALUOp = 3'b000;
    end
    else if (Opcode == 4'b1110)  // bne
    begin
      RegDest = 1'b0;
      Branch = 1'b0;
      Sig_Mem_Read = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
      Sig_Mem_Write = 1'b0;
      ALUSrc = 1'b0;
      Sig_Reg_Write = 1'b1;
      ALUOp = 3'b000;
    end
    else if (Opcode == 4'b0111)  // ldi
    begin
      RegDest = 1'b0;
      Branch = 1'b0;
      Sig_Mem_Read = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
      Sig_Mem_Write = 1'b0;
      ALUSrc = 1'b0;
      Sig_Reg_Write = 1'b1;
      ALUOp = 3'b000;
    end
    else if (Opcode == 4'b1111)  // jmp
    begin
      RegDest = 1'b0;
      Branch = 1'b0;
      Sig_Mem_Read = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
      Sig_Mem_Write = 1'b0;
      ALUSrc = 1'b0;
      Sig_Reg_Write = 1'b1;
      ALUOp = 3'b000;
    end
  end
endmodule

