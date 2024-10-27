module johnson_counter (
    input CLK, SET, CLR,
    output [3:0]q
);

wire inner_c;
SRFF srff0(inner_c, ~inner_c, CLK, SET, CLR, q[0]);
SRFF srff1(q[0], ~q[0], CLK, SET, CLR, q[1]);
SRFF srff2(q[1], ~q[1], CLK, SET, CLR, q[2]);
SRFF srff3(q[2], ~q[2], CLK, SET, CLR, q[3], inner_c);

endmodule //johnson_counter
