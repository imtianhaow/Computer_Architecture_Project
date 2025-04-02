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
    input write_enable, // write enable signal from control unit
    output reg [15:0] read_data1, read_data2
);  
    // register array, 16 registers of 16 bits each
    reg [15:0] registers [0:15];
    // initialize registers to 0
    integer i;
    initial begin 
        for (i = 0; i < 16; i = i + 1) begin
            registers[i] = 16'b0;
        end
    end

    // read logic:
    always @(*) begin
        read_data1 = registers[read_reg1];
        read_data2 = registers[read_reg2];
    end
    // write logic: - on rising edge of clock
    always @(posedge clk) begin
        if (write_enable) begin 
            if (write_reg != 4'b0) begin
                registers[write_reg] <= write_data;
            end

        end
    end
    // maintain $0 register as 0
    always @(*) begin
        registers[0] = 16'b0; // $r0 should always be 0
    end

endmodule
