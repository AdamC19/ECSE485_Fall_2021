library verilog;
use verilog.vl_types.all;
entity adder_generic is
    generic(
        n               : integer := 32
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        cin             : in     vl_logic;
        cout            : out    vl_logic;
        ovf             : out    vl_logic;
        y               : out    vl_logic_vector
    );
end adder_generic;
