`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/31 18:24:34
// Design Name: 
// Module Name: sign_extend_tb
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


module sign_extend_tb;
    reg [3:0] imm;          
    wire [15:0] extended;   

    // Instantiate the sign_extend module
    sign_extend uut (.imm(imm),.extended(extended));

    initial begin
        // Test 1: imm = 0111 (7)
        imm = 4'b0111;
        #10;
        if (extended == 16'h0007)
            $display("Test 1 passed: imm = %b, extended = %h", imm, extended);
        else
            $display("Test 1 failed: imm = %b, extended = %h, expected 0007", imm, extended);
        // Test 2: imm = 1000 (-8)
        imm = 4'b1000;
        #10;
        if (extended == 16'hFFF8)
            $display("Test 2 passed: imm = %b, extended = %h", imm, extended);
        else
            $display("Test 2 failed: imm = %b, extended = %h, expected FFF8", imm, extended);

        $finish; // End simulation
    end
endmodule
