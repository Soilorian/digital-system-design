module mult_and_min #(
    parameter n
) (
    inA, inB, inC, start, clk,
    ready, overflow, result
);

input [n-1:0]inA, inB, inC;
input start, clk;
output ready, overflow;
output [n-1:0]result;

wire reset_regs, sel_r1, sel_r5, en, nor_res, cmp_res;

control_unit cn_inst (
    .cmp_res(cmp_res),
    .nor_res(nor_res),
    .start(start),
    .clk(clk),
    .reset_regs(reset_regs),
    .sel_r1(sel_r1),
    .sel_r5(sel_r5),
    .en(en)
);

datapath #(n) dp_inst (
    .inA(inA),
    .inB(inB),
    .inC(inC),
    .reset_regs(reset_regs),
    .sel_r1(sel_r1),
    .sel_r5(sel_r5),
    .clk(clk),
    .en(en),
    .cmp_res(cmp_res),
    .nor_res(nor_res),
    .r5(result)
);

register #(1) ready_register (
    .reset(reset_regs),
    .clk(clk),
    .enable(en),
    .data_in(nor_res),
    .data_out(ready)
);

register #(1) overflow_register (
    .reset(reset_regs),
    .clk(clk),
    .enable(en),
    .data_in(cmp_res),
    .data_out(overflow)
);

endmodule //mult_and_min
