module inoutPin_Dataflow
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

 assign bi_data = oe ? data_in : {n{1'bz}};
  assign data_out = bi_data;
  
endmodule
