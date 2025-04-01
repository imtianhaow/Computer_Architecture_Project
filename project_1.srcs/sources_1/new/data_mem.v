`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2025 02:55:17 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input[15:0] address,
    input write_read,
    output reg val
    );
    
    reg [15:0] memory [0:255];
    
    initial begin
        $readmemh("data.mem", memory);
    end
    
    always @(*) 
    begin
    if (write_read == 0)  //read
    begin
        val = memory[address];
    end
    else //write
    begin
        memory[address] = val;
    end
    end
endmodule
