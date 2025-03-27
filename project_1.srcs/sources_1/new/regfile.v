`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/26 23:29:27
// Design Name: 
// Module Name: regfile
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


module regfile(
    input clk,
    input [3:0] read_reg1, read_reg2, write_reg,
    input [15:0] write_data,
    input reg_write,
    output reg [15:0] read_data1, read_data2
);
    reg [15:0] regs [0:15];
    always @(*) begin
        read_data1 = regs[read_reg1];
        read_data2 = regs[read_reg2];
    end
    always @(posedge clk) if (reg_write) regs[write_reg] <= write_data;

endmodule
