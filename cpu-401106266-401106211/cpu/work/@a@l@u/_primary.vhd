library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        n               : integer := 512
    );
    port(
        opcode          : in     vl_logic;
        input_data1     : in     vl_logic_vector;
        input_data2     : in     vl_logic_vector;
        output_data1    : out    vl_logic_vector;
        output_data2    : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end ALU;
