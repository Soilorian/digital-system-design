module register #(
    parameter n
) (
    data_in, reset, clk, enable,
    data_out
);
input [n-1:0]data_in;
input  reset, clk, enable;
output reg [n-1:0] data_out;

always @(posedge clk or negedge reset) begin
    if (!reset)
        data_out <= 0;
    else begin
        if (enable) begin
            data_out <= data_in;
        end
    end
end

endmodule //register
