library verilog;
use verilog.vl_types.all;
entity memory is
    generic(
        width           : integer := 8;
        depth           : integer := 16;
        log_depth       : integer := 4
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        write_on_a      : in     vl_logic;
        write_on_b      : in     vl_logic;
        address_a       : in     vl_logic_vector;
        address_b       : in     vl_logic_vector;
        a               : inout  vl_logic_vector;
        b               : inout  vl_logic_vector;
        we_race         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 2;
    attribute mti_svvh_generic_type of depth : constant is 2;
    attribute mti_svvh_generic_type of log_depth : constant is 2;
end memory;
