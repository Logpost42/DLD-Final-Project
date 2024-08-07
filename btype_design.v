// B-type Instruction Module
module b_type (
    input wire [31:0] instruction,  // 32-bit instruction input
    output reg [4:0] rs1,           // Source Register 1
    output reg [4:0] rs2,           // Source Register 2
    output reg [2:0] funct3,        // Function code
    output reg [12:0] imm           // Immediate value
);

    // Extract fields from instruction
    always @(*) begin
        // The B-type instruction format: imm[12] | imm[10:5] | rs1 | funct3 | rs2 | imm[4:1] | imm[11]
        rs1 = instruction[19:15];
        rs2 = instruction[24:20];
        funct3 = instruction[14:12];
        imm = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]}; // Combine imm[12], imm[10:5], imm[4:1], imm[11]
    end
endmodule
