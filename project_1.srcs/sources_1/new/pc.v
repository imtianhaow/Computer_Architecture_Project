`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/13 23:12:35
// Design Name: 
// Module Name: pc
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

module pc (
        input clk,  // clock signal
        input reset,    // reset signal, reset=1, pc = 0
        input pc_write, // control pc update or not
        input branch_or_not,    // branch jump or not (beq/bne)
        input jmp,  // jump or not (jmp)
        input [15:0] jump_address,  // jmp target address
        input [15:0] branch_address,    // branch target address 
        output reg [15:0] current_pc // current pc address
    );
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_pc <= 16'b0; // pc = 0 when reset
            end else if (pc_write) begin 
                if (jmp) begin
                    current_pc <= jump_address; // execute jump
                end else if (branch_or_not) begin
                    current_pc <= branch_address; // branch jump execute
                end else begin
                    current_pc <= current_pc + 16'd2; // PC+2
            end
        end
    end
endmodule
