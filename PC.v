//program counter
module PC (
    input Clk,
    input Rst,
    input [31:0] Pc_in,
    output reg [31:0] Pc_out
    );
    
    always @(posedge Clk )
    begin
        if(Rst)
            Pc_out <= 0;
        else
            Pc_out <= Pc_in;
    end
    
endmodule