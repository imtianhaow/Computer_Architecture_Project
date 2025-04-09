`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/31 18:56:14
// Design Name: 
// Module Name: dmem
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


module dmem(
    input clk,
    input [15:0] addr,
    input [15:0] write_data,
    // control signals
    input mem_read,
    input mem_write,
    output reg [15:0] read_data
);
    // memort array - 64 words of 16 bits each
    reg [15:0] memory [0:63]; 

    // initialize memory to 0
    integer i;
    initial begin
        for (i = 0; i < 64; i = i + 1) begin
            memory[i] = 16'b0;
        end
    end

    // read logic
    always @(*) begin
        if(mem_read) begin
            read_data = memory[addr[15:1]];
        end
        else begin
            read_data = 16'b0; // default value if not reading
        end
    end

    // write logic of falling edge
    always @(negedge clk) begin
        if(mem_write) begin
            memory[addr[15:1]] <= write_data;
        end
    end

endmodule
