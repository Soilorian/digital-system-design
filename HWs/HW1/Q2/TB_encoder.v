module TB_encoder ();
reg [3:0]d;
wire [1:0]q, v;
encoder_4to2 tb0 (d, q, v);
integer i;
initial begin
    $monitor($time, ": q = %b", q ,
     " for d = %b", d, " v = ", v);
    d = 8'b0;
    for (i = 0; i < 16 ; i = i+1) begin
        #10;
        d = d + 1;
    end
    $stop();
end

endmodule //TB_encoder
