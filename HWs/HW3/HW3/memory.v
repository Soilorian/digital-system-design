module memory #(
    parameter integer width = 8,
    parameter integer depth = 16,
    parameter integer log_depth = 4
)(
    input clk,
    input reset,
    input write_on_a,
    input write_on_b,
    input [log_depth:0] address_a, 
    input [log_depth:0] address_b, 
    inout [width-1:0] a,
    inout [width-1:0] b,
    output reg we_race
);

reg [width-1:0] storage[depth-1:0];
reg [width-1:0] a_internal;
reg [width-1:0] b_internal;
integer i;

always @(posedge clk or posedge reset) begin
    we_race = 0;
    if (reset) begin
        for (i = 0; i < depth; i = i + 1) begin
            storage[i] <= {width{1'b0}};
        end
        a_internal <= 0;
        b_internal <= 0;
    end else begin
        case ({write_on_a, write_on_b})
            2'b11: begin
                b_internal = b;
                storage[address_b] <= b_internal;
                if (address_a == address_b) 
                    we_race = 1;
                else begin
                    a_internal = a;
                    storage[address_a] = a_internal;
                end
            end
            2'b10: begin
                b_internal = storage[address_b];
                a_internal = a;
                storage[address_a] = a_internal;
            end
            2'b01: begin
                a_internal = storage[address_a];
                b_internal = b;
                storage[address_b] = b_internal;
            end
            2'b00: begin
                b_internal = storage[address_b];
                a_internal = storage[address_a];
            end
        endcase
    end
end

assign a = write_on_a ? {width{1'bz}} : a_internal;
assign b = write_on_b ? {width{1'bz}} : b_internal;

endmodule // memory
