//test bench for PC

`timescale 1ns / 1ps

module PC_tb;
    
    // Inputs
    reg clk;
    reg rst;
    reg [31:0] pc_in;

    // Outputs
    wire [31:0] pc_out;

    // instantiate the program counter module   
    PC dut (
        .Clk(clk),
        .Rst(rst),
        .Pc_in(pc_in),
        .Pc_out(pc_out)
    );

//generate clk
always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
end

initial begin
    
    // Initialize Inputs
    rst = 1;
    #10;
    rst = 0;
    pc_in = 0;
    
    // Wait 10 ns for global reset to finish
    #10;
    
    // Add stimulus here
    
    // Test case 1
    pc_in = 32'b00000000;
    #10;

    // Test case 2
    pc_in = 32'b00000001;
    #10;

    // Test case 3
    pc_in = 32'b00000010;
    #10;

    

end
endmodule




            
            


