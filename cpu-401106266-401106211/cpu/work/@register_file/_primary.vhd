library verilog;
use verilog.vl_types.all;
entity Register_file is
    generic(
        n               : integer := 512
    );
    port(
        clk             : in     vl_logic;
        input_data1     : in     vl_logic_vector;
        input_data2     : in     vl_logic_vector;
        instruction     : in     vl_logic_vector(1 downto 0);
        r_in            : in     vl_logic_vector(1 downto 0);
        output_data     : out    vl_logic_vector;
        A1              : out    vl_logic_vector;
        A2              : out    vl_logic_vector;
        A3              : out    vl_logic_vector;
        A4              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end Register_file;
