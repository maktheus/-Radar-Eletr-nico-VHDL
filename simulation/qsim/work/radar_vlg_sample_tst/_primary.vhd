library verilog;
use verilog.vl_types.all;
entity radar_vlg_sample_tst is
    port(
        areset          : in     vl_logic;
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        start           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end radar_vlg_sample_tst;
