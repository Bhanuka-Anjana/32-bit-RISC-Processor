//ALU implimentation
module ALU(
    // Inputs
    input [31:0] A,B,
    input [2:0] ALUControl,

    // Outputs
    output reg [31:0] ALUOut,
    output reg Zero // Zero flag
);

    always @(A or B or ALUControl) begin
        case(ALUControl)
            3'b000: ALUOut <= A + B;    // add
            3'b001: ALUOut <= A - B;    // sub
            3'b010: ALUOut <= A & B;    // and
            3'b011: ALUOut <= ~(A | B); // not - bitwise nor
            3'b100: ALUOut <= A | B;    // or
            3'b101: ALUOut <= A ;       // select A
            3'b110: ALUOut <= B;        // select B
            3'b111: begin               // bne
                if(A == B) begin
                    ALUOut <= 1;
                end
                else begin
                    ALUOut <= 0;
                end
            end //ALUOut <= A==B ? 1 : 0; 
            default: ALUOut <= 0;
        endcase
    end
    always @(ALUOut) begin
        if(ALUOut ==0) begin
            Zero <=1;
        end
        else begin
            Zero <=0;
        end
    end
endmodule
