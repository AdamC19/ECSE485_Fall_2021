library verilog;
use verilog.vl_types.all;
entity dff_generic is
    generic(
        N               : integer := 8
    );
    port(
        CLK             : in     vl_logic;
        CLR             : in     vl_logic;
        D               : in     vl_logic_vector;
        HOLD            : in     vl_logic;
        PRE             : in     vl_logic;
        SCANIN          : in     vl_logic;
        TEST            : in     vl_logic;
        Q               : out    vl_logic_vector
    );
end dff_generic;
