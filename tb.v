module ITypeInstruction_tb;

    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] y;
    reg clk;
    integer i;

    RegisterFile rf (
        .clk(clk),
        .read_addr1(i),
        .read_addr2(i),
        .read_data1(b),
        .read_data2() 
    );

    ITypeInstruction uut (
        .a(a),
        .b(b),
        .y(y)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        
        for (i = 0; i < 32; i = i + 1) begin
            rf.registers[i] = i; 
        end

      
        for (i = 1; i < 32; i = i + 1) begin
            a = {20'b0, i[4:0], 3'b000, i[4:0], 7'b0010011};
            #10; 
            $display("ADDI x%0d, x%0d, 0: Expected = %b, Got = %b", i, i, rf.registers[i], y);
        end

        
        for (i = 1; i < 32; i = i + 1) begin
            a = {12'b000000000001, i[4:0], 3'b000, i[4:0], 7'b0010011}; 
            #10; 
            $display("ADDI x%0d, x%0d, 1: Expected = %b, Got = %b", i, i, rf.registers[i] + 1, y);
        end


        for (i = 1; i < 32; i = i + 1) begin
            a = 32'h00000013 | (i << 15) | (i << 7);
            #10; 
            $display("ADDI x%0d, x%0d, 0: Expected = %h, Got = %h", i, i, rf.registers[i], y);
        end

        for (i = 1; i < 32; i = i + 1) begin
            a = 32'h00100013 | (i << 15) | (i << 7); 
            #10; 
            $display("ADDI x%0d, x%0d, 1: Expected = %h, Got = %h", i, i, rf.registers[i] + 1, y);
        end

        $finish;
    end

endmodule