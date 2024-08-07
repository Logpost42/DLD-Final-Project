module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_control,
    output reg[31:0] rd,
    output Zero
    );

//RISC-V operations
always @(*) begin
    case (ALU_control)
        4'b0000: rd = A + B;
        4'b0001: rd = A - B;
        4'b0010: rd = A & B;
        4'b0011: rd = A | B;
        4'b0100: rd = A ^ B;
        4'b0101: rd = A << B[4:0];
        4'b0110: rd = A >> B[4:0];
        4'b0111: rd = $signed(A) >>> B[4:0];
        4'b1000: rd = ($signed(A) < $signed(B)) ? 1 : 0;
        4'b1001: rd = (A < B) ? 1 : 0;
        default: rd = 0;
    endcase
end

assign Zero = 0;
endmodule

