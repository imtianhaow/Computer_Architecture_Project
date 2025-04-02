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
    input clk,
    input rst, 
    input [15:0] next_pc, // next address to load into pc
    output reg [15:0] pc // store the current program counter value
);
    always @(posedge clk) begin
        if(rst) begin
            pc <= 16'b0; // reset pc to 0
        end else begin
            pc <= next_pc; // update pc to next pc value
        end
    end

endmodule
