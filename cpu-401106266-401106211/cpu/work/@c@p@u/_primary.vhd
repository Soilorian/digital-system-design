library verilog;
use verilog.vl_types.all;
entity CPU is
    port(
        clk             : in     vl_logic;
        instruction     : in     vl_logic_vector(8 downto 0)
    );
end CPU;
