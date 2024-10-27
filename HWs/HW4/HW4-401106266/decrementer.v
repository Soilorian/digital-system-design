module decrementer #(
    parameter n
) (
    a,
    res
);

input [n-1:0] a;
output reg [n-1:0] res;

always @(a) begin
    res <= a-1;
end

endmodule //decrementer
