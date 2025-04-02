`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/31 22:19:20
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [3:0] opcode,
    input [3:0] func,
    output reg RegWrite,
    output reg MemtoReg,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc,
    output reg Branch,
    output reg Jump,
    output reg [1:0] ALUOp
    );

    always @(*) begin
        case (opcode) 
            4'b0000: begin
                // R-type instruction - add, sub, sll, and
                RegWrite = 1;
                MemtoReg = 0;
                MemRead = 0;
                MemWrite = 0;
                ALUSrc = 0;
                Branch = 0;
                Jump = 0;
                ALUOp = func[1:0]; // ALU operation determined by func field
            end
            4'b0001: begin 
                // lw
                RegWrite = 1;
                MemtoReg = 1;
                MemRead = 1;
                MemWrite = 0;
                ALUSrc = 1; // Use immediate value for address calculation
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b00;
            end
            4'b0010: begin 
                // sw
                RegWrite = 0;
                MemtoReg = 0;
                MemRead = 0;
                MemWrite = 1;
                ALUSrc = 1; // Use immediate value for address calculation
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b00;
            end
            4'b0011: begin 
                // addi
                RegWrite = 1;
                MemtoReg = 0;
                MemRead = 0;
                MemWrite = 0;
                ALUSrc = 1; // No immediate value needed
                Branch = 0;
                Jump = 0;
                ALUOp = 2'b00; 
            end
            4'b0100: begin 
                // beq
                RegWrite = 0;
                MemtoReg = 0;
                MemRead = 0;
                MemWrite = 0;
                ALUSrc = 0; // No immediate value needed
                Branch = 1; 
                Jump = 0;
                ALUOp = 2'b01; 
            end
            4'b0101: begin 
                // blt
                RegWrite = 0;
                MemtoReg = 0;
                MemRead = 0;
                MemWrite = 0;
                ALUSrc = 0; // No immediate value needed
                Branch = 1;
                Jump = 0; 
                ALUOp = 2'b01; 
            end
            4'b0110: begin 
                // j
                RegWrite = 0;
                MemtoReg = 0;
                MemRead = 0;
                MemWrite = 0;
                ALUSrc = 0; // No immediate value needed
                Branch = 0;
                Jump = 1; 
                ALUOp = 2'b00; 
            end
            default: begin 
                // Default case - no operation
                RegWrite = 0;
                MemtoReg = 0;
                MemRead = 0;
                MemWrite = 0;
                ALUSrc = 0; 
                Branch = 0; 
                Jump = 0; 
                ALUOp = 2'b00; 
            end
        endcase
    end

endmodule
