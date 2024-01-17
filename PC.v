//program counter
module PC (
    input Clk, Rst,
    input [31:0] Pc_in,
    output reg [31:0] Pc_out
    );
    
    always @(posedge Clk )
    begin
        if(Rst == 1)
            Pc_out <= 0;
        else
            Pc_out <= Pc_in + 4;
    end
    
endmodule