library verilog;
use verilog.vl_types.all;
entity regfile2r is
    generic(
        N               : integer := 32;
        WORDS           : integer := 32;
        M               : integer := 5;
        \GROUP\         : string  := "dpath1";
        BUFFER_SIZE     : string  := "DEFAULT";
        d_OUT1          : integer := 1;
        d_OUT2          : integer := 1
    );
    port(
        IN0             : in     vl_logic_vector;
        R1              : in     vl_logic_vector;
        R2              : in     vl_logic_vector;
        RE1             : in     vl_logic;
        RE2             : in     vl_logic;
        W               : in     vl_logic_vector;
        WE              : in     vl_logic;
        OUT1            : out    vl_logic_vector;
        OUT2            : out    vl_logic_vector
    );
end regfile2r;
