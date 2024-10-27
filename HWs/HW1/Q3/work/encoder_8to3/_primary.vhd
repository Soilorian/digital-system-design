library verilog;
use verilog.vl_types.all;
entity encoder_8to3 is
    port(
        d               : in     vl_logic_vector(7 downto 0);
        q               : out    vl_logic_vector(2 downto 0);
        v               : out    vl_logic_vector(2 downto 0)
    );
end encoder_8to3;
