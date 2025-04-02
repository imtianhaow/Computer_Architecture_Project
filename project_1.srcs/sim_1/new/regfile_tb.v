`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/30 22:09:38
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb;
// Testbench signals
    reg clk = 0;                   
    reg write_enable = 0;          
    reg [3:0] read_reg1 = 0;       
    reg [3:0] read_reg2 = 0;       
    reg [3:0] write_reg = 0;       
    reg [15:0] write_data = 0;     
    wire [15:0] read_data1;        
    wire [15:0] read_data2;        

    // Instantiate the register file
    regfile uut (.clk(clk),.write_enable(write_enable), .read_reg1(read_reg1),
        .read_reg2(read_reg2),.write_reg(write_reg),.write_data(write_data),
        .read_data1(read_data1),.read_data2(read_data2)
    );

    // Clock generation: toggle every 5 time units
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Test 0: Read from register 0 (should be 0)
        read_reg1 = 4'b0000;
        #10;
        if (read_data1 == 16'h0000)
            $display("Test 0 passed: read_data1 = %h", read_data1);
        else
            $display("Test 0 failed: read_data1 = %h, expected 0x0000", read_data1);

        // Test 1: Write to register 1 and read back
        write_enable = 1;
        write_reg = 4'b0001;
        write_data = 16'hABCD;
        #10;  // Wait for clock edge
        write_enable = 0;
        read_reg1 = 4'b0001;
        #10;
        if (read_data1 == 16'hABCD)
            $display("Test 1 passed: read_data1 = %h", read_data1);
        else
            $display("Test 1 failed: read_data1 = %h, expected 0xABCD", read_data1);

        // Test 2: Write to register 2 and read from register 1 and 2
        write_enable = 1;
        write_reg = 4'b0010;
        write_data = 16'h1234;
        #10;
        write_enable = 0;
        read_reg1 = 4'b0001;
        read_reg2 = 4'b0010;
        #10;
        if (read_data1 == 16'hABCD && read_data2 == 16'h1234)
            $display("Test 2 passed: read_data1 = %h, read_data2 = %h", read_data1, read_data2);
        else
            $display("Test 2 failed: read_data1 = %h, read_data2 = %h, expected 0xABCD and 0x1234", read_data1, read_data2);

        // Test 3: Attempt to write to register 0
        write_enable = 1;
        write_reg = 4'b0000;
        write_data = 16'hFFFF;
        #10;
        write_enable = 0;
        read_reg1 = 4'b0000;
        #10;
        if (read_data1 == 16'h0000)
            $display("Test 3 passed: read_data1 = %h", read_data1);
        else
            $display("Test 3 failed: read_data1 = %h, expected 0x0000", read_data1);

        // Test 4: Simultaneous read and write
        write_enable = 1;
        write_reg = 4'b0011;
        write_data = 16'h5555;
        read_reg1 = 4'b0011;  // Read from the same register being written
        #10;
        write_enable = 0;
        #10;
        $display("Test 4: read_data1 after write = %h (new value)", read_data1);

        // End simulation
        $finish;
    end
endmodule
