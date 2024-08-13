module ALU(
    input [31:0] rs1,           // First operand
    input [31:0] rs2,           // Second operand
    input [3:0] ALU_control,    // Control signal for the ALU operation
    output reg [31:0] RegWrite, // Result of the ALU operation
    output Zero                 // Zero flag
);

    always @(*) begin
        case (ALU_control)
            4'b0000: RegWrite = rs1 + rs2;                   // ADD
            4'b0001: RegWrite = rs1 - rs2;                   // SUB
            4'b0010: RegWrite = rs1 & rs2;                   // AND
            4'b0011: RegWrite = rs1 | rs2;                   // OR
            4'b0100: RegWrite = rs1 ^ rs2;                   // XOR
            4'b0101: RegWrite = rs1 << rs2[4:0];             // SLL (Shift Left Logical)
            4'b0110: RegWrite = rs1 >> rs2[4:0];             // SRL (Shift Right Logical)
            4'b0111: RegWrite = $signed(rs1) >>> rs2[4:0];   // SRA (Shift Right Arithmetic)
            4'b1000: RegWrite = ($signed(rs1) < $signed(rs2)) ? 1 : 0; // SLT (Set Less Than, signed)
            4'b1001: RegWrite = (rs1 < rs2) ? 1 : 0;         // SLTU (Set Less Than, unsigned)
            default: RegWrite = 0;                           // Default case
        endcase
    end

    // Zero flag assignment
    assign Zero = (RegWrite == 32'b0) ? 1'b1 : 1'b0;

endmodule
