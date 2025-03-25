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
    reg [15:0] memory [0:3];

    initial begin
        // use $readmemh to read the instructions from a file
        $readmemb("instructions.mem", memory);
    end

    always @(*) begin
        // read the instruction from the memory, covert the address to word address
        instruction = memory[address >> 1];
    end 

endmodule
