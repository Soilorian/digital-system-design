module datapath #(
    parameter n
) (
    inA, inB, inC, reset_regs, sel_r1, sel_r5, clk, en,
    cmp_res, nor_res, r5
);

input [n-1:0]inA, inB, inC;
input reset_regs, sel_r1, sel_r5, clk, en;
output cmp_res, nor_res;
output [n-1:0]r5;

wire [n-1:0]r1, r2, r3, r4, adder_res, r1_mux_in, r5_mux_in, dec_r1, min_in, max_in;
wire nor_res, cmp_res, r1_mux_sel, r5_mux_sel;

reduction_nor #(n) reduction_nor_instance (
    .in(r1) ,
    .rn(nor_res)
);

compartor #(n) compartor_ins (
    .a(r4),
    .b(r3),
    .isGreater(cmp_res)
);

adder #(n) adder_inst (
    .a(r4),
    .b(r2),
    .result(adder_res)
);

register #(n) r4_register (
    .reset(reset_regs),
    .clk(clk),
    .enable(en),
    .data_in(adder_res),
    .data_out(r4)
);

register #(n) r3_register (
    .reset(1'b1),
    .enable(1'b1),
    .clk(clk),
    .data_in(inC),
    .data_out(r3)
);

max #(n) max_inst (
    .a(inA),
    .b(inB),
    .res(max_in)
);

min #(n) min_inst (
    .a(inA),
    .b(inB),
    .res(min_in)
);

register #(n) r2_register (
    .reset(1'b1),
    .enable(1'b1),
    .clk(clk),
    .data_in(max_in),
    .data_out(r2)
);

decrementer #(n) dec_r1_inst (
    .a(r1),
    .res(dec_r1)
);

two_to_one_mux #(n) r1_mux_inst (
    .a1(min_in),
    .a2(dec_r1),
    .sel(sel_r1),
    .res(r1_mux_in)
);

register #(n) r1_register (
    .reset(1'b1),
    .enable(1'b1),
    .clk(clk),
    .data_in(r1_mux_in),
    .data_out(r1)
);

two_to_one_mux #(n) r5_mux_inst (
    .a1(r3),
    .a2(r4),
    .sel(sel_r5),
    .res(r5_mux_in)
);

register #(n) r5_register (
    .reset(1'b1),
    .enable(nor_res | cmp_res),
    .clk(clk),
    .data_in(r5_mux_in),
    .data_out(r5)
);

endmodule //datapath