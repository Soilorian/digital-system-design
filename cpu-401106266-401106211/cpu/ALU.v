module ALU #(
    parameter n=512
)(
    input opcode,
    input wire [n-1:0] input_data1, input_data2,
    output wire [n-1:0] output_data1, output_data2
);

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            assign {output_data2[32*i +: 32], output_data1[32*i +: 32]}
             = opcode ?
              $signed(input_data1[32*i +: 32]) + $signed(input_data2[32*i +: 32])
            : $signed(input_data1[32*i +: 32]) * $signed(input_data2[32*i +: 32]);
        end
    endgenerate

endmodule