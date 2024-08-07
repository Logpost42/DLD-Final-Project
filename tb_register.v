`timescale 1ns / 1ps

module tb_riscv_utype;

    // Testbench signals
    reg [31:0] inst;          // 32-bit instruction input
    wire [19:0] imm;          // Immediate value output
    wire [4:0] rd;            // Destination register output
    wire [6:0] opcode;        // Opcode output

    // Instantiate the riscv_utype module
    riscv_utype uut (
        .inst(inst),
        .imm(imm),
        .rd(rd),
        .opcode(opcode)
    );

    // Testbench procedure
    initial begin
        
        // Test case 1: Example instruction
        inst = 32'h12345678; // Example instruction
        #10; // Wait for 10 time units
        $display("Test Case 1:");
        $display("Instruction: %h", inst);
        $display("Immediate: %h", imm);
        $display("Destination Register (rd): %d", rd);
        $display("Opcode: %h", opcode);

        // Test case 2: Example instruction
        inst = 32'habcdef12; // Another example instruction
        #10; // Wait for 10 time units
        $display("Test Case 2:");
        $display("Instruction: %h", inst);
        $display("Immediate: %h", imm);
        $display("Destination Register (rd): %d", rd);
        $display("Opcode: %h", opcode);

        // Test case 3: Edge case with zero instruction
        inst = 32'h00000000; // Zero instruction
        #10; // Wait for 10 time units
        $display("Test Case 3:");
        $display("Instruction: %h", inst);
        $display("Immediate: %h", imm);
        $display("Destination Register (rd): %d", rd);
        $display("Opcode: %h", opcode);

        // Test case 4: Edge case with maximum value instruction
        inst = 32'hffffffff; // Maximum instruction value
        #10; // Wait for 10 time units
        $display("Test Case 4:");
        $display("Instruction: %h", inst);
        $display("Immediate: %h", imm);
        $display("Destination Register (rd): %d", rd);
        $display("Opcode: %h", opcode);

        // Finish simulation
        $finish;
    end

endmodule
