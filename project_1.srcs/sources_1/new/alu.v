`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/02 21:23:42
// Design Name: 
// Module Name: alu
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


module alu(
    input [15:0] a,
    input [15:0] b, 
    input [1:0] control,
    output reg [15:0] result,
    // zero flag - for beq
    output zero,
    // sign flag - negative - 1- for blt
    output sign
    );
    always @(*) begin
        case (control)
            2'b00: result = a + b; // add; addi, sw, lw
            2'b01: result = a - b; // sub; beq, blt
            2'b10: result = b << a; // shift left logic, sll
            2'b11: result = a & b; // and 

            default: result = 16'b0; // default case
        endcase
    end
    // zero true means a == b, so beq is true
    assign zero = (result == 16'b0);
    // result[15] is the sign bit, so if it is 1, the number is negative
    // which means a < b, so blt is true
    assign sign = result[15];

endmodule
