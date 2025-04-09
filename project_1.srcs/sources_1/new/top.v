`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/04/02 21:24:51
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    output reg [15:0] leds
    );

    // difine intermeidiate wires
    // wires for pc and instruction fetch
    wire [15:0] pc, next_pc, pc_plus_2, branch_target, jump_target, temp_next_pc;
    wire [15:0] instruction;

    //control signals
    wire RegWrite, MemtoReg, MemRead, MemWrite, ALUSrc, Branch, Jump;
    wire [1:0] ALUOp;
    
    // register File
    wire[15:0] read_data1, read_data2, write_data;

    // sign extend & shift left
    wire [15:0] sign_extended_imm, shifted_imm;

    // ALU
    wire [15:0] alu_result;
    wire zero, sign;

    // data memory
    wire [15:0] mem_data;

    // components
    // programming counter
    pc pc_unit(.clk(clk), .rst(rst), .next_pc(next_pc), .pc(pc));

    // instruction memory
    imem imem_unit(.address(pc), .instruction(instruction));

    // control unit
    control_unit control_inst(
        .opcode(instruction[15:12]),
        .func(instruction[3:0]),
        .RegWrite(RegWrite),
        .MemtoReg(MemtoReg),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .Branch(Branch),
        .Jump(Jump),
        .ALUOp(ALUOp)
    );

    // resgiter file
    regfile regfile_inst(
        .clk(clk),
        .write_enable(RegWrite),
        .read_reg1(instruction[7:4]), // rs
        .read_reg2(instruction[11:8]), // rt or rd
        .write_reg(instruction[11:8]), // rd for R-type, rt for I-type
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // sign extend
    sign_extend sign_extend_inst(.imm(instruction[3:0]), .extended(sign_extended_imm));

    // shift left 1
    sl1 shift_left_inst(.in(sign_extended_imm), .out(shifted_imm));

    // ALU
    wire [15:0] alu_b = ALUSrc ? sign_extended_imm : read_data2;

    alu alu_inst(
        .a(read_data1),
        .b(alu_b),
        .control(ALUOp),
        .result(alu_result),
        .zero(zero),
        .sign(sign)
    );

    // data memory
    dmem dmem_inst(
        .clk(clk),
        .addr(alu_result),
        .write_data(read_data2),
        .mem_read(MemRead),
        .mem_write(MemWrite),
        .read_data(mem_data)
    );

    // +2 adder & pc adder 
    plus2adder plus2adder_inst(.a(pc), .sum(pc_plus_2));
    adder adder_pc(.a(pc_plus_2), .b(shifted_imm), .sum(branch_target));
    // assign pc_plus_2 = pc + 16'd2;
    // assign branch_target = pc_plus_2 + shifted_imm;



    // jump target
    wire [15:0] sign_ext_addr = {{4{instruction[11]}}, instruction[11:0]};
    assign jump_target = pc_plus_2 + (sign_ext_addr << 1);

    // multiplexer for multiple data selection
    mux_2x1 mux_write_data(
        .in0(alu_result),
        .in1(mem_data),
        .sel(MemtoReg),
        .out(write_data)
    );
    // assign write_data = MemtoReg ? mem_data : alu_result;
    // multiplexer for next pc selection
    wire branch_taken = Branch && ((instruction[15:12] == 4'b0100 && zero) || (instruction[15:12] == 4'b0101 && ~sign && ~zero));
    // assign next_pc = Jump ? jump_target : (branch_taken ? branch_target : pc_plus_2);


    mux_2x1 mux_next_pc_1(
        .in0(pc_plus_2),
        .in1(branch_target),
        .sel(branch_taken),
        .out(temp_next_pc)
    );
    mux_2x1 mux_next_pc_2(
        .in0(temp_next_pc),
        .in1(jump_target),
        .sel(Jump),
        .out(next_pc)
    );
    
    // hardware for LED display
    reg [15:0] captured_data;
    always @(posedge clk) begin
        captured_data <= read_data2;
    end

    always @(negedge clk) begin
        leds <= read_data2;
    end


    always @(*) begin
        leds = captured_data;
    end

endmodule
