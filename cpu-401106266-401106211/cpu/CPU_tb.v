module CPU_tb;
    
    reg [8:0] instruction;
    reg clk;

    CPU cpu(clk, instruction);
 
    always #6 clk = ~clk;

    initial begin
        clk = 0;
        #3
        instruction = 9'b000011110;     //load A1 <- memory(30)
        #12 instruction = 9'b000111111; //load A2 <- memmory(31)
        #12 instruction = 9'b110000000; //mul A4|A3=A1*A2
        #12 instruction = 9'b011001010; //store A3 -> memory(10)
        #12 instruction = 9'b011100101; //store A4 -> memory(5)
        #12 instruction = 9'b100000000; //add A4|A3=A1+A2
        #12 instruction = 9'b011010100; //store A3 -> memory(20)
        #12 instruction = 9'b011111001; //store A4 -> memory(25)
        #63 $stop();
    end

endmodule

