library verilog;
use verilog.vl_types.all;
entity buff is
    generic(
        N               : integer := 32;
        DPFLAG          : integer := 1;
        \GROUP\         : string  := "dpath1";
        BUFFER_SIZE     : string  := "DEFAULT";
        d_Y             : integer := 1
    );
    port(
        IN0             : in     vl_logic_vector;
        Y               : out    vl_logic_vector
    );
end buff;
