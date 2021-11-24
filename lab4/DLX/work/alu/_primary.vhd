library verilog;
use verilog.vl_types.all;
entity alu is
    generic(
        N               : integer := 32;
        FAST            : integer := 0;
        DPFLAG          : integer := 1;
        \GROUP\         : string  := "dpath1";
        BUFFER_SIZE     : string  := "DEFAULT";
        d_COUT_r        : integer := 1;
        d_COUT_f        : integer := 1;
        d_F             : integer := 1
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        C0              : in     vl_logic;
        M               : in     vl_logic;
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        S2              : in     vl_logic;
        S3              : in     vl_logic;
        COUT            : out    vl_logic;
        F               : out    vl_logic_vector
    );
end alu;
