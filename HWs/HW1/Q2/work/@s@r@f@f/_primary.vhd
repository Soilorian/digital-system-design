library verilog;
use verilog.vl_types.all;
entity SRFF is
    port(
        S               : in     vl_logic;
        R               : in     vl_logic;
        clk             : in     vl_logic;
        SET             : in     vl_logic;
        CLR             : in     vl_logic;
        Q               : out    vl_logic;
        Q_not           : out    vl_logic
    );
end SRFF;
