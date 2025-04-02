`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/30 15:16:33
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
    reg [15:0] a, b;
    reg [1:0] control;
    wire [15:0] result;
    wire zero, sign;

    alu uut (.a(a), .b(b), .control(control), .result(result), .zero(zero), .sign(sign));

    initial begin
        // Test Addition
        a = 16'h0003; b = 16'h0004; control = 2'b00; #10;
        $display("Add: %h + %h = %h", a, b, result);
        // Test Subtraction
        a = 16'h0005; b = 16'h0002; control = 2'b01; #10;
        $display("Sub: %h - %h = %h, zero=%b, sign=%b", a, b, result, zero, sign);
        // Test Shift Left
        a = 16'h0002; b = 16'h0001; control = 2'b10; #10; // 1 << 2 = 4
        $display("SLL: %h << %h = %h", b, a, result);
        // Test AND
        a = 16'h00FF; b = 16'h0F0F; control = 2'b11; #10;
        $display("AND: %h & %h = %h", a, b, result);
        // Test beq (zero flag)
        a = 16'h0005; b = 16'h0005; control = 2'b01; #10;
        $display("Sub: %h - %h = %h, zero=%b", a, b, result, zero);
        // Test blt (sign flag)
        a = 16'h0003; b = 16'h0005; control = 2'b01; #10; // 3 - 5 = -2
        $display("Sub: %h - %h = %h, sign=%b", a, b, result, sign);
    end
endmodule
