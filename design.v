//I type module

module ITypeInstruction(
    input [31:0] rs1,             // First source register value
    input [31:0] instruction,     // The complete 32-bit instruction
    output reg [31:0] ALUResult   // Result of ALU operation
);

    reg [11:0] imm;               // Immediate value
    reg [2:0] funct3;             // Function code
    reg [6:0] opcode;             // Opcode

    always @(*) begin
        // Extract fields from instruction
        imm = instruction[31:20];        // Extract immediate
        funct3 = instruction[14:12];     // Extract funct3
        opcode = instruction[6:0];       // Extract opcode

        // Sign-extend the immediate value
        imm = {{20{imm[11]}}, imm};

        // Default ALUResult
        ALUResult = 32'b0;

        // Check for I-type ALU instructions (e.g., ADDI)
        if (opcode == 7'b0010011) begin 
            case (funct3)
                3'b000: // ADDI (Add Immediate)
                    ALUResult = rs1 + imm;
                // Other cases can be added here (e.g., SLTI, ANDI, etc.)
                default: 
                    ALUResult = 32'b0; // Undefined operation
            endcase
        end 
    end

endmodule
