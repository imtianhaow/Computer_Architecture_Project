`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/31 22:33:12
// Design Name: 
// Module Name: control_unit_tb
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


module control_unit_tb;
    // Inputs
    reg [3:0] opcode;
    reg [3:0] func;
    // Outputs
    wire RegWrite;
    wire MemtoReg;
    wire MemRead;
    wire MemWrite;
    wire ALUSrc;
    wire Branch;
    wire Jump;
    wire [1:0] ALUOp;

    // Instantiate the control unit (adjust module name/port list if different)
    control_unit uut (.opcode(opcode),.func(func),.RegWrite(RegWrite),
        .MemtoReg(MemtoReg),.MemRead(MemRead),.MemWrite(MemWrite),.ALUSrc(ALUSrc),
        .Branch(Branch),.Jump(Jump),.ALUOp(ALUOp));

    // Test procedure
    initial begin
        $monitor("Time=%0t opcode=%b func=%b RegWrite=%b MemtoReg=%b MemRead=%b MemWrite=%b ALUSrc=%b Branch=%b Jump=%b ALUControl=%b",
                 $time, opcode, func, RegWrite, MemtoReg, MemRead, MemWrite, ALUSrc, Branch, Jump, ALUOp);
        // Test R-type: add
        opcode = 4'b0000; func = 4'b0000; #10;
        // Test R-type: sub
        opcode = 4'b0000; func = 4'b0001; #10;
        // Test R-type: sll
        opcode = 4'b0000; func = 4'b0010; #10;
        // Test R-type: and
        opcode = 4'b0000; func = 4'b0011; #10;
        // Test I-type: lw
        opcode = 4'b0001; func = 4'bxxxx; #10;
        // Test I-type: sw
        opcode = 4'b0010; func = 4'bxxxx; #10;
        // Test I-type: addi
        opcode = 4'b0011; func = 4'bxxxx; #10;
        // Test I-type: beq
        opcode = 4'b0100; func = 4'bxxxx; #10;
        // Test I-type: blt
        opcode = 4'b0101; func = 4'bxxxx; #10;
        // Test J-type: jmp
        opcode = 4'b0110; func = 4'bxxxx; #10;
        // Test undefined opcode
        opcode = 4'b1111; func = 4'bxxxx; #10;
        $finish;
    end
endmodule
