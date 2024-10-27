module encoder_4to2 (
    input [3:0]d ,
    output [1:0]q, v
);

assign q[1] = d[3] | d[2];
assign q[0] = d[3] | (~d[2] & d[1]);
assign v = d[3] | d[2] | d[1] | d[0];


endmodule //encoder_8to3
