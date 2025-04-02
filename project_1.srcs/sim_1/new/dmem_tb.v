`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/31 19:11:30
// Design Name: 
// Module Name: dmem_tb
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


module dmem_tb;
    reg clk = 0;                
    reg [15:0] addr;            
    reg [15:0] write_data;      
    reg mem_read = 0;           
    reg mem_write = 0;          
    wire [15:0] read_data;      

    // Instantiate the data memory module
    dmem uut (.clk(clk),.addr(addr),.write_data(write_data),
        .mem_read(mem_read),.mem_write(mem_write),.read_data(read_data));

    // Clock generation: toggle every 5 time units
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Test 1: Read from address 0x0000 (expect 0x0000)
        addr = 16'h0000;
        mem_read = 1;
        #10;
        if (read_data == 16'h0000)
            $display("Test 1 passed: read_data = %h", read_data);
        else
            $display("Test 1 failed: read_data = %h, expected 0x0000", read_data);
        // Test 2: Write 0xABCD to address 0x0002 (word 1)
        addr = 16'h0002;
        write_data = 16'hABCD;
        mem_write = 1;
        #10;
        mem_write = 0;
        // Test 3: Read from address 0x0002 (expect 0xABCD)
        mem_read = 1;
        #10;
        if (read_data == 16'hABCD)
            $display("Test 3 passed: read_data = %h", read_data);
        else
            $display("Test 3 failed: read_data = %h, expected 0xABCD", read_data);

        // End simulation
        $finish;
    end
endmodule
