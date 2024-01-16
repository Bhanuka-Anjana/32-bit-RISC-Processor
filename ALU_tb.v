//test-bench for ALU module
`timescale 1ns/1ps 

module ALU_tb;

    //Inputs
    reg [31: 0] a, b;
    reg [3: 0] alu_control;

    //Outputs
    wire [31: 0] alu_out;
    wire zero;

    //instantiate the ALU module
    ALU dut (
        .A(a), 
        .B(b), 
        .ALUControl(alu_control), 
        .ALUOut(alu_out), 
        .Zero(zero)
    );

initial begin
    // Initialize Inputs
    a = 32'b00000000;
    b = 32'b00000000;

    // Wait 10 ns for global reset to finish
    #10;

    // Test case 1 : add
    alu_control = 4'b0000;
    a = 32'b00000001;
    b = 32'b00000001;
    #10;

    // Test case 2 : sub
    alu_control = 4'b0001;
    a = 32'b00000001;
    b = 32'b00000001;
    #10;

    // Test case 3 : and
    alu_control = 4'b0010;
    a = 32'b00000001;
    b = 32'b00000001;
    #10;

    // Test case 4 : or
    alu_control = 4'b0011;
    a = 32'b00000001;
    b = 32'b00000001;
    #10;

    // Test case 5 : not
    alu_control = 4'b0100;
    a = 32'b00000001;
    b = 32'b00000001;
    #10;

    // Test case 6 : slt
    alu_control = 4'b1000;
    a = 32'b00000001;
    b = 32'b00000001;
    #10;
end
endmodule