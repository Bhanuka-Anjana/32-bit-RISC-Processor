//Instruction memory module for the processor
module InstructionMemo(
    // Inputs
    input CLK,
    input [31:0] ADDRESS,

    // Outputs
    output reg [31 : 0] Inst
)

    // Internal variables
    reg [31 : 0] Mem [0 : 1023];

    // Initialize memory with Fibonacci sequence program
    initial begin
        Mem[0] <= 32'h02000000;  // LOADI R0, 0
        Mem[1] <= 32'h02010001;  // LOADI R1, 1
        Mem[2] <= 32'h0402000A;  // LOADI R2, 10
        Mem[3] <= 32'h0A080005;  // LOOP: CMP R0, 0, BEQ END_PROGRAM
        Mem[4] <= 32'h01030000;  // ADD R3, R1, R0
        Mem[5] <= 32'h0A0A0003;  // MOV R1, R2
        Mem[6] <= 32'h0A0B0004;  // MOV R2, R3
        Mem[7] <= 32'h08020001;  // SUBI R2, 1
        Mem[8] <= 32'h0A0C0003;  // JMP LOOP
        Mem[9] <= 32'h0F000000;  // END_PROGRAM: HALT
    end
    
    // Read instruction from memory
    always @(posedge CLK) begin
        Inst <= Mem[ADDRESS];
    end
endmodule
