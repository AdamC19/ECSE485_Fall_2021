library verilog;
use verilog.vl_types.all;
entity addhsv is
    generic(
        N               : integer := 32;
        DPFLAG          : integer := 1;
        \GROUP\         : string  := "dpath1";
        BUFFER_SIZE     : string  := "DEFAULT";
        d_COUT_r        : integer := 1;
        d_COUT_f        : integer := 1;
        d_OVF_r         : integer := 1;
        d_OVF_f         : integer := 1;
        d_SUM           : integer := 1
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        CIN             : in     vl_logic;
        COUT            : out    vl_logic;
        OVF             : out    vl_logic;
        SUM             : out    vl_logic_vector
    );
end addhsv;
