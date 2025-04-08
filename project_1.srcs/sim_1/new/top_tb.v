`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/02 00:34:23
// Design Name: 
// Module Name: top_tb
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


module top_tb;
    reg clk = 0;
    reg reset = 1;
    wire [15:0] leds;

    // Instantiate the processor
    top uut (
        .clk(clk),
        .rst(reset),
        .leds(leds)
    );

    // Clock generation: 10-unit period
    always #5 clk = ~clk;

    initial begin
        // Initialize simulation
        $dumpfile("top.vcd");
        $dumpvars(0, top_tb);

        // Reset the processor
        reset = 1;
        #10;
        reset = 0;
        // Display results
        repeat (16) begin
            
            print_state();
            #10;
        end

        $finish;
    end
    task print_state;
        begin   
            $display("Time: %0t", $time);
            $display("PC: %h", uut.pc);
            $display("Instruction: %h", uut.instruction);
            $display("Reg_read1: %h", uut.instruction[7:4]);
            $display("Reg_read1 or Write_reg: %h", uut.instruction[11:8]);
            $display("Read_Data1: %h", uut.read_data1);
            $display("Read_Data2: %h", uut.read_data2);
            $display("leds: %h", uut.leds);

            $display("Sign_extend: %h", uut.sign_extended_imm);
            $display("ALU b selection: %b", uut.ALUSrc);
            $display("ALU a: %h", uut.read_data1);
            $display("ALU b: %h", uut.alu_b);
            $display("ALU result: %h", uut.alu_result);
            $display("Write Data: %h", uut.write_data);

            $display("Register r0: %h", uut.regfile_inst.registers[0]);
            $display("Register r1: %h", uut.regfile_inst.registers[1]);
            $display("Register r2: %h", uut.regfile_inst.registers[2]);
            $display("Register r3: %h", uut.regfile_inst.registers[3]);

            $display("Memory[0]: %h", uut.dmem_inst.memory[0]);
            $display("Memory[1]: %h", uut.dmem_inst.memory[1]);
            $display("Memory[2]: %h", uut.dmem_inst.memory[2]);
            $display("Memory[3]: %h", uut.dmem_inst.memory[3]);
            $display("----------------------");
        end 
    endtask
endmodule
// `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/02 00:34:23
// Design Name: 
// Module Name: top_tb
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


// module top_tb;
//     reg clk = 0;
//     reg reset = 1;
//     wire [15:0] leds;  

//     // Instantiate the processor
//     top uut (
//         .clk(clk),
//         .rst(reset),
//         .leds(leds)
//     );

//     // Clock generation: 10-unit period
//     always #5 clk = ~clk;

//     initial begin
//         // Initialize simulation
//         $dumpfile("top.vcd");
//         $dumpvars(0, top_tb);

//         // Reset the processor
//         reset = 1;
//         #10;
//         reset = 0;
//         // Display results
//         repeat (16) begin
            
//             print_state();
//             #10;
//         end

//         $finish;
//     end
//     task print_state;
//         begin   
//             $display("Time: %0t", $time);
//             $display("PC: %h", uut.pc);
//             $display("Instruction: %h", uut.instruction);
//             $display("Reg_read1: %h", uut.instruction[7:4]);
//             $display("Reg_read1 or Write_reg: %h", uut.instruction[11:8]);
//             $display("Read_Data1: %h", uut.read_data1);
//             $display("Read_Data2: %h", uut.read_data2);
//             $display("leds: %h", uut.leds);

//             $display("Sign_extend: %h", uut.sign_extended_imm);
//             $display("ALU b selection: %b", uut.ALUSrc);
//             $display("ALU a: %h", uut.read_data1);
//             $display("ALU b: %h", uut.alu_b);
//             $display("ALU result: %h", uut.alu_result);
//             $display("Write Data: %h", uut.write_data);

//             $display("Register r0: %h", uut.regfile_inst.registers[0]);
//             $display("Register r1: %h", uut.regfile_inst.registers[1]);
//             $display("Register r2: %h", uut.regfile_inst.registers[2]);
//             $display("Register r3: %h", uut.regfile_inst.registers[3]);

//             $display("Memory[0]: %h", uut.dmem_inst.memory[0]);
//             $display("Memory[1]: %h", uut.dmem_inst.memory[1]);
//             $display("Memory[2]: %h", uut.dmem_inst.memory[2]);
//             $display("Memory[3]: %h", uut.dmem_inst.memory[3]);
//             $display("----------------------");
//         end 
//     endtask
// endmodule
