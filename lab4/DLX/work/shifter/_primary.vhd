library verilog;
use verilog.vl_types.all;
entity shifter is
    port(
        IN0             : in     vl_logic_vector(31 downto 0);
        S               : in     vl_logic_vector(4 downto 0);
        S2              : in     vl_logic_vector(1 downto 0);
        Y               : out    vl_logic_vector(31 downto 0)
    );
end shifter;
