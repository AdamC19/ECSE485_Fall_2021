library verilog;
use verilog.vl_types.all;
entity WBCtrl is
    port(
        IR5             : in     vl_logic_vector(31 downto 0);
        WBMuxSelect     : out    vl_logic;
        WriteEnable     : out    vl_logic
    );
end WBCtrl;
