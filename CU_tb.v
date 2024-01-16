`timescale 1ms/1ms
module CU_tb;

  reg [3:0] opcode;
  wire regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write;
  wire [2:0] aluOp;

  CU dut (
    .Opcode(opcode),
    .RegDest(regDest),
    .Jump(jump),
    .Branch(branch),
    .Sig_Mem_Read(sig_Mem_Read),
    .Sig_Mem_to_Reg(sig_Mem_to_Reg),
    .Sig_Mem_Write(sig_Mem_Write),
    .ALUSrc(aluSrc),
    .Sig_Reg_Write(sig_Reg_Write),
    .ALUOp(aluOp)
  );

  initial begin
// Test case 1: add instruction
    opcode = 4'b0010;
    #10;
    $display("Test Case 1: add - RegDest=%h, Jump=%h, Branch=%h, Sig_Mem_Read=%h, Sig_Mem_to_Reg=%h, Sig_Mem_Write=%h, ALUSrc=%h, Sig_Reg_Write=%h, ALUOp=%h",
             regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write, aluOp);

// Test case 2: sub instruction
    opcode = 4'b0110;
    #10;
    $display("Test Case 2: ld - RegDest=%h, Jump=%h, Branch=%h, Sig_Mem_Read=%h, Sig_Mem_to_Reg=%h, Sig_Mem_Write=%h, ALUSrc=%h, Sig_Reg_Write=%h, ALUOp=%h",
             regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write, aluOp);

// Test case 3: and instruction
    opcode = 4'b0000;
    #10;
    $display("Test Case 2: ld - RegDest=%h, Jump=%h, Branch=%h, Sig_Mem_Read=%h, Sig_Mem_to_Reg=%h, Sig_Mem_Write=%h, ALUSrc=%h, Sig_Reg_Write=%h, ALUOp=%h",
             regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write, aluOp);

// Test case 4: or instruction
    opcode = 4'b0001;
    #10;
    $display("Test Case 2: ld - RegDest=%h, Jump=%h, Branch=%h, Sig_Mem_Read=%h, Sig_Mem_to_Reg=%h, Sig_Mem_Write=%h, ALUSrc=%h, Sig_Reg_Write=%h, ALUOp=%h",
             regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write, aluOp);

// Test case 5: not instruction
    opcode = 4'b0011;
    #10;
    $display("Test Case 2: ld - RegDest=%h, Jump=%h, Branch=%h, Sig_Mem_Read=%h, Sig_Mem_to_Reg=%h, Sig_Mem_Write=%h, ALUSrc=%h, Sig_Reg_Write=%h, ALUOp=%h",
             regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write, aluOp);

// Test case 6: ldi instruction
    opcode = 4'b0111;
    #10;
    $display("Test Case 2: ld - RegDest=%h, Jump=%h, Branch=%h, Sig_Mem_Read=%h, Sig_Mem_to_Reg=%h, Sig_Mem_Write=%h, ALUSrc=%h, Sig_Reg_Write=%h, ALUOp=%h",
             regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write, aluOp);

// Test case 7: lw instruction
    opcode = 4'b1000;
    #10;
    $display("Test Case 2: ld - RegDest=%h, Jump=%h, Branch=%h, Sig_Mem_Read=%h, Sig_Mem_to_Reg=%h, Sig_Mem_Write=%h, ALUSrc=%h, Sig_Reg_Write=%h, ALUOp=%h",
             regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write, aluOp);

// Test case 8: sw instruction
    opcode = 4'b1010;
    #10;
    $display("Test Case 2: ld - RegDest=%h, Jump=%h, Branch=%h, Sig_Mem_Read=%h, Sig_Mem_to_Reg=%h, Sig_Mem_Write=%h, ALUSrc=%h, Sig_Reg_Write=%h, ALUOp=%h",
             regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write, aluOp);

// Test case 9: bne instruction
    opcode = 4'b1110;
    #10;
    $display("Test Case 2: ld - RegDest=%h, Jump=%h, Branch=%h, Sig_Mem_Read=%h, Sig_Mem_to_Reg=%h, Sig_Mem_Write=%h, ALUSrc=%h, Sig_Reg_Write=%h, ALUOp=%h",
             regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write, aluOp);

// Test case 10: jmp instruction
    opcode = 4'b1111;
    #10;
    $display("Test Case 2: ld - RegDest=%h, Jump=%h, Branch=%h, Sig_Mem_Read=%h, Sig_Mem_to_Reg=%h, Sig_Mem_Write=%h, ALUSrc=%h, Sig_Reg_Write=%h, ALUOp=%h",
             regDest, jump, branch, sig_Mem_Read, sig_Mem_to_Reg, sig_Mem_Write, aluSrc, sig_Reg_Write, aluOp);

  end

endmodule

