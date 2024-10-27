module adder #(
    parameter n
) (
    a, b,
    overflow, result
);

input [n-1:0] a, b;
output reg overflow;
output reg [n-1:0]result;

always @(a or b) begin
    {overflow, result} <= a + b;
end

endmodule //adder
