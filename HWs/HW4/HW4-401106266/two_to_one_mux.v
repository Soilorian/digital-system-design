module two_to_one_mux #(
    parameter n
) (
    a1, a2, sel,
    res
);

input [n-1:0]a1, a2;
input sel;
output reg [n-1:0] res;

always @(a1 or a2 or sel) begin
    if (sel == 1)
        res <= a2;
    else
        res <= a1;
end

endmodule //two_to_one_mux
