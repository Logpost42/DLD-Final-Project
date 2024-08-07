module decode (
    input wire [31:0] instruction, // Fetched instruction
    output reg [3:0] alu_op,        // ALU operation
    output reg [4:0] rs1,           // Source register 1
    output reg [4:0] rs2,           // Source register 2
    output reg [4:0] rd,            // Destination register
    output reg [31:0] imm           // Immediate value
);
    always @(*) begin
        // Decoding logic (simplified)
        rs1 = instruction[19:15];
        rs2 = instruction[24:20];
        rd = instruction[11:7];
        imm = {20'b0, instruction[31:20]}; // Simplified immediate value extraction
        case (instruction[6:0]) // Opcode
            7'b0110011: alu_op = 4'b0000; // Example: ADD
            7'b0010011: alu_op = 4'b0001; // Example: OR
            // Additional opcodes can be added here
            default: alu_op = 4'b1111; // Undefined
        endcase
    end
endmodule
