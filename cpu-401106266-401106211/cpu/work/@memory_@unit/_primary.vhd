library verilog;
use verilog.vl_types.all;
entity Memory_Unit is
    port(
        clk             : in     vl_logic;
        write_enable    : in     vl_logic;
        output_enable   : in     vl_logic;
        address         : in     vl_logic_vector(4 downto 0);
        input_data      : in     vl_logic_vector(511 downto 0);
        output_data     : out    vl_logic_vector(511 downto 0)
    );
end Memory_Unit;
