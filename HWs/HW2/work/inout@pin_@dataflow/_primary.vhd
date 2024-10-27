library verilog;
use verilog.vl_types.all;
entity inoutPin_Dataflow is
    generic(
        n               : integer := 8
    );
    port(
        data_in         : in     vl_logic_vector;
        oe              : in     vl_logic;
        data_out        : out    vl_logic_vector;
        bi_data         : inout  vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end inoutPin_Dataflow;
