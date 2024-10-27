module TB ();

reg clk, CLR, SET;
wire [3:0]q;

johnson_counter tb(clk, SET, CLR, q);

integer i;
always #5 clk = ~clk;

initial begin
    $monitor($time, ": q= %b ", q,
     " while CLR is: ", CLR, " and SET is: ", SET);
    clk = 0;
    for(i = 0; i < 4; i = i+1) begin
        {CLR, SET} = i;
        #85;
    end
    $stop();
end



endmodule //TB
