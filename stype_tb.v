// S-type Instruction Module
module st_type (
    input wire [31:0] instruction,  // 32-bit instruction input
    output reg [4:0] rs1,           // Source Register 1
    output reg [4:0] rs2,           // Source Register 2
    output reg [2:0] funct3,        // Function code
    output reg [11:0] imm           // Immediate value
);

    // Extract fields from instruction
    always @(*) begin
        // The S-type instruction format: imm[11:5] | rs1 | funct3 | rs2 | imm[4:0]
        rs1 = instruction[19:15];
        rs2 = instruction[24:20];
        funct3 = instruction[14:12];
        imm = {instruction[31:25], instruction[11:7]}; // Combine imm[11:5] and imm[4:0]
    end
endmodule
