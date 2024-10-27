module reduction_nor #(
    parameter n
) (
    in,
    rn
);


input [n-1:0] in;
output reg rn;

always @(in) begin
    rn <= ~(|in);
end

endmodule //reduction_nor
