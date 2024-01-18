module Mux_2X1_tb;

    reg select;
    reg [31:0] a, b;
    wire [31:0] q;

    mux_2X1 uut (
        .Select(select),
        .A(a),
        .B(b),
        .Q(q)
    );

    initial begin
        // Test Case 1
        select = 0;
        a = 32'hA5A5A5A5;
        b = 32'h12345678;

        #10; // Wait for a few simulation cycles

        // Check the output
        if (q !== a)
            $display("Test Case 1 Failed!");

        // Test Case 2
        select = 1;
        a = 32'hA5A5A5A5;
        b = 32'h12345678;

        #10; // Wait for a few simulation cycles

        // Check the output
        if (q !== b)
            $display("Test Case 2 Failed!");

        // Add more test cases as needed

        // Finish simulation
        $stop;
    end

endmodule

