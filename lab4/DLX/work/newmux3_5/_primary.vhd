library verilog;
use verilog.vl_types.all;
entity newmux3_5 is
    generic(
        N               : integer := 5;
        DPFLAG          : integer := 1;
        \GROUP\         : string  := "dpath1";
        BUFFER_SIZE     : string  := "DEFAULT";
        d_Y             : integer := 1
    );
    port(
        IN0             : in     vl_logic_vector;
        IN1             : in     vl_logic_vector;
        IN2             : in     vl_logic_vector;
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        Y               : out    vl_logic_vector
    );
end newmux3_5;
