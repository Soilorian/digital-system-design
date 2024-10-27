module CPU(
    input clk,
    input [8:0] instruction
);

    localparam LOADD = 2'b11, LOADD2 = 2'b10, LOADS = 2'b00, OUTR = 2'b01;

    wire [511:0] A [0:3];
    wire [511:0] temp_array [0:6];
    wire [1:0] inst, r1;
    wire [4:0] addr;
    wire write_enable, output_enable;

    assign inst = instruction[8:7];
    assign r1 = instruction[6:5];
    assign addr = instruction[4:0];

    assign write_enable = ~instruction[8] & instruction[7];
    assign output_enable = ~instruction[8] & ~instruction[7];

    Register_file #(.n(512)) register_file (.clk(clk), .instruction(inst), .r_in(r1),
                                            .A1(A[0]), .A2(A[1]), .A3(A[2]), .A4(A[3]),
                                            .input_data1(temp_array[0]), .input_data2(temp_array[1]), .output_data(temp_array[4]));

    ALU #(.n(512)) alu (.input_data1(A[0]), .input_data2(A[1]),
                        .opcode(~instruction[7]), .output_data1(temp_array[2]), .output_data2(temp_array[3]));

    Memory_Unit memory_unit(.write_enable(write_enable), .output_enable(output_enable), .clk(clk),
                            .address(addr), .output_data(temp_array[5]), .input_data(temp_array[4]));
      
        assign temp_array[0] = instruction[8] ? temp_array[2] : temp_array[5];
        assign temp_array[1] = instruction[8] ? temp_array[3] : temp_array[1];
endmodule