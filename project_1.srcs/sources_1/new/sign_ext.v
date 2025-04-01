`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 06:41:34 PM
// Design Name: 
// Module Name: sign_ext
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


module sign_ext(
    input [7:0] in,
    output reg out
    );
    
    always @(in)
    begin
    if (in[7] == 1) begin
        out = in & 16'b1111111111111111;
    end else  begin
        out = in;
    end
    end
endmodule
