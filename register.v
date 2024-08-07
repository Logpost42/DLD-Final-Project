U type registor 

  module riscv_utype (
    input wire [31:0] inst,     // 32-bit instruction input
    output wire [19:0] imm,     // Immediate value (imm[31:12])
    output wire [4:0] rd,       // Destination register (rd)
    output wire [6:0] opcode    // Opcode (opcode)
);

    // Extract the immediate value (imm[31:12])
    // U-Type immediate field is in bits [31:12] of the instruction
    assign imm = inst[31:12];

    // Extract the destination register (rd)
    // U-Type rd field is in bits [11:7] of the instruction
    assign rd = inst[11:7];

    // Extract the opcode (opcode)
    // U-Type opcode field is in bits [6:0] of the instruction
    assign opcode = inst[6:0];

endmodule


