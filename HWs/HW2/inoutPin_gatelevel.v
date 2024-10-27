module inoutPin_gatelevel
#(parameter n)
(
  data_in, oe,
  data_out,
  bi_data
);
  input [n-1:0]data_in;
  input oe;
  output [n-1:0]data_out;
  inout [n-1:0]bi_data;

  genvar i;
  generate
  for (i = 0; i<n ; i=i+1) begin
    bufif1 #(5:6:7, 4:5:6, 4:5:6) b (bi_data[i], data_in[i], oe);
  end
  endgenerate

  assign #(5:6:7, 4:5:6, 4:5:6) data_out = bi_data;

endmodule
