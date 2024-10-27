library verilog;
use verilog.vl_types.all;
entity inoutPin_TB is
    generic(
        n               : integer := 8
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end inoutPin_TB;
