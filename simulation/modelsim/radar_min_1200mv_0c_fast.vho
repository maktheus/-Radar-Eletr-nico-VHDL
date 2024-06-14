-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "06/07/2024 11:01:33"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	radar IS
    PORT (
	reset : OUT std_logic;
	enable : IN std_logic;
	areset : IN std_logic;
	start : IN std_logic;
	clk : IN std_logic;
	windows : OUT std_logic;
	store : OUT std_logic;
	error : OUT std_logic;
	ledred : OUT std_logic;
	ledblue : OUT std_logic;
	ledgreen : OUT std_logic;
	q_cnt : OUT std_logic_vector(3 DOWNTO 0);
	q_reg : OUT std_logic_vector(3 DOWNTO 0);
	state : OUT std_logic_vector(2 DOWNTO 0)
	);
END radar;

-- Design Ports Information
-- reset	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- windows	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- store	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- error	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledred	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledblue	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledgreen	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_cnt[3]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_cnt[2]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_cnt[1]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_cnt[0]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_reg[3]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_reg[2]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_reg[1]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_reg[0]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[2]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[1]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[0]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- areset	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF radar IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_areset : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_windows : std_logic;
SIGNAL ww_store : std_logic;
SIGNAL ww_error : std_logic;
SIGNAL ww_ledred : std_logic;
SIGNAL ww_ledblue : std_logic;
SIGNAL ww_ledgreen : std_logic;
SIGNAL ww_q_cnt : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_q_reg : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_state : std_logic_vector(2 DOWNTO 0);
SIGNAL \enable~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \areset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~output_o\ : std_logic;
SIGNAL \windows~output_o\ : std_logic;
SIGNAL \store~output_o\ : std_logic;
SIGNAL \error~output_o\ : std_logic;
SIGNAL \ledred~output_o\ : std_logic;
SIGNAL \ledblue~output_o\ : std_logic;
SIGNAL \ledgreen~output_o\ : std_logic;
SIGNAL \q_cnt[3]~output_o\ : std_logic;
SIGNAL \q_cnt[2]~output_o\ : std_logic;
SIGNAL \q_cnt[1]~output_o\ : std_logic;
SIGNAL \q_cnt[0]~output_o\ : std_logic;
SIGNAL \q_reg[3]~output_o\ : std_logic;
SIGNAL \q_reg[2]~output_o\ : std_logic;
SIGNAL \q_reg[1]~output_o\ : std_logic;
SIGNAL \q_reg[0]~output_o\ : std_logic;
SIGNAL \state[2]~output_o\ : std_logic;
SIGNAL \state[1]~output_o\ : std_logic;
SIGNAL \state[0]~output_o\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \enable~inputclkctrl_outclk\ : std_logic;
SIGNAL \areset~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \inst|current.reset_s~1_combout\ : std_logic;
SIGNAL \inst|check_error~0_combout\ : std_logic;
SIGNAL \inst|current.wait4start_s~q\ : std_logic;
SIGNAL \inst|current.reset_s~0_combout\ : std_logic;
SIGNAL \inst|current.reset_s~q\ : std_logic;
SIGNAL \inst|nx_out~0_combout\ : std_logic;
SIGNAL \inst|reset~combout\ : std_logic;
SIGNAL \inst|current.count_s~q\ : std_logic;
SIGNAL \inst|current.load_s~q\ : std_logic;
SIGNAL \inst|nx_out~1_combout\ : std_logic;
SIGNAL \inst|windows~combout\ : std_logic;
SIGNAL \inst|nx_out~2_combout\ : std_logic;
SIGNAL \inst|store~combout\ : std_logic;
SIGNAL \inst1|cnt~0_combout\ : std_logic;
SIGNAL \areset~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst1|q[3]~1_combout\ : std_logic;
SIGNAL \inst1|cnt~3_combout\ : std_logic;
SIGNAL \inst1|q[0]~13_combout\ : std_logic;
SIGNAL \inst1|q[0]~15_combout\ : std_logic;
SIGNAL \inst1|inc_q~0_combout\ : std_logic;
SIGNAL \inst1|q[0]~_emulated_q\ : std_logic;
SIGNAL \inst1|q[0]~14_combout\ : std_logic;
SIGNAL \inst1|cnt~2_combout\ : std_logic;
SIGNAL \inst1|q[1]~9_combout\ : std_logic;
SIGNAL \inst1|cnt~1_combout\ : std_logic;
SIGNAL \inst1|q[2]~5_combout\ : std_logic;
SIGNAL \inst1|Add0~1_combout\ : std_logic;
SIGNAL \inst1|q[2]~7_combout\ : std_logic;
SIGNAL \inst1|q[2]~_emulated_q\ : std_logic;
SIGNAL \inst1|q[2]~6_combout\ : std_logic;
SIGNAL \inst1|Equal0~0_combout\ : std_logic;
SIGNAL \inst1|q[1]~11_combout\ : std_logic;
SIGNAL \inst1|q[1]~_emulated_q\ : std_logic;
SIGNAL \inst1|q[1]~10_combout\ : std_logic;
SIGNAL \inst1|Add0~0_combout\ : std_logic;
SIGNAL \inst1|q[3]~3_combout\ : std_logic;
SIGNAL \inst1|q[3]~_emulated_q\ : std_logic;
SIGNAL \inst1|q[3]~2_combout\ : std_logic;
SIGNAL \inst2|reg~0_combout\ : std_logic;
SIGNAL \inst2|q[3]~1_combout\ : std_logic;
SIGNAL \inst2|q[3]~3_combout\ : std_logic;
SIGNAL \inst2|load_q~0_combout\ : std_logic;
SIGNAL \inst2|q[3]~_emulated_q\ : std_logic;
SIGNAL \inst2|q[3]~2_combout\ : std_logic;
SIGNAL \inst2|reg~1_combout\ : std_logic;
SIGNAL \inst2|q[2]~5_combout\ : std_logic;
SIGNAL \inst2|q[2]~7_combout\ : std_logic;
SIGNAL \inst2|q[2]~_emulated_q\ : std_logic;
SIGNAL \inst2|q[2]~6_combout\ : std_logic;
SIGNAL \inst2|reg~2_combout\ : std_logic;
SIGNAL \inst2|q[1]~9_combout\ : std_logic;
SIGNAL \inst2|q[1]~11_combout\ : std_logic;
SIGNAL \inst2|q[1]~_emulated_q\ : std_logic;
SIGNAL \inst2|q[1]~10_combout\ : std_logic;
SIGNAL \inst2|reg~3_combout\ : std_logic;
SIGNAL \inst2|q[0]~13_combout\ : std_logic;
SIGNAL \inst2|q[0]~15_combout\ : std_logic;
SIGNAL \inst2|q[0]~_emulated_q\ : std_logic;
SIGNAL \inst2|q[0]~14_combout\ : std_logic;
SIGNAL \inst|state\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_areset~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|ALT_INV_check_error~0_combout\ : std_logic;

BEGIN

reset <= ww_reset;
ww_enable <= enable;
ww_areset <= areset;
ww_start <= start;
ww_clk <= clk;
windows <= ww_windows;
store <= ww_store;
error <= ww_error;
ledred <= ww_ledred;
ledblue <= ww_ledblue;
ledgreen <= ww_ledgreen;
q_cnt <= ww_q_cnt;
q_reg <= ww_q_reg;
state <= ww_state;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\enable~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \enable~input_o\);

\areset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \areset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_areset~inputclkctrl_outclk\ <= NOT \areset~inputclkctrl_outclk\;
\inst|ALT_INV_check_error~0_combout\ <= NOT \inst|check_error~0_combout\;

-- Location: IOOBUF_X22_Y0_N9
\reset~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|reset~combout\,
	devoe => ww_devoe,
	o => \reset~output_o\);

-- Location: IOOBUF_X14_Y31_N2
\windows~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|windows~combout\,
	devoe => ww_devoe,
	o => \windows~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\store~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|store~combout\,
	devoe => ww_devoe,
	o => \store~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\error~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \error~output_o\);

-- Location: IOOBUF_X26_Y31_N9
\ledred~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledred~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\ledblue~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \enable~input_o\,
	devoe => ww_devoe,
	o => \ledblue~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\ledgreen~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledgreen~output_o\);

-- Location: IOOBUF_X22_Y0_N2
\q_cnt[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|q[3]~2_combout\,
	devoe => ww_devoe,
	o => \q_cnt[3]~output_o\);

-- Location: IOOBUF_X12_Y0_N9
\q_cnt[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|q[2]~6_combout\,
	devoe => ww_devoe,
	o => \q_cnt[2]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\q_cnt[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|q[1]~10_combout\,
	devoe => ww_devoe,
	o => \q_cnt[1]~output_o\);

-- Location: IOOBUF_X12_Y0_N2
\q_cnt[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|q[0]~14_combout\,
	devoe => ww_devoe,
	o => \q_cnt[0]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\q_reg[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|q[3]~2_combout\,
	devoe => ww_devoe,
	o => \q_reg[3]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\q_reg[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|q[2]~6_combout\,
	devoe => ww_devoe,
	o => \q_reg[2]~output_o\);

-- Location: IOOBUF_X24_Y0_N2
\q_reg[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|q[1]~10_combout\,
	devoe => ww_devoe,
	o => \q_reg[1]~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\q_reg[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|q[0]~14_combout\,
	devoe => ww_devoe,
	o => \q_reg[0]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\state[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \state[2]~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\state[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|state\(1),
	devoe => ww_devoe,
	o => \state[1]~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\state[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|state\(0),
	devoe => ww_devoe,
	o => \state[0]~output_o\);

-- Location: IOIBUF_X16_Y0_N1
\enable~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

-- Location: CLKCTRL_G18
\enable~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \enable~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \enable~inputclkctrl_outclk\);

-- Location: IOIBUF_X16_Y0_N22
\areset~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_areset,
	o => \areset~input_o\);

-- Location: IOIBUF_X16_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X26_Y0_N1
\start~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: LCCOMB_X16_Y1_N6
\inst|current.reset_s~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|current.reset_s~1_combout\ = (\start~input_o\) # (\inst|current.wait4start_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datac => \inst|current.wait4start_s~q\,
	combout => \inst|current.reset_s~1_combout\);

-- Location: LCCOMB_X16_Y1_N2
\inst|check_error~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|check_error~0_combout\ = (\enable~input_o\ & \areset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~input_o\,
	datad => \areset~input_o\,
	combout => \inst|check_error~0_combout\);

-- Location: FF_X16_Y1_N7
\inst|current.wait4start_s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|current.reset_s~1_combout\,
	clrn => \inst|ALT_INV_check_error~0_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|current.wait4start_s~q\);

-- Location: LCCOMB_X16_Y1_N4
\inst|current.reset_s~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|current.reset_s~0_combout\ = (\enable~input_o\ & (!\inst|current.wait4start_s~q\ & ((\start~input_o\) # (\inst|current.reset_s~q\)))) # (!\enable~input_o\ & (((\inst|current.reset_s~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|current.wait4start_s~q\,
	datab => \start~input_o\,
	datac => \enable~input_o\,
	datad => \inst|current.reset_s~q\,
	combout => \inst|current.reset_s~0_combout\);

-- Location: FF_X16_Y1_N3
\inst|current.reset_s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|current.reset_s~0_combout\,
	clrn => \inst|ALT_INV_check_error~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|current.reset_s~q\);

-- Location: LCCOMB_X16_Y1_N8
\inst|nx_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|nx_out~0_combout\ = (!\areset~input_o\ & \inst|current.reset_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \areset~input_o\,
	datad => \inst|current.reset_s~q\,
	combout => \inst|nx_out~0_combout\);

-- Location: LCCOMB_X16_Y1_N18
\inst|reset\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|reset~combout\ = (GLOBAL(\enable~inputclkctrl_outclk\) & ((\inst|nx_out~0_combout\))) # (!GLOBAL(\enable~inputclkctrl_outclk\) & (\inst|reset~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|reset~combout\,
	datab => \enable~inputclkctrl_outclk\,
	datad => \inst|nx_out~0_combout\,
	combout => \inst|reset~combout\);

-- Location: FF_X16_Y1_N19
\inst|current.count_s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst|current.load_s~q\,
	clrn => \inst|ALT_INV_check_error~0_combout\,
	sload => VCC,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|current.count_s~q\);

-- Location: LCCOMB_X16_Y1_N20
\inst|state[0]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|state\(0) = (\inst|current.reset_s~q\) # (\inst|current.count_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|current.reset_s~q\,
	datad => \inst|current.count_s~q\,
	combout => \inst|state\(0));

-- Location: FF_X16_Y1_N21
\inst|current.load_s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst|state\(0),
	clrn => \inst|ALT_INV_check_error~0_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|current.load_s~q\);

-- Location: LCCOMB_X16_Y1_N0
\inst|nx_out~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|nx_out~1_combout\ = (!\areset~input_o\ & \inst|current.load_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \areset~input_o\,
	datad => \inst|current.load_s~q\,
	combout => \inst|nx_out~1_combout\);

-- Location: LCCOMB_X16_Y1_N12
\inst|windows\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|windows~combout\ = (GLOBAL(\enable~inputclkctrl_outclk\) & ((\inst|nx_out~1_combout\))) # (!GLOBAL(\enable~inputclkctrl_outclk\) & (\inst|windows~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|windows~combout\,
	datac => \enable~inputclkctrl_outclk\,
	datad => \inst|nx_out~1_combout\,
	combout => \inst|windows~combout\);

-- Location: LCCOMB_X16_Y1_N28
\inst|nx_out~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|nx_out~2_combout\ = (!\areset~input_o\ & \inst|current.count_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \areset~input_o\,
	datad => \inst|current.count_s~q\,
	combout => \inst|nx_out~2_combout\);

-- Location: LCCOMB_X16_Y1_N16
\inst|store\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|store~combout\ = (GLOBAL(\enable~inputclkctrl_outclk\) & ((\inst|nx_out~2_combout\))) # (!GLOBAL(\enable~inputclkctrl_outclk\) & (\inst|store~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|store~combout\,
	datac => \enable~inputclkctrl_outclk\,
	datad => \inst|nx_out~2_combout\,
	combout => \inst|store~combout\);

-- Location: LCCOMB_X15_Y1_N18
\inst1|cnt~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|cnt~0_combout\ = (\inst1|q[3]~2_combout\ & !\enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|q[3]~2_combout\,
	datad => \enable~input_o\,
	combout => \inst1|cnt~0_combout\);

-- Location: CLKCTRL_G19
\areset~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \areset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \areset~inputclkctrl_outclk\);

-- Location: LCCOMB_X15_Y1_N28
\inst1|q[3]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[3]~1_combout\ = (GLOBAL(\areset~inputclkctrl_outclk\) & ((\inst1|cnt~0_combout\))) # (!GLOBAL(\areset~inputclkctrl_outclk\) & (\inst1|q[3]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|q[3]~1_combout\,
	datac => \areset~inputclkctrl_outclk\,
	datad => \inst1|cnt~0_combout\,
	combout => \inst1|q[3]~1_combout\);

-- Location: LCCOMB_X15_Y1_N6
\inst1|cnt~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|cnt~3_combout\ = (\inst1|q[0]~14_combout\ & !\enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|q[0]~14_combout\,
	datad => \enable~input_o\,
	combout => \inst1|cnt~3_combout\);

-- Location: LCCOMB_X15_Y1_N4
\inst1|q[0]~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[0]~13_combout\ = (GLOBAL(\areset~inputclkctrl_outclk\) & ((\inst1|cnt~3_combout\))) # (!GLOBAL(\areset~inputclkctrl_outclk\) & (\inst1|q[0]~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|q[0]~13_combout\,
	datac => \areset~inputclkctrl_outclk\,
	datad => \inst1|cnt~3_combout\,
	combout => \inst1|q[0]~13_combout\);

-- Location: LCCOMB_X15_Y1_N26
\inst1|q[0]~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[0]~15_combout\ = \inst1|q[0]~13_combout\ $ (!\inst1|q[0]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|q[0]~13_combout\,
	datac => \inst1|q[0]~14_combout\,
	combout => \inst1|q[0]~15_combout\);

-- Location: LCCOMB_X16_Y1_N14
\inst1|inc_q~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|inc_q~0_combout\ = (\enable~input_o\ & \inst|windows~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~input_o\,
	datad => \inst|windows~combout\,
	combout => \inst1|inc_q~0_combout\);

-- Location: FF_X15_Y1_N27
\inst1|q[0]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|q[0]~15_combout\,
	clrn => \ALT_INV_areset~inputclkctrl_outclk\,
	ena => \inst1|inc_q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|q[0]~_emulated_q\);

-- Location: LCCOMB_X15_Y1_N12
\inst1|q[0]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[0]~14_combout\ = (\areset~input_o\ & (((\inst1|cnt~3_combout\)))) # (!\areset~input_o\ & (\inst1|q[0]~_emulated_q\ $ (((\inst1|q[0]~13_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|q[0]~_emulated_q\,
	datab => \inst1|cnt~3_combout\,
	datac => \inst1|q[0]~13_combout\,
	datad => \areset~input_o\,
	combout => \inst1|q[0]~14_combout\);

-- Location: LCCOMB_X15_Y1_N20
\inst1|cnt~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|cnt~2_combout\ = (\inst1|q[1]~10_combout\ & !\enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|q[1]~10_combout\,
	datad => \enable~input_o\,
	combout => \inst1|cnt~2_combout\);

-- Location: LCCOMB_X15_Y1_N10
\inst1|q[1]~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[1]~9_combout\ = (GLOBAL(\areset~inputclkctrl_outclk\) & ((\inst1|cnt~2_combout\))) # (!GLOBAL(\areset~inputclkctrl_outclk\) & (\inst1|q[1]~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|q[1]~9_combout\,
	datac => \areset~inputclkctrl_outclk\,
	datad => \inst1|cnt~2_combout\,
	combout => \inst1|q[1]~9_combout\);

-- Location: LCCOMB_X16_Y1_N10
\inst1|cnt~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|cnt~1_combout\ = (!\enable~input_o\ & \inst1|q[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \enable~input_o\,
	datad => \inst1|q[2]~6_combout\,
	combout => \inst1|cnt~1_combout\);

-- Location: LCCOMB_X16_Y1_N22
\inst1|q[2]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[2]~5_combout\ = (GLOBAL(\areset~inputclkctrl_outclk\) & ((\inst1|cnt~1_combout\))) # (!GLOBAL(\areset~inputclkctrl_outclk\) & (\inst1|q[2]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|q[2]~5_combout\,
	datac => \areset~inputclkctrl_outclk\,
	datad => \inst1|cnt~1_combout\,
	combout => \inst1|q[2]~5_combout\);

-- Location: LCCOMB_X16_Y1_N24
\inst1|Add0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|Add0~1_combout\ = (\inst1|q[1]~10_combout\ & \inst1|q[0]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|q[1]~10_combout\,
	datad => \inst1|q[0]~14_combout\,
	combout => \inst1|Add0~1_combout\);

-- Location: LCCOMB_X16_Y1_N30
\inst1|q[2]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[2]~7_combout\ = \inst1|q[2]~6_combout\ $ (\inst1|q[2]~5_combout\ $ (((\inst1|inc_q~0_combout\ & \inst1|Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|q[2]~6_combout\,
	datab => \inst1|inc_q~0_combout\,
	datac => \inst1|q[2]~5_combout\,
	datad => \inst1|Add0~1_combout\,
	combout => \inst1|q[2]~7_combout\);

-- Location: FF_X16_Y1_N31
\inst1|q[2]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|q[2]~7_combout\,
	clrn => \ALT_INV_areset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|q[2]~_emulated_q\);

-- Location: LCCOMB_X15_Y1_N0
\inst1|q[2]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[2]~6_combout\ = (\areset~input_o\ & (\inst1|cnt~1_combout\)) # (!\areset~input_o\ & ((\inst1|q[2]~_emulated_q\ $ (\inst1|q[2]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \areset~input_o\,
	datab => \inst1|cnt~1_combout\,
	datac => \inst1|q[2]~_emulated_q\,
	datad => \inst1|q[2]~5_combout\,
	combout => \inst1|q[2]~6_combout\);

-- Location: LCCOMB_X15_Y1_N24
\inst1|Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|Equal0~0_combout\ = (\inst1|q[3]~2_combout\ & (!\inst1|q[1]~10_combout\ & (\inst1|q[0]~14_combout\ & !\inst1|q[2]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|q[3]~2_combout\,
	datab => \inst1|q[1]~10_combout\,
	datac => \inst1|q[0]~14_combout\,
	datad => \inst1|q[2]~6_combout\,
	combout => \inst1|Equal0~0_combout\);

-- Location: LCCOMB_X15_Y1_N14
\inst1|q[1]~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[1]~11_combout\ = \inst1|q[1]~9_combout\ $ (((!\inst1|Equal0~0_combout\ & (\inst1|q[1]~10_combout\ $ (\inst1|q[0]~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|q[1]~10_combout\,
	datab => \inst1|q[1]~9_combout\,
	datac => \inst1|q[0]~14_combout\,
	datad => \inst1|Equal0~0_combout\,
	combout => \inst1|q[1]~11_combout\);

-- Location: FF_X15_Y1_N15
\inst1|q[1]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|q[1]~11_combout\,
	clrn => \ALT_INV_areset~inputclkctrl_outclk\,
	ena => \inst1|inc_q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|q[1]~_emulated_q\);

-- Location: LCCOMB_X15_Y1_N16
\inst1|q[1]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[1]~10_combout\ = (\areset~input_o\ & (\inst1|cnt~2_combout\)) # (!\areset~input_o\ & ((\inst1|q[1]~_emulated_q\ $ (\inst1|q[1]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \areset~input_o\,
	datab => \inst1|cnt~2_combout\,
	datac => \inst1|q[1]~_emulated_q\,
	datad => \inst1|q[1]~9_combout\,
	combout => \inst1|q[1]~10_combout\);

-- Location: LCCOMB_X15_Y1_N30
\inst1|Add0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|Add0~0_combout\ = (\inst1|q[0]~14_combout\ & (\inst1|q[1]~10_combout\ & \inst1|q[2]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|q[0]~14_combout\,
	datab => \inst1|q[1]~10_combout\,
	datad => \inst1|q[2]~6_combout\,
	combout => \inst1|Add0~0_combout\);

-- Location: LCCOMB_X15_Y1_N8
\inst1|q[3]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[3]~3_combout\ = \inst1|q[3]~1_combout\ $ (((!\inst1|Equal0~0_combout\ & (\inst1|q[3]~2_combout\ $ (\inst1|Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|q[3]~1_combout\,
	datab => \inst1|q[3]~2_combout\,
	datac => \inst1|Add0~0_combout\,
	datad => \inst1|Equal0~0_combout\,
	combout => \inst1|q[3]~3_combout\);

-- Location: FF_X15_Y1_N9
\inst1|q[3]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst1|q[3]~3_combout\,
	clrn => \ALT_INV_areset~inputclkctrl_outclk\,
	ena => \inst1|inc_q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|q[3]~_emulated_q\);

-- Location: LCCOMB_X15_Y1_N22
\inst1|q[3]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst1|q[3]~2_combout\ = (\areset~input_o\ & (\inst1|cnt~0_combout\)) # (!\areset~input_o\ & ((\inst1|q[3]~_emulated_q\ $ (\inst1|q[3]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \areset~input_o\,
	datab => \inst1|cnt~0_combout\,
	datac => \inst1|q[3]~_emulated_q\,
	datad => \inst1|q[3]~1_combout\,
	combout => \inst1|q[3]~2_combout\);

-- Location: LCCOMB_X17_Y1_N24
\inst2|reg~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|reg~0_combout\ = (!\enable~input_o\ & \inst2|q[3]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \enable~input_o\,
	datad => \inst2|q[3]~2_combout\,
	combout => \inst2|reg~0_combout\);

-- Location: LCCOMB_X17_Y1_N12
\inst2|q[3]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[3]~1_combout\ = (GLOBAL(\areset~inputclkctrl_outclk\) & ((\inst2|reg~0_combout\))) # (!GLOBAL(\areset~inputclkctrl_outclk\) & (\inst2|q[3]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|q[3]~1_combout\,
	datac => \areset~inputclkctrl_outclk\,
	datad => \inst2|reg~0_combout\,
	combout => \inst2|q[3]~1_combout\);

-- Location: LCCOMB_X17_Y1_N8
\inst2|q[3]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[3]~3_combout\ = \inst1|q[3]~2_combout\ $ (\inst2|q[3]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|q[3]~2_combout\,
	datad => \inst2|q[3]~1_combout\,
	combout => \inst2|q[3]~3_combout\);

-- Location: LCCOMB_X16_Y1_N26
\inst2|load_q~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|load_q~0_combout\ = (\enable~input_o\ & \inst|store~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~input_o\,
	datad => \inst|store~combout\,
	combout => \inst2|load_q~0_combout\);

-- Location: FF_X17_Y1_N9
\inst2|q[3]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst2|q[3]~3_combout\,
	clrn => \ALT_INV_areset~inputclkctrl_outclk\,
	ena => \inst2|load_q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|q[3]~_emulated_q\);

-- Location: LCCOMB_X17_Y1_N6
\inst2|q[3]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[3]~2_combout\ = (\areset~input_o\ & (\inst2|reg~0_combout\)) # (!\areset~input_o\ & ((\inst2|q[3]~_emulated_q\ $ (\inst2|q[3]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \areset~input_o\,
	datab => \inst2|reg~0_combout\,
	datac => \inst2|q[3]~_emulated_q\,
	datad => \inst2|q[3]~1_combout\,
	combout => \inst2|q[3]~2_combout\);

-- Location: LCCOMB_X17_Y1_N2
\inst2|reg~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|reg~1_combout\ = (\inst2|q[2]~6_combout\ & !\enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|q[2]~6_combout\,
	datac => \enable~input_o\,
	combout => \inst2|reg~1_combout\);

-- Location: LCCOMB_X17_Y1_N26
\inst2|q[2]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[2]~5_combout\ = (GLOBAL(\areset~inputclkctrl_outclk\) & ((\inst2|reg~1_combout\))) # (!GLOBAL(\areset~inputclkctrl_outclk\) & (\inst2|q[2]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|q[2]~5_combout\,
	datac => \areset~inputclkctrl_outclk\,
	datad => \inst2|reg~1_combout\,
	combout => \inst2|q[2]~5_combout\);

-- Location: LCCOMB_X17_Y1_N20
\inst2|q[2]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[2]~7_combout\ = \inst2|q[2]~5_combout\ $ (\inst1|q[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|q[2]~5_combout\,
	datad => \inst1|q[2]~6_combout\,
	combout => \inst2|q[2]~7_combout\);

-- Location: FF_X17_Y1_N21
\inst2|q[2]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst2|q[2]~7_combout\,
	clrn => \ALT_INV_areset~inputclkctrl_outclk\,
	ena => \inst2|load_q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|q[2]~_emulated_q\);

-- Location: LCCOMB_X17_Y1_N22
\inst2|q[2]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[2]~6_combout\ = (\areset~input_o\ & (\inst2|reg~1_combout\)) # (!\areset~input_o\ & ((\inst2|q[2]~5_combout\ $ (\inst2|q[2]~_emulated_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \areset~input_o\,
	datab => \inst2|reg~1_combout\,
	datac => \inst2|q[2]~5_combout\,
	datad => \inst2|q[2]~_emulated_q\,
	combout => \inst2|q[2]~6_combout\);

-- Location: LCCOMB_X17_Y1_N16
\inst2|reg~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|reg~2_combout\ = (\inst2|q[1]~10_combout\ & !\enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|q[1]~10_combout\,
	datac => \enable~input_o\,
	combout => \inst2|reg~2_combout\);

-- Location: LCCOMB_X17_Y1_N0
\inst2|q[1]~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[1]~9_combout\ = (GLOBAL(\areset~inputclkctrl_outclk\) & ((\inst2|reg~2_combout\))) # (!GLOBAL(\areset~inputclkctrl_outclk\) & (\inst2|q[1]~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|q[1]~9_combout\,
	datac => \areset~inputclkctrl_outclk\,
	datad => \inst2|reg~2_combout\,
	combout => \inst2|q[1]~9_combout\);

-- Location: LCCOMB_X17_Y1_N4
\inst2|q[1]~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[1]~11_combout\ = \inst2|q[1]~9_combout\ $ (\inst1|q[1]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|q[1]~9_combout\,
	datac => \inst1|q[1]~10_combout\,
	combout => \inst2|q[1]~11_combout\);

-- Location: FF_X17_Y1_N5
\inst2|q[1]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst2|q[1]~11_combout\,
	clrn => \ALT_INV_areset~inputclkctrl_outclk\,
	ena => \inst2|load_q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|q[1]~_emulated_q\);

-- Location: LCCOMB_X17_Y1_N18
\inst2|q[1]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[1]~10_combout\ = (\areset~input_o\ & (\inst2|reg~2_combout\)) # (!\areset~input_o\ & ((\inst2|q[1]~_emulated_q\ $ (\inst2|q[1]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \areset~input_o\,
	datab => \inst2|reg~2_combout\,
	datac => \inst2|q[1]~_emulated_q\,
	datad => \inst2|q[1]~9_combout\,
	combout => \inst2|q[1]~10_combout\);

-- Location: LCCOMB_X17_Y1_N10
\inst2|reg~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|reg~3_combout\ = (!\enable~input_o\ & \inst2|q[0]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \enable~input_o\,
	datad => \inst2|q[0]~14_combout\,
	combout => \inst2|reg~3_combout\);

-- Location: LCCOMB_X17_Y1_N14
\inst2|q[0]~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[0]~13_combout\ = (GLOBAL(\areset~inputclkctrl_outclk\) & ((\inst2|reg~3_combout\))) # (!GLOBAL(\areset~inputclkctrl_outclk\) & (\inst2|q[0]~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|q[0]~13_combout\,
	datac => \areset~inputclkctrl_outclk\,
	datad => \inst2|reg~3_combout\,
	combout => \inst2|q[0]~13_combout\);

-- Location: LCCOMB_X17_Y1_N28
\inst2|q[0]~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[0]~15_combout\ = \inst2|q[0]~13_combout\ $ (\inst1|q[0]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|q[0]~13_combout\,
	datac => \inst1|q[0]~14_combout\,
	combout => \inst2|q[0]~15_combout\);

-- Location: FF_X17_Y1_N29
\inst2|q[0]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst2|q[0]~15_combout\,
	clrn => \ALT_INV_areset~inputclkctrl_outclk\,
	ena => \inst2|load_q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|q[0]~_emulated_q\);

-- Location: LCCOMB_X17_Y1_N30
\inst2|q[0]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst2|q[0]~14_combout\ = (\areset~input_o\ & (\inst2|reg~3_combout\)) # (!\areset~input_o\ & ((\inst2|q[0]~13_combout\ $ (\inst2|q[0]~_emulated_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \areset~input_o\,
	datab => \inst2|reg~3_combout\,
	datac => \inst2|q[0]~13_combout\,
	datad => \inst2|q[0]~_emulated_q\,
	combout => \inst2|q[0]~14_combout\);

-- Location: LCCOMB_X20_Y1_N20
\inst|state[1]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|state\(1) = (\inst|current.load_s~q\) # (\inst|current.count_s~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|current.load_s~q\,
	datad => \inst|current.count_s~q\,
	combout => \inst|state\(1));

ww_reset <= \reset~output_o\;

ww_windows <= \windows~output_o\;

ww_store <= \store~output_o\;

ww_error <= \error~output_o\;

ww_ledred <= \ledred~output_o\;

ww_ledblue <= \ledblue~output_o\;

ww_ledgreen <= \ledgreen~output_o\;

ww_q_cnt(3) <= \q_cnt[3]~output_o\;

ww_q_cnt(2) <= \q_cnt[2]~output_o\;

ww_q_cnt(1) <= \q_cnt[1]~output_o\;

ww_q_cnt(0) <= \q_cnt[0]~output_o\;

ww_q_reg(3) <= \q_reg[3]~output_o\;

ww_q_reg(2) <= \q_reg[2]~output_o\;

ww_q_reg(1) <= \q_reg[1]~output_o\;

ww_q_reg(0) <= \q_reg[0]~output_o\;

ww_state(2) <= \state[2]~output_o\;

ww_state(1) <= \state[1]~output_o\;

ww_state(0) <= \state[0]~output_o\;
END structure;


