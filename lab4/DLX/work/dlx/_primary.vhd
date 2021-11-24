library verilog;
use verilog.vl_types.all;
entity dlx is
    port(
        PHI1            : in     vl_logic;
        DAddr           : out    vl_logic_vector(31 downto 0);
        DRead           : out    vl_logic;
        DWrite          : out    vl_logic;
        DOut            : out    vl_logic_vector(31 downto 0);
        DIn             : in     vl_logic_vector(31 downto 0);
        IAddr           : out    vl_logic_vector(31 downto 0);
        IRead           : out    vl_logic;
        IIn             : in     vl_logic_vector(31 downto 0);
        MRST            : in     vl_logic;
        TCE             : in     vl_logic;
        TMS             : in     vl_logic;
        TDI             : in     vl_logic;
        TDO             : out    vl_logic
    );
end dlx;
