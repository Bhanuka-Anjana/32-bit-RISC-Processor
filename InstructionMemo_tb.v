`timescale  1ns/ 1ps

module InstructionMemo_tb;
    // Inputs
    reg clk;
    reg [31:0] address;

    // Outputs
    wire [31 : 0] inst;

    // Instantiate the instrucqtion memory module
    InstructionMemo uut (
        .Clk(clk), 
        .Address(address), 
        .Inst(inst)
    );

    // Clock generator
    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end

    initial begin
        // Initialize Inputs
        address = 0;

        // Wait 10 ns for global reset to finish
        #10;

        // Add stimulus here
        address = 0;
        #10;
        address = 1;
        #10;
        address = 2;
        #10;
        address = 3;
        #10;
        address = 4;
        #10;
        address = 5;
        #10;
        address = 6;
        #10;
        address = 7;
        #10;
        address = 8;
        #10;
        address = 9;
        #10;
    end
endmodule
