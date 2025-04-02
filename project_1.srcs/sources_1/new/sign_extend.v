`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/31 17:12:58
// Design Name: 
// Module Name: sign_extend
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


module sign_extend(
    input [3:0] imm,
    output reg [15:0] extended
    );
    always @(*) begin
        // Sign extend the 4-bit immediate to 16 bits
        extended = { {12{imm[3]}}, imm[3:0] }; 
    end
endmodule
