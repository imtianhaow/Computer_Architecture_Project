`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/14 00:05:20
// Design Name: 
// Module Name: imem
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

module imem(
    input [15:0] address,
    output reg [15:0] instruction
    );
    reg [15:0] memory [0:63];

    initial begin
        // use $readmemh to read the instructions from a file
        $readmemb("instructions.mem", memory);
    end

    always @(*) begin
        // [15:1] is used to select the word index in the memory array
        instruction = memory[address >> 1];
    end 

endmodule
