library verilog;
use verilog.vl_types.all;
entity MemCtrl is
    port(
        IR4             : in     vl_logic_vector(31 downto 0);
        DRead           : out    vl_logic;
        DWrite          : out    vl_logic
    );
end MemCtrl;
