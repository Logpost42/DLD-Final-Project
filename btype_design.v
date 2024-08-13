module BTypeInstruction(
    input [31:0] rs1,         // First register value (rs1)
    input [31:0] rs2,         // Second register value (rs2)
    input [31:0] pc,          // Current Program Counter (PC)
    output reg [31:0] pc_next, // Next Program Counter value
    input [31:0] instruction  // The complete 32-bit instruction
);

    reg [6:0] opcode;
    reg [2:0] funct3;
    reg [31:0] imm;
    
    always @(*) begin
        opcode = instruction[6:0];
        funct3 = instruction[14:12];
        
        // Immediate calculation: concatenating and sign-extending the immediate fields
        imm = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};

        // Default to the next sequential instruction (no branch)
        pc_next = pc + 4;

        // If the opcode indicates a B-type instruction
        if (opcode == 7'b1100011) begin
            case (funct3)
                3'b000: // BEQ (Branch if Equal)
                    if (rs1 == rs2)
                        pc_next = pc + imm;
                3'b001: // BNE (Branch if Not Equal)
                    if (rs1 != rs2)
                        pc_next = pc + imm;
                3'b100: // BLT (Branch if Less Than)
                    if ($signed(rs1) < $signed(rs2))
                        pc_next = pc + imm;
                3'b101: // BGE (Branch if Greater or Equal)
                    if ($signed(rs1) >= $signed(rs2))
                        pc_next = pc + imm;
                3'b110: // BLTU (Branch if Less Than Unsigned)
                    if (rs1 < rs2)
                        pc_next = pc + imm;
                3'b111: // BGEU (Branch if Greater or Equal Unsigned)
                    if (rs1 >= rs2)
                        pc_next = pc + imm;
                default: 
                    pc_next = pc + 4; // No branch, just increment PC by 4
            endcase
        end
    end

endmodule
