module memory_tb;

    localparam integer WIDTH = 8;
    localparam integer DEPTH = 16;
    localparam integer LOG_DEPTH = $clog2(DEPTH);

    reg clk;
    reg reset;
    reg write_on_a;
    reg write_on_b;
    reg [LOG_DEPTH:0] address_a;
    reg [LOG_DEPTH:0] address_b;
    wire [WIDTH-1:0] a;
    wire [WIDTH-1:0] b;
    reg [WIDTH-1:0] a_reg;
    reg [WIDTH-1:0] b_reg;
    wire we_race;

    assign a = write_on_a ?  a_reg : {WIDTH{1'bz}};
    assign b = write_on_b ?  b_reg : {WIDTH{1'bz}};

    memory #(
        .width(WIDTH),
        .depth(DEPTH),
        .log_depth(LOG_DEPTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .write_on_a(write_on_a),
        .write_on_b(write_on_b),
        .address_a(address_a),
        .address_b(address_b),
        .a(a),
        .b(b),
        .we_race(we_race)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        write_on_a = 0;
        write_on_b = 0;
        address_a = 0;
        address_b = 0;
        a_reg = 0;
        b_reg = 0;
        #5;
        reset = 0;
        write_on_a = 1;
        write_on_b = 1;
        address_a = 5;
        address_b = 3;
        a_reg = 25;
        b_reg = 9;
        #10;
        write_on_a = 0;
        write_on_b = 0;
        address_a = 3;
        address_b = 5;
        #10;
        write_on_a = 1;
        write_on_b = 0;
        address_a = 3;
        address_b = 3;
        a_reg = 20;
        #10;
        write_on_a = 0;
        write_on_b = 1;
        address_a = 5;
        address_b = 5;
        b_reg = 70;
        #10;
        write_on_a = 0;
        write_on_b = 0;
        address_a = 3;
        address_b = 5;
        #10;
        write_on_a = 1;
        write_on_b = 1;
        address_a = 3;
        address_b = 3;
        a_reg = 25;
        b_reg = 35;
        #10;
        write_on_a = 0;
        write_on_b = 0;
        address_a = 3;
        address_b = 0;
        #10;
        $stop();
    end

    initial begin
        $monitor("Time: %2t, reset: %0b, write_on_a: %0b, write_on_b: %0b, address_a: %0d, address_b: %0d, a: %2d, b: %2d, we_race: %0b", 
                 $time, reset, write_on_a, write_on_b, address_a, address_b, a, b, we_race);
    end

endmodule
