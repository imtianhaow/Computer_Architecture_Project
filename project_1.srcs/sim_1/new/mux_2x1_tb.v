`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/31 00:29:37
// Design Name: 
// Module Name: mux_2x1_tb
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


module mux_2x1_tb;

    reg [15:0] in0;    
    reg [15:0] in1;    
    reg sel;           
    wire [15:0] out;   

    // Instantiate the unit under test (UUT)
    mux_2x1 uut (.in0(in0),.in1(in1),.sel(sel),.out(out));

    initial begin
        // Test 1: sel = 0, in0 = 0x0000, in1 = 0xFFFF
        in0 = 16'h0000;  
        in1 = 16'hFFFF;  
        sel = 1'b0;      
        #10;             
        if (out == 16'h0000)
            $display("Test 1 passed: out = %h", out);
        else
            $display("Test 1 failed: out = %h, expected 0x0000", out);

        // Test 2: sel = 1, in0 = 0x0000, in1 = 0xFFFF
        sel = 1'b1;      // Select in1
        #10;
        if (out == 16'hFFFF)
            $display("Test 2 passed: out = %h", out);
        else
            $display("Test 2 failed: out = %h, expected 0xFFFF", out);

        // End simulation
        $display("All tests completed.");
        $finish;  
    end
endmodule
