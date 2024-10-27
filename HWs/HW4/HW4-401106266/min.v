module min #(
    parameter n
)  (
    a, b,
    res
);


input [n-1:0]a, b;
output reg [n-1:0]res;

always @(a or b) begin
    if ($signed(a) < 0) begin
        if($signed(b) < 0) begin
            if ($signed(a) < $signed(b))
                res = -b;
            else
                res = -a;
        end
        else begin
            if (-a < b)
                res = -a;
            else
                res = b;
        end
    end
    else begin
        if($signed(b) < 0) begin
            if (-b < a)
                res = -b;
            else
                res = a;
        end
        else begin
            if (a < b)
                res = a;
            else
                res = b;
        end
    end
end

endmodule //min
