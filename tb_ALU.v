module tb_ALU();
    reg[31:0] A;
    reg[31:0] B;
    reg[3:0] ALU_control;
    wire [31:0] rd;
    wire Zero;

ALU uut (
    .A(A),
    .B(B),
    .ALU_control(ALU_control),
    .rd(rd),
    .Zero(Zero)
);
initial begin
    A = 32'd1; B = 32'd2;
    ALU_control = 4'b0000;  // ADD
    #10;
    $display("ADD Result: %d, Zero: %b", rd, Zero);

    ALU_control = 4'b0001;  // SUB
    #10;
    $display("SUB Result: %d, Zero: %b", rd, Zero);

    ALU_control = 4'b0010;  // AND
    #10;
    $display("AND Result: %d, Zero: %b", rd, Zero);

    ALU_control = 4'b0011;  // OR
    #10;
    $display("OR Result: %d, Zero: %b", rd, Zero);

    ALU_control = 4'b0100;  // XOR
    #10;
    $display("XOR Result: %d, Zero: %b", rd, Zero);

    ALU_control = 4'b0101;  // SLL
    #10;
    $display("SLL Result: %d, Zero: %b", rd, Zero);

    ALU_control = 4'b0110;  // SRL
    #10;
    $display("SRL Result: %d, Zero: %b", rd, Zero);

    ALU_control = 4'b0111;  // SRA
    #10;
    $display("SRA Result: %d, Zero: %b", rd, Zero);

    ALU_control = 4'b1000;  // SLT
    #10;
    $display("SLT Result: %d, Zero: %b", rd, Zero);

    ALU_control = 4'b1001;  // SLTU
    #10;
    $display("SLTU Result: %d, Zero: %b", rd, Zero);


    $finish;
end

endmodule