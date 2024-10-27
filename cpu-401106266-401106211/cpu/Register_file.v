module Register_file #(
    parameter n=512
) (
    input wire clk,
    input wire [n-1:0] input_data1, input_data2,
    input wire [1:0] instruction, r_in,
    output reg [n-1:0] output_data, A1, A2, A3, A4
);

localparam LOADD = 2'b11, LOADD2 = 2'b10, LOADS = 2'b00, OUTR = 2'b01;

    always @(negedge clk) begin
            if (instruction[1]) begin
                A3 <= input_data1;
                A4 <= input_data2;
            end
            else if (instruction == LOADS) begin
                case (r_in)
                    2'b00:  A1 = input_data1;
                    2'b01:  A2 = input_data1;
                    2'b01:  A3 = input_data1;
                    2'b11:  A4 = input_data1;
                endcase
            end
        end
    always @(posedge clk) begin
        if (instruction == OUTR) begin
            case  (r_in)
                2'b00:  output_data = A1;
                2'b01:  output_data = A2;
                2'b10:  output_data = A3;
                2'b11:  output_data = A4; 
            endcase
        end
    end
endmodule
