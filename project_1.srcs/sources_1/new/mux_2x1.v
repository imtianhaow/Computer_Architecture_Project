`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/31 00:25:57
// Design Name: 
// Module Name: mux_2x1
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


module mux_2x1(
    input [15:0] in0,
    input [15:0] in1,
    input sel, // selction signal controlled by the control unit
    output reg [15:0] out
    );
    always @(*) begin
        out = (sel) ? in1 : in0; // if sel is 1, output in1, else output in0
    end
endmodule
