library verilog;
use verilog.vl_types.all;
entity radar is
    port(
        error           : out    vl_logic;
        enable          : in     vl_logic;
        areset          : in     vl_logic;
        start           : in     vl_logic;
        clk             : in     vl_logic;
        ledred          : out    vl_logic;
        ledblue         : out    vl_logic;
        ledgreen        : out    vl_logic;
        reset_o         : out    vl_logic;
        windows_o       : out    vl_logic;
        store_o         : out    vl_logic;
        q_cnt           : out    vl_logic_vector(3 downto 0);
        q_reg           : out    vl_logic_vector(3 downto 0);
        state           : out    vl_logic_vector(2 downto 0)
    );
end radar;
