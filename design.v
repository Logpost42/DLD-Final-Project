module ITypeInstruction(
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] y
);  //instruction
    //reg_data1
    //result

    reg [11:0] imm;
    reg [4:0] rs1, rd;
    reg [2:0] funct3;
    reg [6:0] opcode;

    always @(*) begin
        imm = a[31:20]; 
        rs1 = a[19:15]; 
        rd = a[11:7];   
        funct3 = a[14:12]; 
        opcode = a[6:0];  

       
        imm = {{20{imm[11]}}, imm};

        if (opcode == 7'b0010011) begin 
            case (funct3)
                3'b000: 
                    y = b + imm;
                default: 
                    y = 32'b0; 
            endcase
        end else begin
            y = 32'b0; 
        end
    end

endmodule