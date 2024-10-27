module TB_multiplier ();

reg signed [7:0] A, B;
reg signed [15:0] prod;
wire signed [15:0] res;

multiplier tb0 (res, A, B);
integer signed i, j;
initial begin

    for (i = 0; i < 256; i=i+1)
        for (j = 0; j < 256; j=j+1) begin
        A = i; B = j;
        prod = A * B;
        #10;
        if (prod - res != 0)
            $display("result of the verilog program is ",  res 
            ,"\n but product is ", prod, "\n and A and B are    "
            , A, "     ", B,
             "\n=========================================================================");
        end

    
    $stop();
end

initial begin
    
    $dumpfile("TB_multiplier.vcd");
    $dumpvars;
end



endmodule //TB_multiplier
