module JTypeInstruction(
    input [31:0] pc,            // Current Program Counter (PC)
    input [31:0] instruction,   // The complete 32-bit instruction
    output reg [31:0] pc_next,  // Next Program Counter value
    output reg [31:0] rd        // Destination register value (link register)
);

    reg [31:0] imm;
    reg [4:0] rd_reg;
    reg [6:0] opcode;

    always @(*) begin
        opcode = instruction[6:0];       // Extract opcode
        rd_reg = instruction[11:7];      // Extract destination register (rd)

        // Immediate calculation: sign-extended and correctly assembled
        imm = {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};

        // Default behavior: increment PC by 4 (next sequential instruction)
        pc_next = pc + 4;

        // If the opcode indicates a JAL instruction (J-type)
        if (opcode == 7'b1101111) begin
            pc_next = pc + imm;      // Update PC to the jump target address
            rd = pc + 4;             // Store return address (link register) in rd
        end else begin
            rd = 32'b0;              // If not JAL, set rd to zero
        end
    end

endmodule
