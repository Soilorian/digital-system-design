library verilog;
use verilog.vl_types.all;
entity johnson_counter is
    port(
        CLK             : in     vl_logic;
        SET             : in     vl_logic;
        CLR             : in     vl_logic;
        q               : out    vl_logic_vector(3 downto 0)
    );
end johnson_counter;
