`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/30 23:46:23
// Design Name: 
// Module Name: sl1
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


module sl1(
    input [15:0] in,
    output reg [15:0] out
    );
    always @(*) begin
        out = in << 1; // Shift left by 1 bit
    end
endmodule
