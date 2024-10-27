// module Memory_Unit (
//     input wire clk, rst, write_enable, output_enable,
//     input wire [4:0] address,
//     input wire [511:0] input_data,
//     output reg [511:0] output_data
// );
//     reg [31:0] memory [0:511];
//     wire [8:0] shift_address;
//     integer i;

//     assign shift_address = address << 4;

//     initial begin
//         $readmemh("input_memory.txt", memory);    
//     end
    
//     always @(posedge clk or negedge rst) begin
//         if (~rst)
//             output_data <= {512{1'b0}};
//         else
//             if (output_enable)
//                 for (i = 0; i < 16; i = i + 1)
//                     output_data[(32*i) +: 32] = memory[shift_address + i];
//     end

//     always @(negedge clk) begin
//         if (write_enable) begin
//             for (i = 0; i < 16; i = i + 1)
//                 memory[shift_address + i] = input_data[(32*i) +: 32];
//             $writememh("output_memory.txt", memory);
//         end
//     end
// endmodule

