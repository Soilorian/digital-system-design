library verilog;
use verilog.vl_types.all;
entity tri_state_buffer is
    port(
        i               : in     vl_logic;
        g               : in     vl_logic;
        o               : out    vl_logic
    );
end tri_state_buffer;
