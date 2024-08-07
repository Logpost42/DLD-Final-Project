`timescale 1ns / 1ps

module tb_b_type;

    reg [31:0] instruction;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [2:0] funct3;
    wire [12:0] imm;

    // Instantiate the B-type module
    b_type uut (
        .instruction(instruction),
        .rs1(rs1),
        .rs2(rs2),
        .funct3(funct3),
        .imm(imm)
    );

    initial begin
        // Initialize the instruction
        instruction = 32'b00000000001000001000001111000111; // Example instruction (BEQ)
        #10;

        // Display the results
        $display("Instruction: %b", instruction);
        $display("rs1: %b", rs1);
        $display("rs2: %b", rs2);
        $display("funct3: %b", funct3);
        $display("imm: %b", imm);

        // Finish the simulation
        $finish;
    end
endmodule
