library verilog;
use verilog.vl_types.all;
entity radar_vlg_check_tst is
    port(
        error           : in     vl_logic;
        ledblue         : in     vl_logic;
        ledgreen        : in     vl_logic;
        ledred          : in     vl_logic;
        q_cnt           : in     vl_logic_vector(3 downto 0);
        q_reg           : in     vl_logic_vector(3 downto 0);
        reset_o         : in     vl_logic;
        state           : in     vl_logic_vector(2 downto 0);
        store_o         : in     vl_logic;
        windows_o       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end radar_vlg_check_tst;
