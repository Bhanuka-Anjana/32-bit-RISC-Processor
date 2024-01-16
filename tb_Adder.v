module tb_adder;

    reg [31:0] a, b;
    wire [31:0] sum;

    Adder uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Test Case
        a = 32'hA5A5A5A5;
        b = 32'h12345678;

        #10; // Wait for a few simulation cycles

        // Check the output
        if (sum !== (a + b))
            $display("Test Case Failed!");

        // Finish simulation
        $stop;
    end

endmodule

