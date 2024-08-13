module ControlUnit (
    input [6:0] opcode,
    output reg [1:0] ALUOp,    // Typically a 2-bit control signal
    output reg Branch,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg JAL,
    output reg JALR
);

always @(*) begin
    // Default values for control signals
    ALUOp = 2'b00;
    Branch = 0;
    MemRead = 0;
    MemWrite = 0;
    ALUSrc = 0;
    RegWrite = 0;
    JAL = 0;
    JALR = 0;

    case(opcode)
        7'b0110011: begin // R-type
            ALUOp = 2'b10;   // ALU performs operation based on funct3 and funct7
            RegWrite = 1;
        end
        7'b0010011: begin // I-type (e.g., ADDI)
            ALUOp = 2'b00;   // ALU performs immediate operation
            ALUSrc = 1;
            RegWrite = 1;
        end
        7'b1100011: begin // B-type (e.g., BEQ)
            ALUOp = 2'b01;   // ALU performs a subtraction for comparison
            Branch = 1;
        end
        7'b1101111: begin // J-type (JAL)
            ALUOp = 2'b00;   // ALU not needed for JAL
            RegWrite = 1;
            JAL = 1;
        end
        7'b1100111: begin // I-type (JALR)
            ALUOp = 2'b00;   // ALU not needed for JALR
            ALUSrc = 1;
            RegWrite = 1;
            JALR = 1;
        end
        default: begin
            // Default case is already set by the initial assignments above
        end
    endcase
end
endmodule
