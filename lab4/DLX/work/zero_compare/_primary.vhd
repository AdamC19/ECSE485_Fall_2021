library verilog;
use verilog.vl_types.all;
entity zero_compare is
    generic(
        DPFLAG          : integer := 0;
        \GROUP\         : string  := "AUTO"
    );
    port(
        A               : in     vl_logic_vector(31 downto 0);
        A_lessthan_zero : out    vl_logic;
        A_lessthan_equal_zero: out    vl_logic;
        A_greaterthan_equal_zero: out    vl_logic;
        A_greaterthan_zero: out    vl_logic;
        A_equal_zero    : out    vl_logic;
        A_not_equal_zero: out    vl_logic
    );
end zero_compare;
