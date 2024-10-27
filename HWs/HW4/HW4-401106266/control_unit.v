module control_unit (
    cmp_res, nor_res, start, clk,
    reset_regs, sel_r1, sel_r5, en
);

input cmp_res, nor_res, start, clk;
output reset_regs, sel_r1, sel_r5, en;

reg state = 0;

always @(posedge clk) begin
    if (state == 0) begin
        if(start == 1) begin
            state <= 1;
        end
    end
    else begin
        if(cmp_res) begin
            state <= 0;
        end
        else if (nor_res) begin
            state <= 0;
        end
    end
end

assign reset_regs = state | ~start;
assign sel_r1 = reset_regs;
assign en = state & (~cmp_res | ~nor_res);
assign sel_r5 = state & ~cmp_res & nor_res;

endmodule //control_unit
