module STypeInstruction(
    input [31:0] rs1,            // Base address from register (rs1)
    input [31:0] rs2,            // Data to be stored from register (rs2)
    input [31:0] instruction,    // The complete 32-bit instruction
    output reg [31:0] mem_addr,  // Calculated memory address
    output reg [31:0] mem_data   // Data to be stored at the calculated memory address
);

    reg [6:0] opcode;
    reg [2:0] funct3;
    reg [11:0] imm;
    
    always @(*) begin
        opcode = instruction[6:0];      // Extract opcode
        funct3 = instruction[14:12];    // Extract funct3
        // Immediate value from instruction, combining parts from different fields
        imm = {instruction[31:25], instruction[11:7]};

        // Calculate memory address: base address (rs1) + sign-extended immediate
        mem_addr = rs1 + {{20{imm[11]}}, imm};

        // Default data to zero
        mem_data = 32'b0;

        // If the opcode indicates a store instruction (S-type)
        if (opcode == 7'b0100011) begin
            case (funct3)
                3'b010: // SW (Store Word)
                    mem_data = rs2;  // Store the full 32-bit word from rs2 to memory
                // Additional store operations (e.g., SB, SH) can be handled here if needed
                default: 
                    mem_data = 32'b0; // For unsupported funct3 values
            endcase
        end
    end

endmodule
