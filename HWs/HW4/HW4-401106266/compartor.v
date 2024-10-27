module compartor #(
    parameter n
) (
    a, b,
    isGreater
);

input[n-1:0] a, b;
output reg isGreater;


always @(a, b) begin
    if ($signed(a) > $signed(b))
        isGreater <= 1;
    else
        isGreater <= 0;
end

endmodule //compartor
