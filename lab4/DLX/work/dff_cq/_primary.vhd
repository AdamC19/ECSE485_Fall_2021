library verilog;
use verilog.vl_types.all;
entity dff_cq is
    generic(
        N               : integer := 32;
        DPFLAG          : integer := 1;
        \GROUP\         : string  := "dpath1";
        BUFFER_SIZE     : string  := "DEFAULT";
        d_Q             : integer := 1;
        d_QBAR          : integer := 1
    );
    port(
        CLK             : in     vl_logic;
        CLR             : in     vl_logic;
        D               : in     vl_logic_vector;
        Q               : out    vl_logic_vector;
        QBAR            : out    vl_logic_vector
    );
end dff_cq;
