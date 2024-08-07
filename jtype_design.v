// j_type.v
module j_type (
    input [31:0] instruction, // 32-bit instruction input
    output reg [31:0] imm     // 32-bit immediate output
);

    always @(*) begin
        // Extract and construct the 20-bit immediate value from instruction
        imm = {{12{instruction[31]}}, // sign-extend to 32 bits
               instruction[19:12],   // imm[19:12]
               instruction[20],      // imm[11]
               instruction[10:1]};   // imm[10:1]
    end

endmodule
