`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/30 21:26:05
// Design Name: 
// Module Name: imem_tb
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


module imem_tb;
    // Testbench signals
    reg [15:0] addr;       // Address input
    wire [15:0] instr;     // Instruction output

    // Instantiate the instruction memory module
    imem uut (.address(addr),.instruction(instr));

    // Test procedure
    initial begin
        // Test 1: Fetch instruction at address 0x0000 (word 0)
        addr = 16'h0000;
        #10;  
        $display("Address = %h, Instruction = %b", addr, instr);
        // Test 2: Fetch instruction at address 0x0002 (word 1)
        addr = 16'h0002;
        #10;
        $display("Address = %h, Instruction = %b", addr, instr);
        // Test 3: Fetch instruction at address 0x0004 (word 2)
        addr = 16'h0004;
        #10;
        $display("Address = %h, Instruction = %b", addr, instr);
        // End simulation
        $finish;
    end

endmodule
