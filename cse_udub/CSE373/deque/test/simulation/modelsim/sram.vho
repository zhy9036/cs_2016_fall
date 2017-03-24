-- Copyright (C) 1991-2007 Altera Corporation
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
-- PROGRAM "Quartus II"
-- VERSION "Version 7.2 Build 151 09/26/2007 SJ Full Version"

-- DATE "01/27/2013 23:21:03"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE, cycloneii;
USE IEEE.std_logic_1164.all;
USE cycloneii.cycloneii_components.all;

ENTITY 	sram IS
    PORT (
	clk : IN std_logic;
	key : IN std_logic_vector(2 DOWNTO 0);
	ledr : OUT std_logic_vector(7 DOWNTO 0);
	ledg : OUT std_logic_vector(7 DOWNTO 0);
	sram_addr : OUT std_logic_vector(17 DOWNTO 0);
	sram_oe_n : OUT std_logic;
	sram_we_n : OUT std_logic;
	sram_dq : INOUT std_logic_vector(15 DOWNTO 0);
	sram_ce_n : OUT std_logic;
	sram_lb_n : OUT std_logic;
	sram_ub_n : OUT std_logic
	);
END sram;

ARCHITECTURE structure OF sram IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_key : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_ledr : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ledg : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_sram_addr : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_sram_oe_n : std_logic;
SIGNAL ww_sram_we_n : std_logic;
SIGNAL ww_sram_ce_n : std_logic;
SIGNAL ww_sram_lb_n : std_logic;
SIGNAL ww_sram_ub_n : std_logic;
SIGNAL \state_reg.state_read1~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \device1|Add0~212_combout\ : std_logic;
SIGNAL \device1|Equal0~179_combout\ : std_logic;
SIGNAL \Equal0~194_combout\ : std_logic;
SIGNAL \Equal0~196_combout\ : std_logic;
SIGNAL \sram_dq[0]~15\ : std_logic;
SIGNAL \sram_dq[1]~14\ : std_logic;
SIGNAL \sram_dq[2]~13\ : std_logic;
SIGNAL \sram_dq[3]~12\ : std_logic;
SIGNAL \sram_dq[4]~11\ : std_logic;
SIGNAL \sram_dq[5]~10\ : std_logic;
SIGNAL \sram_dq[6]~9\ : std_logic;
SIGNAL \sram_dq[7]~8\ : std_logic;
SIGNAL \sram_dq[8]~7\ : std_logic;
SIGNAL \sram_dq[9]~6\ : std_logic;
SIGNAL \sram_dq[10]~5\ : std_logic;
SIGNAL \sram_dq[11]~4\ : std_logic;
SIGNAL \sram_dq[12]~3\ : std_logic;
SIGNAL \sram_dq[13]~2\ : std_logic;
SIGNAL \sram_dq[14]~1\ : std_logic;
SIGNAL \sram_dq[15]~0\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \Add0~342_combout\ : std_logic;
SIGNAL \Add0~343\ : std_logic;
SIGNAL \Add0~344_combout\ : std_logic;
SIGNAL \Selector21~15_combout\ : std_logic;
SIGNAL \Selector2~105_combout\ : std_logic;
SIGNAL \state_reg.state_read2~regout\ : std_logic;
SIGNAL \device1|Add0~192_combout\ : std_logic;
SIGNAL \state_reg.state_read1~clkctrl_outclk\ : std_logic;
SIGNAL \device1|Add0~193\ : std_logic;
SIGNAL \device1|Add0~194_combout\ : std_logic;
SIGNAL \device1|Add0~195\ : std_logic;
SIGNAL \device1|Add0~196_combout\ : std_logic;
SIGNAL \device1|Add0~197\ : std_logic;
SIGNAL \device1|Add0~199\ : std_logic;
SIGNAL \device1|Add0~200_combout\ : std_logic;
SIGNAL \device1|count_next[4]~337_combout\ : std_logic;
SIGNAL \device1|Add0~201\ : std_logic;
SIGNAL \device1|Add0~203\ : std_logic;
SIGNAL \device1|Add0~204_combout\ : std_logic;
SIGNAL \device1|count_next[6]~336_combout\ : std_logic;
SIGNAL \device1|Add0~202_combout\ : std_logic;
SIGNAL \device1|Equal0~180_combout\ : std_logic;
SIGNAL \device1|Add0~198_combout\ : std_logic;
SIGNAL \device1|Equal0~181_combout\ : std_logic;
SIGNAL \device1|Add0~205\ : std_logic;
SIGNAL \device1|Add0~206_combout\ : std_logic;
SIGNAL \device1|Add0~207\ : std_logic;
SIGNAL \device1|Add0~208_combout\ : std_logic;
SIGNAL \device1|count_next[8]~335_combout\ : std_logic;
SIGNAL \device1|Add0~209\ : std_logic;
SIGNAL \device1|Add0~210_combout\ : std_logic;
SIGNAL \device1|count_next[9]~334_combout\ : std_logic;
SIGNAL \device1|Add0~211\ : std_logic;
SIGNAL \device1|Add0~213\ : std_logic;
SIGNAL \device1|Add0~214_combout\ : std_logic;
SIGNAL \device1|Add0~215\ : std_logic;
SIGNAL \device1|Add0~217\ : std_logic;
SIGNAL \device1|Add0~218_combout\ : std_logic;
SIGNAL \device1|Add0~219\ : std_logic;
SIGNAL \device1|Add0~220_combout\ : std_logic;
SIGNAL \device1|count_next[14]~333_combout\ : std_logic;
SIGNAL \device1|Add0~221\ : std_logic;
SIGNAL \device1|Add0~222_combout\ : std_logic;
SIGNAL \device1|count_next[15]~332_combout\ : std_logic;
SIGNAL \device1|Add0~216_combout\ : std_logic;
SIGNAL \device1|Equal0~178_combout\ : std_logic;
SIGNAL \device1|Equal0~182_combout\ : std_logic;
SIGNAL \Selector1~134_combout\ : std_logic;
SIGNAL \Selector1~135_combout\ : std_logic;
SIGNAL \Selector1~136_combout\ : std_logic;
SIGNAL \state_reg.state_read1~regout\ : std_logic;
SIGNAL \Selector4~15_combout\ : std_logic;
SIGNAL \state_reg.state_write2~regout\ : std_logic;
SIGNAL \Selector3~138_combout\ : std_logic;
SIGNAL \Selector3~139_combout\ : std_logic;
SIGNAL \state_reg.state_write1~regout\ : std_logic;
SIGNAL \device0|addr_reg[17]~612_combout\ : std_logic;
SIGNAL \device0|state_reg.state_idle~regout\ : std_logic;
SIGNAL \Selector0~70_combout\ : std_logic;
SIGNAL \count_reg[13]~667_combout\ : std_logic;
SIGNAL \Add0~345\ : std_logic;
SIGNAL \Add0~346_combout\ : std_logic;
SIGNAL \Selector20~15_combout\ : std_logic;
SIGNAL \Add0~347\ : std_logic;
SIGNAL \Add0~348_combout\ : std_logic;
SIGNAL \Selector19~15_combout\ : std_logic;
SIGNAL \Add0~349\ : std_logic;
SIGNAL \Add0~350_combout\ : std_logic;
SIGNAL \Selector18~15_combout\ : std_logic;
SIGNAL \Add0~351\ : std_logic;
SIGNAL \Add0~352_combout\ : std_logic;
SIGNAL \Selector17~15_combout\ : std_logic;
SIGNAL \Add0~353\ : std_logic;
SIGNAL \Add0~354_combout\ : std_logic;
SIGNAL \Selector16~15_combout\ : std_logic;
SIGNAL \Add0~355\ : std_logic;
SIGNAL \Add0~356_combout\ : std_logic;
SIGNAL \Selector15~15_combout\ : std_logic;
SIGNAL \Add0~357\ : std_logic;
SIGNAL \Add0~358_combout\ : std_logic;
SIGNAL \Selector14~15_combout\ : std_logic;
SIGNAL \Add0~359\ : std_logic;
SIGNAL \Add0~360_combout\ : std_logic;
SIGNAL \Selector13~15_combout\ : std_logic;
SIGNAL \Add0~361\ : std_logic;
SIGNAL \Add0~362_combout\ : std_logic;
SIGNAL \Selector12~15_combout\ : std_logic;
SIGNAL \Add0~363\ : std_logic;
SIGNAL \Add0~364_combout\ : std_logic;
SIGNAL \Selector11~15_combout\ : std_logic;
SIGNAL \Add0~365\ : std_logic;
SIGNAL \Add0~366_combout\ : std_logic;
SIGNAL \Selector10~15_combout\ : std_logic;
SIGNAL \Add0~367\ : std_logic;
SIGNAL \Add0~368_combout\ : std_logic;
SIGNAL \Add0~369\ : std_logic;
SIGNAL \Add0~370_combout\ : std_logic;
SIGNAL \Equal0~197_combout\ : std_logic;
SIGNAL \Equal0~195_combout\ : std_logic;
SIGNAL \Selector7~15_combout\ : std_logic;
SIGNAL \Add0~371\ : std_logic;
SIGNAL \Add0~372_combout\ : std_logic;
SIGNAL \Selector6~15_combout\ : std_logic;
SIGNAL \Add0~373\ : std_logic;
SIGNAL \Add0~374_combout\ : std_logic;
SIGNAL \Selector5~15_combout\ : std_logic;
SIGNAL \Add0~375\ : std_logic;
SIGNAL \Add0~376_combout\ : std_logic;
SIGNAL \Equal0~198_combout\ : std_logic;
SIGNAL \Equal0~199_combout\ : std_logic;
SIGNAL \Selector0~71_combout\ : std_logic;
SIGNAL \state_reg.state_idle~regout\ : std_logic;
SIGNAL \Selector22~15_combout\ : std_logic;
SIGNAL \device0|we_next~23_combout\ : std_logic;
SIGNAL \device0|Selector0~30_combout\ : std_logic;
SIGNAL \device0|Selector0~31_combout\ : std_logic;
SIGNAL \device0|tri_reg~regout\ : std_logic;
SIGNAL \device0|data_write_reg[1]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[2]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[3]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[4]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[5]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[6]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[7]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[9]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[10]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[12]~feeder_combout\ : std_logic;
SIGNAL \Selector9~15_combout\ : std_logic;
SIGNAL \Selector8~15_combout\ : std_logic;
SIGNAL \device0|data_write_reg[14]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[8]~feeder_combout\ : std_logic;
SIGNAL \device0|oe_next~8_combout\ : std_logic;
SIGNAL \device0|oe_reg~regout\ : std_logic;
SIGNAL \device0|data_read_reg[9]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[10]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[13]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[14]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[15]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[0]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[1]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[1]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[2]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[3]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[4]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[5]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[6]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[7]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[9]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[10]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[12]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[14]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[16]~feeder_combout\ : std_logic;
SIGNAL \device0|we_reg~regout\ : std_logic;
SIGNAL \device1|count\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \device0|addr_reg\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \device0|data_read_reg\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \device0|data_write_reg\ : std_logic_vector(15 DOWNTO 0);
SIGNAL count_reg : std_logic_vector(17 DOWNTO 0);
SIGNAL \key~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \device0|ALT_INV_oe_reg~regout\ : std_logic;
SIGNAL \device0|ALT_INV_we_reg~regout\ : std_logic;
SIGNAL \ALT_INV_key~combout\ : std_logic_vector(0 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_key <= key;
ledr <= ww_ledr;
ledg <= ww_ledg;
sram_addr <= ww_sram_addr;
sram_oe_n <= ww_sram_oe_n;
sram_we_n <= ww_sram_we_n;
sram_ce_n <= ww_sram_ce_n;
sram_lb_n <= ww_sram_lb_n;
sram_ub_n <= ww_sram_ub_n;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\state_reg.state_read1~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \state_reg.state_read1~regout\);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\device0|ALT_INV_oe_reg~regout\ <= NOT \device0|oe_reg~regout\;
\device0|ALT_INV_we_reg~regout\ <= NOT \device0|we_reg~regout\;
\ALT_INV_key~combout\(0) <= NOT \key~combout\(0);

\device1|Add0~212\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~212_combout\ = \device1|count\(10) & (\device1|Add0~211\ $ GND) # !\device1|count\(10) & !\device1|Add0~211\ & VCC
-- \device1|Add0~213\ = CARRY(\device1|count\(10) & !\device1|Add0~211\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(10),
	datad => VCC,
	cin => \device1|Add0~211\,
	combout => \device1|Add0~212_combout\,
	cout => \device1|Add0~213\);

\device1|count[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~212_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(10));

\device1|Equal0~179\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Equal0~179_combout\ = !\device1|count\(10) & \device1|count\(8) & \device1|count\(9) & !\device1|count\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(10),
	datab => \device1|count\(8),
	datac => \device1|count\(9),
	datad => \device1|count\(11),
	combout => \device1|Equal0~179_combout\);

\Equal0~194\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~194_combout\ = \Add0~348_combout\ # \Add0~360_combout\ # \Add0~346_combout\ # \Add0~366_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~348_combout\,
	datab => \Add0~360_combout\,
	datac => \Add0~346_combout\,
	datad => \Add0~366_combout\,
	combout => \Equal0~194_combout\);

\Equal0~196\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~196_combout\ = \Add0~344_combout\ # \Add0~350_combout\ # \Add0~342_combout\ # \Add0~354_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~344_combout\,
	datab => \Add0~350_combout\,
	datac => \Add0~342_combout\,
	datad => \Add0~354_combout\,
	combout => \Equal0~196_combout\);

\key[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key(1),
	combout => \key~combout\(1));

\sram_dq[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(0),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(0),
	combout => \sram_dq[0]~15\);

\sram_dq[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(1),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(1),
	combout => \sram_dq[1]~14\);

\sram_dq[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(2),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(2),
	combout => \sram_dq[2]~13\);

\sram_dq[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(3),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(3),
	combout => \sram_dq[3]~12\);

\sram_dq[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(4),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(4),
	combout => \sram_dq[4]~11\);

\sram_dq[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(5),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(5),
	combout => \sram_dq[5]~10\);

\sram_dq[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(6),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(6),
	combout => \sram_dq[6]~9\);

\sram_dq[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(7),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(7),
	combout => \sram_dq[7]~8\);

\sram_dq[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(8),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(8),
	combout => \sram_dq[8]~7\);

\sram_dq[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(9),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(9),
	combout => \sram_dq[9]~6\);

\sram_dq[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(10),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(10),
	combout => \sram_dq[10]~5\);

\sram_dq[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(11),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(11),
	combout => \sram_dq[11]~4\);

\sram_dq[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(12),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(12),
	combout => \sram_dq[12]~3\);

\sram_dq[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(13),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(13),
	combout => \sram_dq[13]~2\);

\sram_dq[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(14),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(14),
	combout => \sram_dq[14]~1\);

\sram_dq[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_write_reg\(15),
	oe => \device0|tri_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => sram_dq(15),
	combout => \sram_dq[15]~0\);

\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "falling edge")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

\Add0~342\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~342_combout\ = count_reg(0) $ VCC
-- \Add0~343\ = CARRY(count_reg(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_reg(0),
	datad => VCC,
	combout => \Add0~342_combout\,
	cout => \Add0~343\);

\Add0~344\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~344_combout\ = count_reg(1) & !\Add0~343\ # !count_reg(1) & (\Add0~343\ # GND)
-- \Add0~345\ = CARRY(!\Add0~343\ # !count_reg(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(1),
	datad => VCC,
	cin => \Add0~343\,
	combout => \Add0~344_combout\,
	cout => \Add0~345\);

\Selector21~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector21~15_combout\ = \Add0~344_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~344_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector21~15_combout\);

\key[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key(0),
	combout => \key~combout\(0));

\key[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_key(2),
	combout => \key~combout\(2));

\Selector2~105\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~105_combout\ = \state_reg.state_read1~regout\ # \state_reg.state_read2~regout\ & (\device0|state_reg.state_idle~regout\ # !\device1|Equal0~182_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|Equal0~182_combout\,
	datab => \device0|state_reg.state_idle~regout\,
	datac => \state_reg.state_read2~regout\,
	datad => \state_reg.state_read1~regout\,
	combout => \Selector2~105_combout\);

\state_reg.state_read2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector2~105_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state_reg.state_read2~regout\);

\device1|Add0~192\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~192_combout\ = \device1|count\(0) $ VCC
-- \device1|Add0~193\ = CARRY(\device1|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(0),
	datad => VCC,
	combout => \device1|Add0~192_combout\,
	cout => \device1|Add0~193\);

\state_reg.state_read1~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "falling edge")
-- pragma translate_on
PORT MAP (
	inclk => \state_reg.state_read1~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \state_reg.state_read1~clkctrl_outclk\);

\device1|count[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~192_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(0));

\device1|Add0~194\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~194_combout\ = \device1|count\(1) & !\device1|Add0~193\ # !\device1|count\(1) & (\device1|Add0~193\ # GND)
-- \device1|Add0~195\ = CARRY(!\device1|Add0~193\ # !\device1|count\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(1),
	datad => VCC,
	cin => \device1|Add0~193\,
	combout => \device1|Add0~194_combout\,
	cout => \device1|Add0~195\);

\device1|count[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~194_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(1));

\device1|Add0~196\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~196_combout\ = \device1|count\(2) & (\device1|Add0~195\ $ GND) # !\device1|count\(2) & !\device1|Add0~195\ & VCC
-- \device1|Add0~197\ = CARRY(\device1|count\(2) & !\device1|Add0~195\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(2),
	datad => VCC,
	cin => \device1|Add0~195\,
	combout => \device1|Add0~196_combout\,
	cout => \device1|Add0~197\);

\device1|count[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~196_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(2));

\device1|Add0~198\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~198_combout\ = \device1|count\(3) & !\device1|Add0~197\ # !\device1|count\(3) & (\device1|Add0~197\ # GND)
-- \device1|Add0~199\ = CARRY(!\device1|Add0~197\ # !\device1|count\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(3),
	datad => VCC,
	cin => \device1|Add0~197\,
	combout => \device1|Add0~198_combout\,
	cout => \device1|Add0~199\);

\device1|Add0~200\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~200_combout\ = \device1|count\(4) & (\device1|Add0~199\ $ GND) # !\device1|count\(4) & !\device1|Add0~199\ & VCC
-- \device1|Add0~201\ = CARRY(\device1|count\(4) & !\device1|Add0~199\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(4),
	datad => VCC,
	cin => \device1|Add0~199\,
	combout => \device1|Add0~200_combout\,
	cout => \device1|Add0~201\);

\device1|count_next[4]~337\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[4]~337_combout\ = !\device1|Equal0~182_combout\ & \device1|Add0~200_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~182_combout\,
	datad => \device1|Add0~200_combout\,
	combout => \device1|count_next[4]~337_combout\);

\device1|count[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[4]~337_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(4));

\device1|Add0~202\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~202_combout\ = \device1|count\(5) & !\device1|Add0~201\ # !\device1|count\(5) & (\device1|Add0~201\ # GND)
-- \device1|Add0~203\ = CARRY(!\device1|Add0~201\ # !\device1|count\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(5),
	datad => VCC,
	cin => \device1|Add0~201\,
	combout => \device1|Add0~202_combout\,
	cout => \device1|Add0~203\);

\device1|Add0~204\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~204_combout\ = \device1|count\(6) & (\device1|Add0~203\ $ GND) # !\device1|count\(6) & !\device1|Add0~203\ & VCC
-- \device1|Add0~205\ = CARRY(\device1|count\(6) & !\device1|Add0~203\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(6),
	datad => VCC,
	cin => \device1|Add0~203\,
	combout => \device1|Add0~204_combout\,
	cout => \device1|Add0~205\);

\device1|count_next[6]~336\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[6]~336_combout\ = !\device1|Equal0~182_combout\ & \device1|Add0~204_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~182_combout\,
	datad => \device1|Add0~204_combout\,
	combout => \device1|count_next[6]~336_combout\);

\device1|count[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[6]~336_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(6));

\device1|count[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~202_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(5));

\device1|Equal0~180\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Equal0~180_combout\ = !\device1|count\(7) & \device1|count\(6) & !\device1|count\(4) & !\device1|count\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(7),
	datab => \device1|count\(6),
	datac => \device1|count\(4),
	datad => \device1|count\(5),
	combout => \device1|Equal0~180_combout\);

\device1|count[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~198_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(3));

\device1|Equal0~181\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Equal0~181_combout\ = \device1|count\(0) & \device1|count\(2) & \device1|count\(3) & \device1|count\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(0),
	datab => \device1|count\(2),
	datac => \device1|count\(3),
	datad => \device1|count\(1),
	combout => \device1|Equal0~181_combout\);

\device1|Add0~206\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~206_combout\ = \device1|count\(7) & !\device1|Add0~205\ # !\device1|count\(7) & (\device1|Add0~205\ # GND)
-- \device1|Add0~207\ = CARRY(!\device1|Add0~205\ # !\device1|count\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(7),
	datad => VCC,
	cin => \device1|Add0~205\,
	combout => \device1|Add0~206_combout\,
	cout => \device1|Add0~207\);

\device1|count[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~206_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(7));

\device1|Add0~208\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~208_combout\ = \device1|count\(8) & (\device1|Add0~207\ $ GND) # !\device1|count\(8) & !\device1|Add0~207\ & VCC
-- \device1|Add0~209\ = CARRY(\device1|count\(8) & !\device1|Add0~207\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(8),
	datad => VCC,
	cin => \device1|Add0~207\,
	combout => \device1|Add0~208_combout\,
	cout => \device1|Add0~209\);

\device1|count_next[8]~335\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[8]~335_combout\ = !\device1|Equal0~182_combout\ & \device1|Add0~208_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~182_combout\,
	datad => \device1|Add0~208_combout\,
	combout => \device1|count_next[8]~335_combout\);

\device1|count[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[8]~335_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(8));

\device1|Add0~210\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~210_combout\ = \device1|count\(9) & !\device1|Add0~209\ # !\device1|count\(9) & (\device1|Add0~209\ # GND)
-- \device1|Add0~211\ = CARRY(!\device1|Add0~209\ # !\device1|count\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(9),
	datad => VCC,
	cin => \device1|Add0~209\,
	combout => \device1|Add0~210_combout\,
	cout => \device1|Add0~211\);

\device1|count_next[9]~334\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[9]~334_combout\ = !\device1|Equal0~182_combout\ & \device1|Add0~210_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~182_combout\,
	datad => \device1|Add0~210_combout\,
	combout => \device1|count_next[9]~334_combout\);

\device1|count[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[9]~334_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(9));

\device1|Add0~214\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~214_combout\ = \device1|count\(11) & !\device1|Add0~213\ # !\device1|count\(11) & (\device1|Add0~213\ # GND)
-- \device1|Add0~215\ = CARRY(!\device1|Add0~213\ # !\device1|count\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(11),
	datad => VCC,
	cin => \device1|Add0~213\,
	combout => \device1|Add0~214_combout\,
	cout => \device1|Add0~215\);

\device1|count[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~214_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(11));

\device1|Add0~216\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~216_combout\ = \device1|count\(12) & (\device1|Add0~215\ $ GND) # !\device1|count\(12) & !\device1|Add0~215\ & VCC
-- \device1|Add0~217\ = CARRY(\device1|count\(12) & !\device1|Add0~215\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(12),
	datad => VCC,
	cin => \device1|Add0~215\,
	combout => \device1|Add0~216_combout\,
	cout => \device1|Add0~217\);

\device1|Add0~218\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~218_combout\ = \device1|count\(13) & !\device1|Add0~217\ # !\device1|count\(13) & (\device1|Add0~217\ # GND)
-- \device1|Add0~219\ = CARRY(!\device1|Add0~217\ # !\device1|count\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(13),
	datad => VCC,
	cin => \device1|Add0~217\,
	combout => \device1|Add0~218_combout\,
	cout => \device1|Add0~219\);

\device1|count[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~218_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(13));

\device1|Add0~220\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~220_combout\ = \device1|count\(14) & (\device1|Add0~219\ $ GND) # !\device1|count\(14) & !\device1|Add0~219\ & VCC
-- \device1|Add0~221\ = CARRY(\device1|count\(14) & !\device1|Add0~219\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(14),
	datad => VCC,
	cin => \device1|Add0~219\,
	combout => \device1|Add0~220_combout\,
	cout => \device1|Add0~221\);

\device1|count_next[14]~333\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[14]~333_combout\ = !\device1|Equal0~182_combout\ & \device1|Add0~220_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~182_combout\,
	datad => \device1|Add0~220_combout\,
	combout => \device1|count_next[14]~333_combout\);

\device1|count[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[14]~333_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(14));

\device1|Add0~222\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~222_combout\ = \device1|count\(15) $ \device1|Add0~221\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(15),
	cin => \device1|Add0~221\,
	combout => \device1|Add0~222_combout\);

\device1|count_next[15]~332\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[15]~332_combout\ = !\device1|Equal0~182_combout\ & \device1|Add0~222_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~182_combout\,
	datad => \device1|Add0~222_combout\,
	combout => \device1|count_next[15]~332_combout\);

\device1|count[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[15]~332_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(15));

\device1|count[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~216_combout\,
	aclr => \state_reg.state_read1~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(12));

\device1|Equal0~178\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Equal0~178_combout\ = \device1|count\(14) & !\device1|count\(13) & \device1|count\(15) & !\device1|count\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(14),
	datab => \device1|count\(13),
	datac => \device1|count\(15),
	datad => \device1|count\(12),
	combout => \device1|Equal0~178_combout\);

\device1|Equal0~182\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Equal0~182_combout\ = \device1|Equal0~179_combout\ & \device1|Equal0~180_combout\ & \device1|Equal0~181_combout\ & \device1|Equal0~178_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|Equal0~179_combout\,
	datab => \device1|Equal0~180_combout\,
	datac => \device1|Equal0~181_combout\,
	datad => \device1|Equal0~178_combout\,
	combout => \device1|Equal0~182_combout\);

\Selector1~134\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~134_combout\ = !\device0|state_reg.state_idle~regout\ & \state_reg.state_read2~regout\ & \device1|Equal0~182_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device0|state_reg.state_idle~regout\,
	datac => \state_reg.state_read2~regout\,
	datad => \device1|Equal0~182_combout\,
	combout => \Selector1~134_combout\);

\Selector1~135\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~135_combout\ = \key~combout\(2) & !\state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \key~combout\(2),
	datad => \state_reg.state_idle~regout\,
	combout => \Selector1~135_combout\);

\Selector1~136\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~136_combout\ = \key~combout\(1) & \Selector1~134_combout\ & (\Equal0~199_combout\) # !\key~combout\(1) & (\Selector1~135_combout\ # \Selector1~134_combout\ & \Equal0~199_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \Selector1~134_combout\,
	datac => \Selector1~135_combout\,
	datad => \Equal0~199_combout\,
	combout => \Selector1~136_combout\);

\state_reg.state_read1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector1~136_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state_reg.state_read1~regout\);

\Selector4~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~15_combout\ = \state_reg.state_write1~regout\ # \device0|state_reg.state_idle~regout\ & \state_reg.state_write2~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device0|state_reg.state_idle~regout\,
	datac => \state_reg.state_write2~regout\,
	datad => \state_reg.state_write1~regout\,
	combout => \Selector4~15_combout\);

\state_reg.state_write2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector4~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state_reg.state_write2~regout\);

\Selector3~138\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~138_combout\ = \state_reg.state_write2~regout\ & !\device0|state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state_reg.state_write2~regout\,
	datad => \device0|state_reg.state_idle~regout\,
	combout => \Selector3~138_combout\);

\Selector3~139\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~139_combout\ = \state_reg.state_idle~regout\ & (\Selector3~138_combout\ & \Equal0~199_combout\) # !\state_reg.state_idle~regout\ & (\Selector3~138_combout\ & \Equal0~199_combout\ # !\key~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datab => \key~combout\(2),
	datac => \Selector3~138_combout\,
	datad => \Equal0~199_combout\,
	combout => \Selector3~139_combout\);

\state_reg.state_write1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector3~139_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state_reg.state_write1~regout\);

\device0|addr_reg[17]~612\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[17]~612_combout\ = !\device0|state_reg.state_idle~regout\ & (\state_reg.state_read1~regout\ # \state_reg.state_write1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state_reg.state_read1~regout\,
	datac => \device0|state_reg.state_idle~regout\,
	datad => \state_reg.state_write1~regout\,
	combout => \device0|addr_reg[17]~612_combout\);

\device0|state_reg.state_idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[17]~612_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|state_reg.state_idle~regout\);

\Selector0~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~70_combout\ = \device0|state_reg.state_idle~regout\ # !\state_reg.state_write2~regout\ & (!\device1|Equal0~182_combout\ # !\state_reg.state_read2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_read2~regout\,
	datab => \device0|state_reg.state_idle~regout\,
	datac => \state_reg.state_write2~regout\,
	datad => \device1|Equal0~182_combout\,
	combout => \Selector0~70_combout\);

\count_reg[13]~667\ : cycloneii_lcell_comb
-- Equation(s):
-- \count_reg[13]~667_combout\ = !\state_reg.state_idle~regout\ & (!\key~combout\(2) # !\key~combout\(1)) # !\Selector0~70_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \state_reg.state_idle~regout\,
	datac => \key~combout\(2),
	datad => \Selector0~70_combout\,
	combout => \count_reg[13]~667_combout\);

\count_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector21~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(1));

\Add0~346\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~346_combout\ = count_reg(2) & (\Add0~345\ $ GND) # !count_reg(2) & !\Add0~345\ & VCC
-- \Add0~347\ = CARRY(count_reg(2) & !\Add0~345\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(2),
	datad => VCC,
	cin => \Add0~345\,
	combout => \Add0~346_combout\,
	cout => \Add0~347\);

\Selector20~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector20~15_combout\ = \Add0~346_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~346_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector20~15_combout\);

\count_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector20~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(2));

\Add0~348\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~348_combout\ = count_reg(3) & !\Add0~347\ # !count_reg(3) & (\Add0~347\ # GND)
-- \Add0~349\ = CARRY(!\Add0~347\ # !count_reg(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(3),
	datad => VCC,
	cin => \Add0~347\,
	combout => \Add0~348_combout\,
	cout => \Add0~349\);

\Selector19~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector19~15_combout\ = \Add0~348_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~348_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector19~15_combout\);

\count_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector19~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(3));

\Add0~350\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~350_combout\ = count_reg(4) & (\Add0~349\ $ GND) # !count_reg(4) & !\Add0~349\ & VCC
-- \Add0~351\ = CARRY(count_reg(4) & !\Add0~349\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(4),
	datad => VCC,
	cin => \Add0~349\,
	combout => \Add0~350_combout\,
	cout => \Add0~351\);

\Selector18~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector18~15_combout\ = \Add0~350_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~350_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector18~15_combout\);

\count_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector18~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(4));

\Add0~352\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~352_combout\ = count_reg(5) & !\Add0~351\ # !count_reg(5) & (\Add0~351\ # GND)
-- \Add0~353\ = CARRY(!\Add0~351\ # !count_reg(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(5),
	datad => VCC,
	cin => \Add0~351\,
	combout => \Add0~352_combout\,
	cout => \Add0~353\);

\Selector17~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector17~15_combout\ = \Add0~352_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~352_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector17~15_combout\);

\count_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector17~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(5));

\Add0~354\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~354_combout\ = count_reg(6) & (\Add0~353\ $ GND) # !count_reg(6) & !\Add0~353\ & VCC
-- \Add0~355\ = CARRY(count_reg(6) & !\Add0~353\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(6),
	datad => VCC,
	cin => \Add0~353\,
	combout => \Add0~354_combout\,
	cout => \Add0~355\);

\Selector16~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector16~15_combout\ = \Add0~354_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~354_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector16~15_combout\);

\count_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector16~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(6));

\Add0~356\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~356_combout\ = count_reg(7) & !\Add0~355\ # !count_reg(7) & (\Add0~355\ # GND)
-- \Add0~357\ = CARRY(!\Add0~355\ # !count_reg(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(7),
	datad => VCC,
	cin => \Add0~355\,
	combout => \Add0~356_combout\,
	cout => \Add0~357\);

\Selector15~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector15~15_combout\ = \Add0~356_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~356_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector15~15_combout\);

\count_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector15~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(7));

\Add0~358\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~358_combout\ = count_reg(8) & (\Add0~357\ $ GND) # !count_reg(8) & !\Add0~357\ & VCC
-- \Add0~359\ = CARRY(count_reg(8) & !\Add0~357\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(8),
	datad => VCC,
	cin => \Add0~357\,
	combout => \Add0~358_combout\,
	cout => \Add0~359\);

\Selector14~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector14~15_combout\ = \Add0~358_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~358_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector14~15_combout\);

\count_reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector14~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(8));

\Add0~360\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~360_combout\ = count_reg(9) & !\Add0~359\ # !count_reg(9) & (\Add0~359\ # GND)
-- \Add0~361\ = CARRY(!\Add0~359\ # !count_reg(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(9),
	datad => VCC,
	cin => \Add0~359\,
	combout => \Add0~360_combout\,
	cout => \Add0~361\);

\Selector13~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector13~15_combout\ = \state_reg.state_idle~regout\ & \Add0~360_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state_reg.state_idle~regout\,
	datad => \Add0~360_combout\,
	combout => \Selector13~15_combout\);

\count_reg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector13~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(9));

\Add0~362\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~362_combout\ = count_reg(10) & (\Add0~361\ $ GND) # !count_reg(10) & !\Add0~361\ & VCC
-- \Add0~363\ = CARRY(count_reg(10) & !\Add0~361\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(10),
	datad => VCC,
	cin => \Add0~361\,
	combout => \Add0~362_combout\,
	cout => \Add0~363\);

\Selector12~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector12~15_combout\ = \Add0~362_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~362_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector12~15_combout\);

\count_reg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector12~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(10));

\Add0~364\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~364_combout\ = count_reg(11) & !\Add0~363\ # !count_reg(11) & (\Add0~363\ # GND)
-- \Add0~365\ = CARRY(!\Add0~363\ # !count_reg(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(11),
	datad => VCC,
	cin => \Add0~363\,
	combout => \Add0~364_combout\,
	cout => \Add0~365\);

\Selector11~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector11~15_combout\ = \Add0~364_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~364_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector11~15_combout\);

\count_reg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector11~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(11));

\Add0~366\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~366_combout\ = count_reg(12) & (\Add0~365\ $ GND) # !count_reg(12) & !\Add0~365\ & VCC
-- \Add0~367\ = CARRY(count_reg(12) & !\Add0~365\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(12),
	datad => VCC,
	cin => \Add0~365\,
	combout => \Add0~366_combout\,
	cout => \Add0~367\);

\Selector10~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector10~15_combout\ = \state_reg.state_idle~regout\ & \Add0~366_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state_reg.state_idle~regout\,
	datad => \Add0~366_combout\,
	combout => \Selector10~15_combout\);

\count_reg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector10~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(12));

\Add0~368\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~368_combout\ = count_reg(13) & !\Add0~367\ # !count_reg(13) & (\Add0~367\ # GND)
-- \Add0~369\ = CARRY(!\Add0~367\ # !count_reg(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_reg(13),
	datad => VCC,
	cin => \Add0~367\,
	combout => \Add0~368_combout\,
	cout => \Add0~369\);

\Add0~370\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~370_combout\ = count_reg(14) & (\Add0~369\ $ GND) # !count_reg(14) & !\Add0~369\ & VCC
-- \Add0~371\ = CARRY(count_reg(14) & !\Add0~369\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_reg(14),
	datad => VCC,
	cin => \Add0~369\,
	combout => \Add0~370_combout\,
	cout => \Add0~371\);

\Equal0~197\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~197_combout\ = \Equal0~196_combout\ # \Add0~368_combout\ # \Add0~364_combout\ # \Add0~370_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~196_combout\,
	datab => \Add0~368_combout\,
	datac => \Add0~364_combout\,
	datad => \Add0~370_combout\,
	combout => \Equal0~197_combout\);

\Equal0~195\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~195_combout\ = \Add0~356_combout\ # \Add0~352_combout\ # \Add0~358_combout\ # \Add0~362_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~356_combout\,
	datab => \Add0~352_combout\,
	datac => \Add0~358_combout\,
	datad => \Add0~362_combout\,
	combout => \Equal0~195_combout\);

\Selector7~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~15_combout\ = \state_reg.state_idle~regout\ & \Add0~372_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datad => \Add0~372_combout\,
	combout => \Selector7~15_combout\);

\count_reg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector7~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(15));

\Add0~372\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~372_combout\ = count_reg(15) & !\Add0~371\ # !count_reg(15) & (\Add0~371\ # GND)
-- \Add0~373\ = CARRY(!\Add0~371\ # !count_reg(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(15),
	datad => VCC,
	cin => \Add0~371\,
	combout => \Add0~372_combout\,
	cout => \Add0~373\);

\Selector6~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~15_combout\ = \Add0~374_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~374_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector6~15_combout\);

\count_reg[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector6~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(16));

\Add0~374\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~374_combout\ = count_reg(16) & (\Add0~373\ $ GND) # !count_reg(16) & !\Add0~373\ & VCC
-- \Add0~375\ = CARRY(count_reg(16) & !\Add0~373\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(16),
	datad => VCC,
	cin => \Add0~373\,
	combout => \Add0~374_combout\,
	cout => \Add0~375\);

\Selector5~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~15_combout\ = \state_reg.state_idle~regout\ & \Add0~376_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datac => \Add0~376_combout\,
	combout => \Selector5~15_combout\);

\count_reg[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector5~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(17));

\Add0~376\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~376_combout\ = \Add0~375\ $ count_reg(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => count_reg(17),
	cin => \Add0~375\,
	combout => \Add0~376_combout\);

\Equal0~198\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~198_combout\ = \Add0~372_combout\ # \Add0~374_combout\ # \Add0~376_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~372_combout\,
	datac => \Add0~374_combout\,
	datad => \Add0~376_combout\,
	combout => \Equal0~198_combout\);

\Equal0~199\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~199_combout\ = \Equal0~194_combout\ # \Equal0~197_combout\ # \Equal0~195_combout\ # \Equal0~198_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~194_combout\,
	datab => \Equal0~197_combout\,
	datac => \Equal0~195_combout\,
	datad => \Equal0~198_combout\,
	combout => \Equal0~199_combout\);

\Selector0~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~71_combout\ = \key~combout\(1) & !\Selector1~135_combout\ & (\Equal0~199_combout\ # \Selector0~70_combout\) # !\key~combout\(1) & (\Equal0~199_combout\ # \Selector0~70_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \Equal0~199_combout\,
	datac => \Selector0~70_combout\,
	datad => \Selector1~135_combout\,
	combout => \Selector0~71_combout\);

\state_reg.state_idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector0~71_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state_reg.state_idle~regout\);

\Selector22~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector22~15_combout\ = \Add0~342_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~342_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector22~15_combout\);

\count_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector22~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(0));

\device0|we_next~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|we_next~23_combout\ = !\device0|state_reg.state_idle~regout\ & (\state_reg.state_write1~regout\ # \state_reg.state_read1~regout\ & \state_reg.state_write2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device0|state_reg.state_idle~regout\,
	datab => \state_reg.state_read1~regout\,
	datac => \state_reg.state_write2~regout\,
	datad => \state_reg.state_write1~regout\,
	combout => \device0|we_next~23_combout\);

\device0|data_write_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(0),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(0));

\device0|Selector0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|Selector0~30_combout\ = !\state_reg.state_read1~regout\ # !\state_reg.state_write2~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_reg.state_write2~regout\,
	datad => \state_reg.state_read1~regout\,
	combout => \device0|Selector0~30_combout\);

\device0|Selector0~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|Selector0~31_combout\ = !\device0|oe_reg~regout\ & (\device0|state_reg.state_idle~regout\ # \state_reg.state_write1~regout\ # !\device0|Selector0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device0|oe_reg~regout\,
	datab => \device0|state_reg.state_idle~regout\,
	datac => \state_reg.state_write1~regout\,
	datad => \device0|Selector0~30_combout\,
	combout => \device0|Selector0~31_combout\);

\device0|tri_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|Selector0~31_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|tri_reg~regout\);

\device0|data_write_reg[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[1]~feeder_combout\ = count_reg(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(1),
	combout => \device0|data_write_reg[1]~feeder_combout\);

\device0|data_write_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[1]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(1));

\device0|data_write_reg[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[2]~feeder_combout\ = count_reg(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(2),
	combout => \device0|data_write_reg[2]~feeder_combout\);

\device0|data_write_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[2]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(2));

\device0|data_write_reg[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[3]~feeder_combout\ = count_reg(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(3),
	combout => \device0|data_write_reg[3]~feeder_combout\);

\device0|data_write_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[3]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(3));

\device0|data_write_reg[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[4]~feeder_combout\ = count_reg(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(4),
	combout => \device0|data_write_reg[4]~feeder_combout\);

\device0|data_write_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[4]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(4));

\device0|data_write_reg[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[5]~feeder_combout\ = count_reg(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(5),
	combout => \device0|data_write_reg[5]~feeder_combout\);

\device0|data_write_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[5]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(5));

\device0|data_write_reg[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[6]~feeder_combout\ = count_reg(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(6),
	combout => \device0|data_write_reg[6]~feeder_combout\);

\device0|data_write_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[6]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(6));

\device0|data_write_reg[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[7]~feeder_combout\ = count_reg(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(7),
	combout => \device0|data_write_reg[7]~feeder_combout\);

\device0|data_write_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[7]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(7));

\device0|data_write_reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(8),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(8));

\device0|data_write_reg[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[9]~feeder_combout\ = count_reg(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(9),
	combout => \device0|data_write_reg[9]~feeder_combout\);

\device0|data_write_reg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[9]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(9));

\device0|data_write_reg[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[10]~feeder_combout\ = count_reg(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(10),
	combout => \device0|data_write_reg[10]~feeder_combout\);

\device0|data_write_reg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[10]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(10));

\device0|data_write_reg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(11),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(11));

\device0|data_write_reg[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[12]~feeder_combout\ = count_reg(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(12),
	combout => \device0|data_write_reg[12]~feeder_combout\);

\device0|data_write_reg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[12]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(12));

\Selector9~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector9~15_combout\ = \state_reg.state_idle~regout\ & \Add0~368_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datad => \Add0~368_combout\,
	combout => \Selector9~15_combout\);

\count_reg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector9~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(13));

\device0|data_write_reg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(13),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(13));

\Selector8~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector8~15_combout\ = \Add0~370_combout\ & \state_reg.state_idle~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~370_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector8~15_combout\);

\count_reg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector8~15_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~667_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(14));

\device0|data_write_reg[14]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[14]~feeder_combout\ = count_reg(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(14),
	combout => \device0|data_write_reg[14]~feeder_combout\);

\device0|data_write_reg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[14]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(14));

\device0|data_write_reg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(15),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(15));

\device0|data_read_reg[8]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[8]~feeder_combout\ = \sram_dq[8]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[8]~7\,
	combout => \device0|data_read_reg[8]~feeder_combout\);

\device0|oe_next~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|oe_next~8_combout\ = !\state_reg.state_write1~regout\ & !\device0|state_reg.state_idle~regout\ & !\state_reg.state_write2~regout\ & \state_reg.state_read1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_write1~regout\,
	datab => \device0|state_reg.state_idle~regout\,
	datac => \state_reg.state_write2~regout\,
	datad => \state_reg.state_read1~regout\,
	combout => \device0|oe_next~8_combout\);

\device0|oe_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|oe_next~8_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|oe_reg~regout\);

\device0|data_read_reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[8]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(8));

\device0|data_read_reg[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[9]~feeder_combout\ = \sram_dq[9]~6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[9]~6\,
	combout => \device0|data_read_reg[9]~feeder_combout\);

\device0|data_read_reg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[9]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(9));

\device0|data_read_reg[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[10]~feeder_combout\ = \sram_dq[10]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[10]~5\,
	combout => \device0|data_read_reg[10]~feeder_combout\);

\device0|data_read_reg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[10]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(10));

\device0|data_read_reg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[11]~4\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(11));

\device0|data_read_reg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[12]~3\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(12));

\device0|data_read_reg[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[13]~feeder_combout\ = \sram_dq[13]~2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[13]~2\,
	combout => \device0|data_read_reg[13]~feeder_combout\);

\device0|data_read_reg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[13]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(13));

\device0|data_read_reg[14]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[14]~feeder_combout\ = \sram_dq[14]~1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[14]~1\,
	combout => \device0|data_read_reg[14]~feeder_combout\);

\device0|data_read_reg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[14]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(14));

\device0|data_read_reg[15]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[15]~feeder_combout\ = \sram_dq[15]~0\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[15]~0\,
	combout => \device0|data_read_reg[15]~feeder_combout\);

\device0|data_read_reg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[15]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(15));

\device0|data_read_reg[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[0]~feeder_combout\ = \sram_dq[0]~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[0]~15\,
	combout => \device0|data_read_reg[0]~feeder_combout\);

\device0|data_read_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[0]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(0));

\device0|data_read_reg[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[1]~feeder_combout\ = \sram_dq[1]~14\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[1]~14\,
	combout => \device0|data_read_reg[1]~feeder_combout\);

\device0|data_read_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[1]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(1));

\device0|data_read_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[2]~13\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(2));

\device0|data_read_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[3]~12\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(3));

\device0|data_read_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[4]~11\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(4));

\device0|data_read_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[5]~10\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(5));

\device0|data_read_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[6]~9\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(6));

\device0|data_read_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[7]~8\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(7));

\device0|addr_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(0),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(0));

\device0|addr_reg[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[1]~feeder_combout\ = count_reg(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(1),
	combout => \device0|addr_reg[1]~feeder_combout\);

\device0|addr_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[1]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(1));

\device0|addr_reg[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[2]~feeder_combout\ = count_reg(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(2),
	combout => \device0|addr_reg[2]~feeder_combout\);

\device0|addr_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[2]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(2));

\device0|addr_reg[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[3]~feeder_combout\ = count_reg(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(3),
	combout => \device0|addr_reg[3]~feeder_combout\);

\device0|addr_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[3]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(3));

\device0|addr_reg[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[4]~feeder_combout\ = count_reg(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(4),
	combout => \device0|addr_reg[4]~feeder_combout\);

\device0|addr_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[4]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(4));

\device0|addr_reg[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[5]~feeder_combout\ = count_reg(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(5),
	combout => \device0|addr_reg[5]~feeder_combout\);

\device0|addr_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[5]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(5));

\device0|addr_reg[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[6]~feeder_combout\ = count_reg(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(6),
	combout => \device0|addr_reg[6]~feeder_combout\);

\device0|addr_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[6]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(6));

\device0|addr_reg[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[7]~feeder_combout\ = count_reg(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(7),
	combout => \device0|addr_reg[7]~feeder_combout\);

\device0|addr_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[7]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(7));

\device0|addr_reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(8),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(8));

\device0|addr_reg[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[9]~feeder_combout\ = count_reg(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(9),
	combout => \device0|addr_reg[9]~feeder_combout\);

\device0|addr_reg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[9]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(9));

\device0|addr_reg[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[10]~feeder_combout\ = count_reg(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(10),
	combout => \device0|addr_reg[10]~feeder_combout\);

\device0|addr_reg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[10]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(10));

\device0|addr_reg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(11),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(11));

\device0|addr_reg[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[12]~feeder_combout\ = count_reg(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(12),
	combout => \device0|addr_reg[12]~feeder_combout\);

\device0|addr_reg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[12]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(12));

\device0|addr_reg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(13),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(13));

\device0|addr_reg[14]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[14]~feeder_combout\ = count_reg(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(14),
	combout => \device0|addr_reg[14]~feeder_combout\);

\device0|addr_reg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[14]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(14));

\device0|addr_reg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(15),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(15));

\device0|addr_reg[16]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[16]~feeder_combout\ = count_reg(16)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(16),
	combout => \device0|addr_reg[16]~feeder_combout\);

\device0|addr_reg[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[16]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(16));

\device0|addr_reg[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(17),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~612_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(17));

\device0|we_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|we_next~23_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|we_reg~regout\);

\ledr[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledr(0));

\ledr[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledr(1));

\ledr[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledr(2));

\ledr[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledr(3));

\ledr[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledr(4));

\ledr[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledr(5));

\ledr[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledr(6));

\ledr[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledr(7));

\ledg[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledg(0));

\ledg[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledg(1));

\ledg[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledg(2));

\ledg[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledg(3));

\ledg[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledg(4));

\ledg[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledg(5));

\ledg[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledg(6));

\ledg[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|data_read_reg\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ledg(7));

\sram_addr[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(0));

\sram_addr[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(1));

\sram_addr[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(2));

\sram_addr[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(3));

\sram_addr[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(4));

\sram_addr[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(5));

\sram_addr[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(6));

\sram_addr[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(7));

\sram_addr[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(8));

\sram_addr[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(9));

\sram_addr[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(10));

\sram_addr[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(11));

\sram_addr[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(12));

\sram_addr[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(13));

\sram_addr[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(14));

\sram_addr[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(15));

\sram_addr[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(16),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(16));

\sram_addr[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|addr_reg\(17),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_addr(17));

\sram_oe_n~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|ALT_INV_oe_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_oe_n);

\sram_we_n~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \device0|ALT_INV_we_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_we_n);

\sram_ce_n~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_ce_n);

\sram_lb_n~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_lb_n);

\sram_ub_n~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sram_ub_n);
END structure;


