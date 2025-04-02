`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/30 23:56:58
// Design Name: 
// Module Name: sl1_tb
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


module sl1_tb;
// Testbench signals
    reg [15:0] in;
    wire [15:0] out;

    // Instantiate the SL1 module
    sl1 uut (.in(in),.out(out));

    // Test procedure
    initial begin
        // Test 1: Positive value (1 becomes 2)
        in = 16'h0001;  // Decimal 1
        #10;
        if (out == 16'h0002)
            $display("Test 1 passed: 0x%h << 1 = 0x%h", in, out);
        else
            $display("Test 1 failed: 0x%h << 1 = 0x%h, expected 0x0002", in, out);
        // Test 2: Large value causing overflow (32768 becomes 0)
        in = 16'h8000;  // Decimal 32768
        #10;
        if (out == 16'h0000)
            $display("Test 2 passed: 0x%h << 1 = 0x%h", in, out);
        else
            $display("Test 2 failed: 0x%h << 1 = 0x%h, expected 0x0000", in, out);
        // Test 3: Negative value (-1 becomes -2)
        in = 16'hFFFF;  // Decimal -1 in two's complement
        #10;
        if (out == 16'hFFFE)
            $display("Test 3 passed: 0x%h << 1 = 0x%h", in, out);
        else
            $display("Test 3 failed: 0x%h << 1 = 0x%h, expected 0xFFFE", in, out);
        // End simulation
        $finish;
    end
endmodule
