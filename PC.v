//program counter
module PC (
    //Inputs
    input Clk, Rst,
    input [31:0] Pc_in,

    //Outputs
    output reg [31:0] Pc_out
    );

//Initialize initial value of PC
initial begin
    Pc_out = 0;
end
 
always @(posedge Clk )
    begin
        if(Rst == 1)
            Pc_out <= 0;
        else
            Pc_out <= Pc_in;
    end
    
endmodule