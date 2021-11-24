library verilog;
use verilog.vl_types.all;
entity alu_generic is
    generic(
        n               : integer := 32
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        cin             : in     vl_logic;
        m               : in     vl_logic;
        s               : in     vl_logic_vector(3 downto 0);
        cout            : out    vl_logic;
        \out\           : out    vl_logic_vector;
        overflow        : out    vl_logic
    );
end alu_generic;
