`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/30 16:35:01
// Design Name: 
// Module Name: pc_tb
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


module pc_tb; 
// Testbench signals
    reg clk = 0;           
    reg reset = 0;      
    reg [15:0] next_pc = 0; // initial value 0
    wire [15:0] pc;

    // Instantiate the Program Counter module
    pc uut (.clk(clk),.rst(reset),.next_pc(next_pc),.pc(pc));

    // Clock generation: toggle every 5 time units (period = 10 units)
    always #5 clk = ~clk;
    // Test sequence
    initial begin
        // Test 0: Apply reset
        reset = 1;
        #10;                // Wait one clock cycle
        reset = 0;
        if (pc != 16'h0000) $display("Test 0 failed: pc = %h, expected 0x0000", pc);
        else $display("Test 0 passed: pc = %h", pc);
        // Test 1: Set next_pc to 0x0002
        next_pc = 16'h0002;
        #10;                // Wait one clock cycle
        if (pc != 16'h0002) $display("Test 1 failed: pc = %h, expected 0x0002", pc);
        else $display("Test 1 passed: pc = %h", pc);
        // Test 2: Set next_pc to 0x0004
        next_pc = 16'h0004;
        #10;                // Wait one clock cycle
        if (pc != 16'h0004) $display("Test 2 failed: pc = %h, expected 0x0004", pc);
        else $display("Test 2 passed: pc = %h", pc);
        // Test 3: Apply reset again
        reset = 1;
        #10;                // Wait one clock cycle
        reset = 0;
        if (pc != 16'h0000) $display("Test 3 failed: pc = %h, expected 0x0000", pc);
        else $display("Test 3 passed: pc = %h", pc);
        // Test 4: Set next_pc to 0xFFFE (near max value)
        next_pc = 16'hFFFE;
        #10;                // Wait one clock cycle
        if (pc != 16'hFFFE) $display("Test 4 failed: pc = %h, expected 0xFFFE", pc);
        else $display("Test 4 passed: pc = %h", pc);
        // End simulation
        $display("Simulation complete.");
        $finish;
    end
endmodule
