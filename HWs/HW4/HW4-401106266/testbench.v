module testbench ();
parameter n = 32;
reg signed [n-1:0]a, b, c;
reg start, clk;
wire [n-1:0]result;
wire overflow, ready;

mult_and_min #(n) mam (
    .inA(a),
    .inB(b),
    .inC(c),
    .start(start),
    .clk(clk),
    .overflow(overflow),
    .ready(ready),
    .result(result)
);

initial begin
    clk = 0;
end

always #5 clk = ~clk;

initial begin
    a = 13; b = 12; c = 100; start = 1;
    #20;
    start = 0;
    #200;
    a = 4; b = 8; c = 59; start = 1;
    #20;
    start = 0;
    #200;
    a = 10; b = -2; c = 38; start = 1;
    #20;
    start = 0;
    #200;
    a = -10; b = -2; c = 38; start = 1;
    #20;
    start = 0;
    #200;
    a = -1; b = -2; c = 38; start = 1;
    #20;
    start = 0;
    #200;
    $stop();
end

initial begin
    $monitor($time, ": value of a is: ", a, " value of b is: ", b, " value of c is: ", c,
     " and we see result ", $signed(result), " with signals ready and overflow in order being ", ready, overflow);
end

initial begin
    $dumpfile("mult_and_min.vcd");
    $dumpvars();
end

endmodule //testbench
