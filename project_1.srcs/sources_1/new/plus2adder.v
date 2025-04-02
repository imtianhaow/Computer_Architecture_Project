`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/30 23:12:22
// Design Name: 
// Module Name: plus2adder
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


module plus2adder(
    input [15:0] a,
    output reg [15:0] sum
    );
    always @(*) begin
        sum = a + 16'd2; // add 2 to the input value
    end
endmodule
