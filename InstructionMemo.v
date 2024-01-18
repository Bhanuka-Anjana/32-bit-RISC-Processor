//Instruction memory module for the processor
module InstructionMemo(
    // Inputs
    input Clk,
    input [31:0] Address,

    // Outputs
    output reg [31 : 0] Inst
);

    // Internal variables
    reg [31 : 0] Mem [0 : 1023];

    // Initialize memory with Fibonacci sequence program
    initial begin
        Mem[0] <= 32'h7000000a; // LDI R0, 0x0001
        //Mem[2] <= 32'h80800000; // LD R1, DataMemory(0x0000)
        //Mem[3] <= 32'h20040000; // ADD R0, R1, R0
        //Mem[4] <= 32'h60040000; // SUB R0, R1, R0
        //Mem[5] <=32'hff800003;//jump[11]->mem[14]  
        //Mem[5] <= 32'h00080000; // AND R0, R2, R0
        //Mem[6] <= 32'h10080000; // OR R0, R2, R0
        //Mem[7] <= 32'h31000000; // NOT R2 - zeroes, R0 - value, R0 - result
        //Mem[0] <= 32'h7200000a; // LDI R4, 0x000a
        Mem[1] <= 32'h7100000c; // LDI R2, 0x0001
        //Mem[2] <= 32'he008000a; // BNE R4, R0, address 0x000c(12)
        Mem[2] <=32'hff80000e;//jump[11]->mem[14]  //JMP address 0x000e
        Mem[14] <= 32'ha0000000; // SD R0, DataMemory(0x0000)
        //Mem[11] <=32'h20060000; // ADD R0, R2, R0
        //Mem[12] <=32'hff80000a;//jump[13]->mem[10] //JMP address 0x000a     
    end

    
    // Read instruction from memory
    always @(posedge Clk) begin
        Inst <= Mem[Address];
    end
endmodule
