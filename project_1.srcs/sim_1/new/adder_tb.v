`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/30 23:17:32
// Design Name: 
// Module Name: adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder_tb;
// Signals for regular adder
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] sum;

    // Signals for +2 adder
    reg [15:0] a_1;
    wire [15:0] sum_1;

    // Instantiate the regular adder
    adder uut_adder (.a(a),.b(b),.sum(sum));

    // Instantiate the PC incrementer
    plus2adder uut_2_adder (.a(a_1),.sum(sum_1));

    // Test procedure
    initial begin
        // Test regular adder
        $display("Testing regular adder:");
        // Test 1: 0 + 0
        a = 16'h0000;
        b = 16'h0000;
        #10;
        if (sum == 16'h0000)
            $display("Test 1 passed: 0x0000 + 0x0000 = %h", sum);
        else
            $display("Test 1 failed: 0x0000 + 0x0000 = %h, expected 0x0000", sum);
        // Test 2: 1 + 1
        a = 16'h0001;
        b = 16'h0001;
        #10;
        if (sum == 16'h0002)
            $display("Test 2 passed: 0x0001 + 0x0001 = %h", sum);
        else
            $display("Test 2 failed: 0x0001 + 0x0001 = %h, expected 0x0002", sum);
        // Test 3: 0xFFFF + 1 (overflow)
        a = 16'hFFFF;
        b = 16'h0001;
        #10;
        if (sum == 16'h0000)
            $display("Test 3 passed: 0xFFFF + 0x0001 = %h", sum);
        else
            $display("Test 3 failed: 0xFFFF + 0x0001 = %h, expected 0x0000", sum);

        // Test +2 adder
        $display("\nTesting +2 adder:");

        // Test 4: PC = 0x0000
        a_1 = 16'h0000;
        #10;
        if (sum_1 == 16'h0002)
            $display("Test 4 passed: 0x0000 + 2 = %h", sum_1);
        else
            $display("Test 4 failed: 0x0000 + 2 = %h, expected 0x0002", sum_1);
        // Test 5: PC = 0x0002
        a_1 = 16'h0002;
        #10;
        if (sum_1 == 16'h0004)
            $display("Test 5 passed: 0x0002 + 2 = %h", sum_1);
        else
            $display("Test 5 failed: 0x0002 + 2 = %h, expected 0x0004", sum_1);
        // Test 6: PC = 0xFFFE (near max value)
        a_1 = 16'hFFFE;
        #10;
        if (sum_1 == 16'h0000)
            $display("Test 6 passed: 0xFFFE + 2 = %h", sum_1);
        else
            $display("Test 6 failed: 0xFFFE + 2 = %h, expected 0x0000", sum_1);

        // End simulation
        $finish;
    end

endmodule
