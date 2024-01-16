module CU(
  input [3:0] Opcode,
  output reg RegDest, Jump, Branch, Sig_Mem_Read, Sig_Mem_to_Reg, Sig_Mem_Write, ALUSrc, Sig_Reg_Write,
  output reg [2:0] ALUOp
);
  reg [2:0] ALUOpMem_to_Reg;

  always @* begin
    if (Opcode == 4'b0010)  // add
    begin
      ALUOp = 3'b000;
      Sig_Reg_Write = 1'b1;
      RegDest = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
    end
    else if (Opcode == 4'b0110)  // sub
    begin
      ALUOp = 3'b001;
      Sig_Reg_Write = 1'b1;
      RegDest = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
    end
    else if (Opcode == 4'b0000)  // and 
    begin
      ALUOp = 3'b010;
      Sig_Reg_Write = 1'b1;
      RegDest = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
    end
    else if (Opcode == 4'b0001)  // or
    begin
      ALUOp = 3'b100;
      Sig_Reg_Write = 1'b1;
      RegDest = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
    end
    else if (Opcode == 4'b0011)  // not
    begin
      ALUOp = 3'b011;
      Sig_Reg_Write = 1'b1;
      RegDest = 1'b0;
      Sig_Mem_to_Reg = 1'b0;
    end
    else if (Opcode == 4'b1000)  // ld
    begin
      ALUOp = 3'b000;
      Sig_Mem_Read = 1'b1; // Fix the typo here
      Sig_Reg_Write = 1'b1;
      RegDest = 1'b1;
      Sig_Mem_to_Reg = 1'b1;
    end
    else if (Opcode == 4'b1010)  // sd
    begin
      ALUOp = 3'b000;
      Sig_Mem_Write = 1'b1;
      RegDest = 1'b1;
      Sig_Mem_to_Reg = 1'b0;
    end
    else if (Opcode == 4'b1110)  // bne
    begin
      ALUOp = 3'b001;
      Branch = 1'b1;
      RegDest = 1'b1;
    end
    else if (Opcode == 4'b0111)  // ldi
    begin
      ALUOp = 3'b001; 
      Sig_Reg_Write = 1'b1; 
      RegDest = 1'b1;
    end
    else if (Opcode == 4'b1111)  // jmp
    begin
      ALUOp = 3'b000;
      Jump = 1'b1;
      RegDest = 1'b1;
    end
  end
endmodule

