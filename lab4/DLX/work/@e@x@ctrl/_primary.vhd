library verilog;
use verilog.vl_types.all;
entity EXCtrl is
    port(
        IR3             : in     vl_logic_vector(31 downto 0);
        IR4             : in     vl_logic_vector(31 downto 0);
        IR5             : in     vl_logic_vector(31 downto 0);
        ShiftAmount     : in     vl_logic_vector(31 downto 0);
        DestinationMuxSelect: out    vl_logic_vector(1 downto 0);
        DataWriteMuxSelect: out    vl_logic;
        ALUSelect       : out    vl_logic_vector(5 downto 0);
        ShiftSelect     : out    vl_logic_vector(4 downto 0);
        ALUorShiftMuxSelect: out    vl_logic_vector(1 downto 0);
        SourceMuxSelect : out    vl_logic_vector(1 downto 0);
        TargetMuxSelect : out    vl_logic_vector(1 downto 0);
        CompareMux1Select: out    vl_logic_vector(1 downto 0);
        CompareMux2Select: out    vl_logic_vector(1 downto 0);
        CompareResultMuxSelect: out    vl_logic_vector(1 downto 0)
    );
end EXCtrl;
