`define N 8

module inoutPin_TB ();
parameter n = `N;
wire [n-1:0]bi_data, data_in_1, data_in_2, data_out_1, data_out_2;
reg oe_1;
wire oe_2;
reg [n-1:0]d1, d2;
integer i, j;

// section 1

assign data_in_1 = d1;
assign data_in_2 = d2;
assign oe_2 = ~oe_1;

inoutPin_Dataflow #(n) tb1 (data_in_1, oe_1, data_out_1, bi_data);
inoutPin_Dataflow #(n) tb2 (data_in_2, oe_2, data_out_2, bi_data);

// section 2

// assign data_in_1 = d1;
// assign data_in_2 = d2;
// assign #(2:3:4, 1:2:3) oe_2 = ~oe_1;

// inoutPin_gatelevel #(n) tb1 (data_in_1, oe_1, data_out_1, bi_data);
// inoutPin_gatelevel #(n) tb2 (data_in_2, oe_2, data_out_2, bi_data);

// section 3


// assign #(12:15:18) data_in_1 = d1;
// assign #(12:15:18) data_in_2 = d2;
// assign oe_2 = ~oe_1;

// inoutPin_Dataflow #(n) tb1 (data_in_1, oe_1, data_out_1, bi_data);
// inoutPin_Dataflow #(n) tb2 (data_in_2, oe_2, data_out_2, bi_data);


initial begin
    $monitor($time,
    ":    data in 1 is : ", data_in_1, "     data in 2 is : ", data_in_2,
    "     data out 1 is : ", data_out_1, "     data out 2 is : ", data_out_2, "\n"
    );
end

initial begin
    for (i = 0; i < 2; i = i + 1) begin
        oe_1 = i;
        for(j = 0; j < 4; j = j + 1)begin
            d1 = $random;
            d2 = $random;
            $display($time, ":    data_in_1: ", d1, "         data_in_2: ", d2);
            #20;
        end
        #30;
    end
end

endmodule //inoutPin_TB
