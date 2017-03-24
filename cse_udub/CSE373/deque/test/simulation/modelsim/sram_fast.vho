-- Copyright (C) 1991-2012 Altera Corporation
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
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 12.0 Build 178 05/31/2012 SJ Full Version"

-- DATE "01/27/2013 22:17:19"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

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

-- Design Ports Information
-- sram_dq[0]	=>  Location: PIN_AA6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[1]	=>  Location: PIN_AB6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[2]	=>  Location: PIN_AA7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[3]	=>  Location: PIN_AB7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[4]	=>  Location: PIN_AA8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[5]	=>  Location: PIN_AB8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[6]	=>  Location: PIN_AA9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[7]	=>  Location: PIN_AB9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[8]	=>  Location: PIN_Y9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[9]	=>  Location: PIN_W9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[10]	=>  Location: PIN_V9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[11]	=>  Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[12]	=>  Location: PIN_R9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[13]	=>  Location: PIN_W8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[14]	=>  Location: PIN_V8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_dq[15]	=>  Location: PIN_U8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledr[0]	=>  Location: PIN_R20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledr[1]	=>  Location: PIN_R19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledr[2]	=>  Location: PIN_U19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledr[3]	=>  Location: PIN_Y19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledr[4]	=>  Location: PIN_T18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledr[5]	=>  Location: PIN_V19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledr[6]	=>  Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledr[7]	=>  Location: PIN_U18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledg[0]	=>  Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledg[1]	=>  Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledg[2]	=>  Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledg[3]	=>  Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledg[4]	=>  Location: PIN_W22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledg[5]	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledg[6]	=>  Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ledg[7]	=>  Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[0]	=>  Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[1]	=>  Location: PIN_AB3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[2]	=>  Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[3]	=>  Location: PIN_AB4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[4]	=>  Location: PIN_AA5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[5]	=>  Location: PIN_AB10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[6]	=>  Location: PIN_AA11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[7]	=>  Location: PIN_AB11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[8]	=>  Location: PIN_V11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[9]	=>  Location: PIN_W11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[10]	=>  Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[11]	=>  Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[12]	=>  Location: PIN_Y10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[13]	=>  Location: PIN_U10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[14]	=>  Location: PIN_R10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[15]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[16]	=>  Location: PIN_Y6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_addr[17]	=>  Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_oe_n	=>  Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_we_n	=>  Location: PIN_AA10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_ce_n	=>  Location: PIN_AB5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_lb_n	=>  Location: PIN_Y7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sram_ub_n	=>  Location: PIN_W7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key[0]	=>  Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key[1]	=>  Location: PIN_R21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- key[2]	=>  Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF sram IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
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
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \device1|Add0~6_combout\ : std_logic;
SIGNAL \device1|Add0~8_combout\ : std_logic;
SIGNAL \device1|Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \device1|count_next[4]~5_combout\ : std_logic;
SIGNAL \sram_dq[0]~0\ : std_logic;
SIGNAL \sram_dq[1]~1\ : std_logic;
SIGNAL \sram_dq[2]~2\ : std_logic;
SIGNAL \sram_dq[3]~3\ : std_logic;
SIGNAL \sram_dq[4]~4\ : std_logic;
SIGNAL \sram_dq[5]~5\ : std_logic;
SIGNAL \sram_dq[6]~6\ : std_logic;
SIGNAL \sram_dq[7]~7\ : std_logic;
SIGNAL \sram_dq[8]~8\ : std_logic;
SIGNAL \sram_dq[9]~9\ : std_logic;
SIGNAL \sram_dq[10]~10\ : std_logic;
SIGNAL \sram_dq[11]~11\ : std_logic;
SIGNAL \sram_dq[12]~12\ : std_logic;
SIGNAL \sram_dq[13]~13\ : std_logic;
SIGNAL \sram_dq[14]~14\ : std_logic;
SIGNAL \sram_dq[15]~15\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Selector22~0_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \device1|Add0~0_combout\ : std_logic;
SIGNAL \device1|Add0~1\ : std_logic;
SIGNAL \device1|Add0~2_combout\ : std_logic;
SIGNAL \device1|Add0~3\ : std_logic;
SIGNAL \device1|Add0~4_combout\ : std_logic;
SIGNAL \device1|Add0~5\ : std_logic;
SIGNAL \device1|Add0~7\ : std_logic;
SIGNAL \device1|Add0~9\ : std_logic;
SIGNAL \device1|Add0~11\ : std_logic;
SIGNAL \device1|Add0~12_combout\ : std_logic;
SIGNAL \device1|count_next[6]~4_combout\ : std_logic;
SIGNAL \device1|Add0~13\ : std_logic;
SIGNAL \device1|Add0~14_combout\ : std_logic;
SIGNAL \device1|Add0~15\ : std_logic;
SIGNAL \device1|Add0~16_combout\ : std_logic;
SIGNAL \device1|count_next[8]~3_combout\ : std_logic;
SIGNAL \device1|Add0~17\ : std_logic;
SIGNAL \device1|Add0~18_combout\ : std_logic;
SIGNAL \device1|count_next[9]~2_combout\ : std_logic;
SIGNAL \device1|Add0~19\ : std_logic;
SIGNAL \device1|Add0~21\ : std_logic;
SIGNAL \device1|Add0~22_combout\ : std_logic;
SIGNAL \device1|Add0~20_combout\ : std_logic;
SIGNAL \device1|Equal0~1_combout\ : std_logic;
SIGNAL \device1|Add0~23\ : std_logic;
SIGNAL \device1|Add0~24_combout\ : std_logic;
SIGNAL \device1|Add0~25\ : std_logic;
SIGNAL \device1|Add0~26_combout\ : std_logic;
SIGNAL \device1|Add0~27\ : std_logic;
SIGNAL \device1|Add0~28_combout\ : std_logic;
SIGNAL \device1|count_next[14]~1_combout\ : std_logic;
SIGNAL \device1|Add0~29\ : std_logic;
SIGNAL \device1|Add0~30_combout\ : std_logic;
SIGNAL \device1|count_next[15]~0_combout\ : std_logic;
SIGNAL \device1|Equal0~0_combout\ : std_logic;
SIGNAL \device1|Add0~10_combout\ : std_logic;
SIGNAL \device1|Equal0~2_combout\ : std_logic;
SIGNAL \device1|Equal0~4_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \state_reg.state_read2~regout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \state_reg.state_idle~regout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \state_reg.state_read1~regout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \state_reg.state_write1~regout\ : std_logic;
SIGNAL \device0|addr_reg[17]~0_combout\ : std_logic;
SIGNAL \device0|state_reg.state_idle~regout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \state_reg.state_write2~regout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \count_reg[13]~0_combout\ : std_logic;
SIGNAL \device0|data_write_reg[0]~feeder_combout\ : std_logic;
SIGNAL \device0|we_next~0_combout\ : std_logic;
SIGNAL \device0|Selector0~0_combout\ : std_logic;
SIGNAL \device0|oe_next~0_combout\ : std_logic;
SIGNAL \device0|state_reg.state_read~feeder_combout\ : std_logic;
SIGNAL \device0|state_reg.state_read~regout\ : std_logic;
SIGNAL \device0|Selector0~1_combout\ : std_logic;
SIGNAL \device0|tri_reg~regout\ : std_logic;
SIGNAL \device0|data_write_reg[1]~feeder_combout\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \device0|data_write_reg[3]~feeder_combout\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \device0|data_write_reg[6]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[7]~feeder_combout\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \device0|data_write_reg[9]~feeder_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \device0|data_write_reg[12]~feeder_combout\ : std_logic;
SIGNAL \device0|data_write_reg[13]~feeder_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \device0|data_write_reg[15]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[9]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[11]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[13]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[14]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[0]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[1]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[2]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[3]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[4]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[5]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[6]~feeder_combout\ : std_logic;
SIGNAL \device0|data_read_reg[7]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[0]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[1]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[3]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[6]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[7]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[9]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[12]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[13]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[16]~feeder_combout\ : std_logic;
SIGNAL \device0|addr_reg[17]~feeder_combout\ : std_logic;
SIGNAL \device0|oe_reg~feeder_combout\ : std_logic;
SIGNAL \device0|oe_reg~regout\ : std_logic;
SIGNAL \device0|we_reg~regout\ : std_logic;
SIGNAL count_reg : std_logic_vector(17 DOWNTO 0);
SIGNAL \device0|data_write_reg\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \device0|data_read_reg\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \device0|addr_reg\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \device1|count\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \key~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \device0|ALT_INV_we_reg~regout\ : std_logic;
SIGNAL \device0|ALT_INV_oe_reg~regout\ : std_logic;
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

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\device0|ALT_INV_we_reg~regout\ <= NOT \device0|we_reg~regout\;
\device0|ALT_INV_oe_reg~regout\ <= NOT \device0|oe_reg~regout\;
\ALT_INV_key~combout\(0) <= NOT \key~combout\(0);

-- Location: LCCOMB_X11_Y1_N6
\device1|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~6_combout\ = (\device1|count\(3) & (!\device1|Add0~5\)) # (!\device1|count\(3) & ((\device1|Add0~5\) # (GND)))
-- \device1|Add0~7\ = CARRY((!\device1|Add0~5\) # (!\device1|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(3),
	datad => VCC,
	cin => \device1|Add0~5\,
	combout => \device1|Add0~6_combout\,
	cout => \device1|Add0~7\);

-- Location: LCCOMB_X11_Y1_N8
\device1|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~8_combout\ = (\device1|count\(4) & (\device1|Add0~7\ $ (GND))) # (!\device1|count\(4) & (!\device1|Add0~7\ & VCC))
-- \device1|Add0~9\ = CARRY((\device1|count\(4) & !\device1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(4),
	datad => VCC,
	cin => \device1|Add0~7\,
	combout => \device1|Add0~8_combout\,
	cout => \device1|Add0~9\);

-- Location: LCFF_X12_Y1_N5
\device1|count[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[4]~5_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(4));

-- Location: LCFF_X11_Y1_N7
\device1|count[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~6_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(3));

-- Location: LCCOMB_X10_Y1_N10
\device1|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Equal0~3_combout\ = (\device1|count\(2) & (\device1|count\(0) & (\device1|count\(3) & \device1|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(2),
	datab => \device1|count\(0),
	datac => \device1|count\(3),
	datad => \device1|count\(1),
	combout => \device1|Equal0~3_combout\);

-- Location: LCCOMB_X9_Y1_N24
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\Add0~8_combout\) # ((\Add0~18_combout\) # ((\Add0~12_combout\) # (\Add0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => \Add0~18_combout\,
	datac => \Add0~12_combout\,
	datad => \Add0~10_combout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X8_Y1_N12
\Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\state_reg.state_write2~regout\ & !\device0|state_reg.state_idle~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_write2~regout\,
	datac => \device0|state_reg.state_idle~regout\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X12_Y1_N4
\device1|count_next[4]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[4]~5_combout\ = (!\device1|Equal0~4_combout\ & \device1|Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~4_combout\,
	datad => \device1|Add0~8_combout\,
	combout => \device1|count_next[4]~5_combout\);

-- Location: PIN_AA6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[0]~0\);

-- Location: PIN_AB6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[1]~1\);

-- Location: PIN_AA7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[2]~2\);

-- Location: PIN_AB7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[3]~3\);

-- Location: PIN_AA8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[4]~4\);

-- Location: PIN_AB8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[5]~5\);

-- Location: PIN_AA9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[6]~6\);

-- Location: PIN_AB9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[7]~7\);

-- Location: PIN_Y9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[8]~8\);

-- Location: PIN_W9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[9]~9\);

-- Location: PIN_V9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[10]~10\);

-- Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[11]~11\);

-- Location: PIN_R9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[12]~12\);

-- Location: PIN_W8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[13]~13\);

-- Location: PIN_V8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[14]~14\);

-- Location: PIN_U8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	combout => \sram_dq[15]~15\);

-- Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X9_Y2_N14
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = count_reg(0) $ (VCC)
-- \Add0~1\ = CARRY(count_reg(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_reg(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X9_Y2_N4
\Selector22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector22~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datac => \Add0~0_combout\,
	combout => \Selector22~0_combout\);

-- Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_R21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: LCCOMB_X10_Y1_N12
\Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (!\state_reg.state_idle~regout\ & \key~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datad => \key~combout\(2),
	combout => \Selector1~1_combout\);

-- Location: LCCOMB_X11_Y1_N0
\device1|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~0_combout\ = \device1|count\(0) $ (VCC)
-- \device1|Add0~1\ = CARRY(\device1|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(0),
	datad => VCC,
	combout => \device1|Add0~0_combout\,
	cout => \device1|Add0~1\);

-- Location: LCFF_X11_Y1_N1
\device1|count[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~0_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(0));

-- Location: LCCOMB_X11_Y1_N2
\device1|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~2_combout\ = (\device1|count\(1) & (!\device1|Add0~1\)) # (!\device1|count\(1) & ((\device1|Add0~1\) # (GND)))
-- \device1|Add0~3\ = CARRY((!\device1|Add0~1\) # (!\device1|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(1),
	datad => VCC,
	cin => \device1|Add0~1\,
	combout => \device1|Add0~2_combout\,
	cout => \device1|Add0~3\);

-- Location: LCFF_X11_Y1_N3
\device1|count[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~2_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(1));

-- Location: LCCOMB_X11_Y1_N4
\device1|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~4_combout\ = (\device1|count\(2) & (\device1|Add0~3\ $ (GND))) # (!\device1|count\(2) & (!\device1|Add0~3\ & VCC))
-- \device1|Add0~5\ = CARRY((\device1|count\(2) & !\device1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(2),
	datad => VCC,
	cin => \device1|Add0~3\,
	combout => \device1|Add0~4_combout\,
	cout => \device1|Add0~5\);

-- Location: LCFF_X11_Y1_N5
\device1|count[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~4_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(2));

-- Location: LCCOMB_X11_Y1_N10
\device1|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~10_combout\ = (\device1|count\(5) & (!\device1|Add0~9\)) # (!\device1|count\(5) & ((\device1|Add0~9\) # (GND)))
-- \device1|Add0~11\ = CARRY((!\device1|Add0~9\) # (!\device1|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(5),
	datad => VCC,
	cin => \device1|Add0~9\,
	combout => \device1|Add0~10_combout\,
	cout => \device1|Add0~11\);

-- Location: LCCOMB_X11_Y1_N12
\device1|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~12_combout\ = (\device1|count\(6) & (\device1|Add0~11\ $ (GND))) # (!\device1|count\(6) & (!\device1|Add0~11\ & VCC))
-- \device1|Add0~13\ = CARRY((\device1|count\(6) & !\device1|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(6),
	datad => VCC,
	cin => \device1|Add0~11\,
	combout => \device1|Add0~12_combout\,
	cout => \device1|Add0~13\);

-- Location: LCCOMB_X12_Y1_N10
\device1|count_next[6]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[6]~4_combout\ = (!\device1|Equal0~4_combout\ & \device1|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~4_combout\,
	datad => \device1|Add0~12_combout\,
	combout => \device1|count_next[6]~4_combout\);

-- Location: LCFF_X12_Y1_N11
\device1|count[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[6]~4_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(6));

-- Location: LCCOMB_X11_Y1_N14
\device1|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~14_combout\ = (\device1|count\(7) & (!\device1|Add0~13\)) # (!\device1|count\(7) & ((\device1|Add0~13\) # (GND)))
-- \device1|Add0~15\ = CARRY((!\device1|Add0~13\) # (!\device1|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(7),
	datad => VCC,
	cin => \device1|Add0~13\,
	combout => \device1|Add0~14_combout\,
	cout => \device1|Add0~15\);

-- Location: LCFF_X11_Y1_N15
\device1|count[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~14_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(7));

-- Location: LCCOMB_X11_Y1_N16
\device1|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~16_combout\ = (\device1|count\(8) & (\device1|Add0~15\ $ (GND))) # (!\device1|count\(8) & (!\device1|Add0~15\ & VCC))
-- \device1|Add0~17\ = CARRY((\device1|count\(8) & !\device1|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(8),
	datad => VCC,
	cin => \device1|Add0~15\,
	combout => \device1|Add0~16_combout\,
	cout => \device1|Add0~17\);

-- Location: LCCOMB_X12_Y1_N8
\device1|count_next[8]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[8]~3_combout\ = (!\device1|Equal0~4_combout\ & \device1|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~4_combout\,
	datad => \device1|Add0~16_combout\,
	combout => \device1|count_next[8]~3_combout\);

-- Location: LCFF_X12_Y1_N9
\device1|count[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[8]~3_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(8));

-- Location: LCCOMB_X11_Y1_N18
\device1|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~18_combout\ = (\device1|count\(9) & (!\device1|Add0~17\)) # (!\device1|count\(9) & ((\device1|Add0~17\) # (GND)))
-- \device1|Add0~19\ = CARRY((!\device1|Add0~17\) # (!\device1|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(9),
	datad => VCC,
	cin => \device1|Add0~17\,
	combout => \device1|Add0~18_combout\,
	cout => \device1|Add0~19\);

-- Location: LCCOMB_X12_Y1_N22
\device1|count_next[9]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[9]~2_combout\ = (!\device1|Equal0~4_combout\ & \device1|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~4_combout\,
	datad => \device1|Add0~18_combout\,
	combout => \device1|count_next[9]~2_combout\);

-- Location: LCFF_X12_Y1_N23
\device1|count[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[9]~2_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(9));

-- Location: LCCOMB_X11_Y1_N20
\device1|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~20_combout\ = (\device1|count\(10) & (\device1|Add0~19\ $ (GND))) # (!\device1|count\(10) & (!\device1|Add0~19\ & VCC))
-- \device1|Add0~21\ = CARRY((\device1|count\(10) & !\device1|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(10),
	datad => VCC,
	cin => \device1|Add0~19\,
	combout => \device1|Add0~20_combout\,
	cout => \device1|Add0~21\);

-- Location: LCCOMB_X11_Y1_N22
\device1|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~22_combout\ = (\device1|count\(11) & (!\device1|Add0~21\)) # (!\device1|count\(11) & ((\device1|Add0~21\) # (GND)))
-- \device1|Add0~23\ = CARRY((!\device1|Add0~21\) # (!\device1|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(11),
	datad => VCC,
	cin => \device1|Add0~21\,
	combout => \device1|Add0~22_combout\,
	cout => \device1|Add0~23\);

-- Location: LCFF_X11_Y1_N23
\device1|count[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~22_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(11));

-- Location: LCFF_X11_Y1_N21
\device1|count[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~20_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(10));

-- Location: LCCOMB_X10_Y1_N2
\device1|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Equal0~1_combout\ = (\device1|count\(9) & (!\device1|count\(11) & (\device1|count\(8) & !\device1|count\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(9),
	datab => \device1|count\(11),
	datac => \device1|count\(8),
	datad => \device1|count\(10),
	combout => \device1|Equal0~1_combout\);

-- Location: LCCOMB_X11_Y1_N24
\device1|Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~24_combout\ = (\device1|count\(12) & (\device1|Add0~23\ $ (GND))) # (!\device1|count\(12) & (!\device1|Add0~23\ & VCC))
-- \device1|Add0~25\ = CARRY((\device1|count\(12) & !\device1|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(12),
	datad => VCC,
	cin => \device1|Add0~23\,
	combout => \device1|Add0~24_combout\,
	cout => \device1|Add0~25\);

-- Location: LCFF_X11_Y1_N25
\device1|count[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~24_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(12));

-- Location: LCCOMB_X11_Y1_N26
\device1|Add0~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~26_combout\ = (\device1|count\(13) & (!\device1|Add0~25\)) # (!\device1|count\(13) & ((\device1|Add0~25\) # (GND)))
-- \device1|Add0~27\ = CARRY((!\device1|Add0~25\) # (!\device1|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(13),
	datad => VCC,
	cin => \device1|Add0~25\,
	combout => \device1|Add0~26_combout\,
	cout => \device1|Add0~27\);

-- Location: LCFF_X11_Y1_N27
\device1|count[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~26_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(13));

-- Location: LCCOMB_X11_Y1_N28
\device1|Add0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~28_combout\ = (\device1|count\(14) & (\device1|Add0~27\ $ (GND))) # (!\device1|count\(14) & (!\device1|Add0~27\ & VCC))
-- \device1|Add0~29\ = CARRY((\device1|count\(14) & !\device1|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \device1|count\(14),
	datad => VCC,
	cin => \device1|Add0~27\,
	combout => \device1|Add0~28_combout\,
	cout => \device1|Add0~29\);

-- Location: LCCOMB_X12_Y1_N24
\device1|count_next[14]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[14]~1_combout\ = (!\device1|Equal0~4_combout\ & \device1|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device1|Equal0~4_combout\,
	datad => \device1|Add0~28_combout\,
	combout => \device1|count_next[14]~1_combout\);

-- Location: LCFF_X12_Y1_N25
\device1|count[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[14]~1_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(14));

-- Location: LCCOMB_X11_Y1_N30
\device1|Add0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Add0~30_combout\ = \device1|Add0~29\ $ (\device1|count\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \device1|count\(15),
	cin => \device1|Add0~29\,
	combout => \device1|Add0~30_combout\);

-- Location: LCCOMB_X12_Y1_N26
\device1|count_next[15]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|count_next[15]~0_combout\ = (!\device1|Equal0~4_combout\ & \device1|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|Equal0~4_combout\,
	datac => \device1|Add0~30_combout\,
	combout => \device1|count_next[15]~0_combout\);

-- Location: LCFF_X12_Y1_N27
\device1|count[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|count_next[15]~0_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(15));

-- Location: LCCOMB_X10_Y1_N4
\device1|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Equal0~0_combout\ = (!\device1|count\(13) & (!\device1|count\(12) & (\device1|count\(14) & \device1|count\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(13),
	datab => \device1|count\(12),
	datac => \device1|count\(14),
	datad => \device1|count\(15),
	combout => \device1|Equal0~0_combout\);

-- Location: LCFF_X11_Y1_N11
\device1|count[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device1|Add0~10_combout\,
	aclr => \state_reg.state_read1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device1|count\(5));

-- Location: LCCOMB_X10_Y1_N28
\device1|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Equal0~2_combout\ = (!\device1|count\(4) & (!\device1|count\(7) & (!\device1|count\(5) & \device1|count\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|count\(4),
	datab => \device1|count\(7),
	datac => \device1|count\(5),
	datad => \device1|count\(6),
	combout => \device1|Equal0~2_combout\);

-- Location: LCCOMB_X10_Y1_N24
\device1|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \device1|Equal0~4_combout\ = (\device1|Equal0~3_combout\ & (\device1|Equal0~1_combout\ & (\device1|Equal0~0_combout\ & \device1|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|Equal0~3_combout\,
	datab => \device1|Equal0~1_combout\,
	datac => \device1|Equal0~0_combout\,
	datad => \device1|Equal0~2_combout\,
	combout => \device1|Equal0~4_combout\);

-- Location: LCCOMB_X10_Y1_N26
\Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\state_reg.state_read1~regout\) # ((\state_reg.state_read2~regout\ & ((\device0|state_reg.state_idle~regout\) # (!\device1|Equal0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device1|Equal0~4_combout\,
	datab => \state_reg.state_read1~regout\,
	datac => \state_reg.state_read2~regout\,
	datad => \device0|state_reg.state_idle~regout\,
	combout => \Selector2~0_combout\);

-- Location: LCFF_X10_Y1_N27
\state_reg.state_read2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector2~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state_reg.state_read2~regout\);

-- Location: LCCOMB_X10_Y1_N20
\Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (!\device0|state_reg.state_idle~regout\ & (\device1|Equal0~4_combout\ & \state_reg.state_read2~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device0|state_reg.state_idle~regout\,
	datac => \device1|Equal0~4_combout\,
	datad => \state_reg.state_read2~regout\,
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X9_Y1_N30
\Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (\Selector0~0_combout\ & (((!\Selector1~1_combout\)) # (!\key~combout\(1)))) # (!\Selector0~0_combout\ & (\Equal0~5_combout\ & ((!\Selector1~1_combout\) # (!\key~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~0_combout\,
	datab => \key~combout\(1),
	datac => \Selector1~1_combout\,
	datad => \Equal0~5_combout\,
	combout => \Selector0~1_combout\);

-- Location: LCFF_X9_Y1_N31
\state_reg.state_idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector0~1_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state_reg.state_idle~regout\);

-- Location: LCCOMB_X9_Y2_N16
\Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (count_reg(1) & (!\Add0~1\)) # (!count_reg(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!count_reg(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X9_Y2_N2
\Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datac => \Add0~2_combout\,
	combout => \Selector21~0_combout\);

-- Location: LCFF_X9_Y2_N3
\count_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector21~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(1));

-- Location: LCCOMB_X9_Y2_N18
\Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (count_reg(2) & (\Add0~3\ $ (GND))) # (!count_reg(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((count_reg(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X9_Y2_N8
\Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_reg.state_idle~regout\,
	datad => \Add0~4_combout\,
	combout => \Selector20~0_combout\);

-- Location: LCFF_X9_Y2_N9
\count_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector20~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(2));

-- Location: LCCOMB_X9_Y2_N20
\Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (count_reg(3) & (!\Add0~5\)) # (!count_reg(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!count_reg(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_reg(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X9_Y2_N22
\Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (count_reg(4) & (\Add0~7\ $ (GND))) # (!count_reg(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((count_reg(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X9_Y2_N0
\Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_reg.state_idle~regout\,
	datad => \Add0~8_combout\,
	combout => \Selector18~0_combout\);

-- Location: LCFF_X9_Y2_N1
\count_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector18~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(4));

-- Location: LCCOMB_X9_Y2_N24
\Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (count_reg(5) & (!\Add0~9\)) # (!count_reg(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!count_reg(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_reg(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X9_Y2_N26
\Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (count_reg(6) & (\Add0~11\ $ (GND))) # (!count_reg(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((count_reg(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X10_Y2_N0
\Selector16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state_reg.state_idle~regout\,
	datad => \Add0~12_combout\,
	combout => \Selector16~0_combout\);

-- Location: LCFF_X9_Y2_N23
\count_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector16~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(6));

-- Location: LCCOMB_X9_Y2_N28
\Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (count_reg(7) & (!\Add0~13\)) # (!count_reg(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!count_reg(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X10_Y2_N14
\Selector15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state_reg.state_idle~regout\,
	datad => \Add0~14_combout\,
	combout => \Selector15~0_combout\);

-- Location: LCFF_X9_Y2_N29
\count_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector15~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(7));

-- Location: LCCOMB_X9_Y2_N30
\Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (count_reg(8) & (\Add0~15\ $ (GND))) # (!count_reg(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((count_reg(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X10_Y2_N8
\Selector14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (\Add0~16_combout\ & \state_reg.state_idle~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~16_combout\,
	datad => \state_reg.state_idle~regout\,
	combout => \Selector14~0_combout\);

-- Location: LCFF_X9_Y2_N19
\count_reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector14~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(8));

-- Location: LCCOMB_X9_Y1_N0
\Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (count_reg(9) & (!\Add0~17\)) # (!count_reg(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!count_reg(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_reg(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X9_Y1_N2
\Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (count_reg(10) & (\Add0~19\ $ (GND))) # (!count_reg(10) & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((count_reg(10) & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(10),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X8_Y1_N4
\Selector12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_reg.state_idle~regout\,
	datad => \Add0~20_combout\,
	combout => \Selector12~0_combout\);

-- Location: LCFF_X9_Y1_N3
\count_reg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector12~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(10));

-- Location: LCCOMB_X9_Y1_N4
\Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (count_reg(11) & (!\Add0~21\)) # (!count_reg(11) & ((\Add0~21\) # (GND)))
-- \Add0~23\ = CARRY((!\Add0~21\) # (!count_reg(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_reg(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCCOMB_X9_Y1_N22
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (\Add0~16_combout\) # ((\Add0~22_combout\) # ((\Add0~20_combout\) # (\Add0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datab => \Add0~22_combout\,
	datac => \Add0~20_combout\,
	datad => \Add0~14_combout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X10_Y1_N18
\Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_reg.state_idle~regout\,
	datad => \Add0~26_combout\,
	combout => \Selector9~0_combout\);

-- Location: LCFF_X10_Y1_N19
\count_reg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector9~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(13));

-- Location: LCCOMB_X9_Y1_N6
\Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (count_reg(12) & (\Add0~23\ $ (GND))) # (!count_reg(12) & (!\Add0~23\ & VCC))
-- \Add0~25\ = CARRY((count_reg(12) & !\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_reg(12),
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X9_Y1_N8
\Add0~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (count_reg(13) & (!\Add0~25\)) # (!count_reg(13) & ((\Add0~25\) # (GND)))
-- \Add0~27\ = CARRY((!\Add0~25\) # (!count_reg(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(13),
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X9_Y2_N12
\Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (\Add0~2_combout\) # ((\Add0~0_combout\) # ((\Add0~6_combout\) # (\Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~2_combout\,
	datab => \Add0~0_combout\,
	datac => \Add0~6_combout\,
	datad => \Add0~4_combout\,
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X9_Y1_N10
\Add0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (count_reg(14) & (\Add0~27\ $ (GND))) # (!count_reg(14) & (!\Add0~27\ & VCC))
-- \Add0~29\ = CARRY((count_reg(14) & !\Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_reg(14),
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X9_Y1_N20
\Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (\Add0~24_combout\) # ((\Add0~26_combout\) # ((\Equal0~2_combout\) # (\Add0~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~24_combout\,
	datab => \Add0~26_combout\,
	datac => \Equal0~2_combout\,
	datad => \Add0~28_combout\,
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X10_Y1_N8
\Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_reg.state_idle~regout\,
	datad => \Add0~32_combout\,
	combout => \Selector6~0_combout\);

-- Location: LCFF_X10_Y1_N9
\count_reg[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector6~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(16));

-- Location: LCCOMB_X9_Y1_N12
\Add0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (count_reg(15) & (!\Add0~29\)) # (!count_reg(15) & ((\Add0~29\) # (GND)))
-- \Add0~31\ = CARRY((!\Add0~29\) # (!count_reg(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(15),
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: LCCOMB_X10_Y1_N30
\Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_reg.state_idle~regout\,
	datad => \Add0~30_combout\,
	combout => \Selector7~0_combout\);

-- Location: LCFF_X10_Y1_N31
\count_reg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector7~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(15));

-- Location: LCCOMB_X9_Y1_N14
\Add0~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (count_reg(16) & (\Add0~31\ $ (GND))) # (!count_reg(16) & (!\Add0~31\ & VCC))
-- \Add0~33\ = CARRY((count_reg(16) & !\Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_reg(16),
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: LCCOMB_X10_Y1_N22
\Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_reg.state_idle~regout\,
	datad => \Add0~34_combout\,
	combout => \Selector5~0_combout\);

-- Location: LCFF_X10_Y1_N23
\count_reg[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector5~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(17));

-- Location: LCCOMB_X9_Y1_N16
\Add0~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = \Add0~33\ $ (count_reg(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => count_reg(17),
	cin => \Add0~33\,
	combout => \Add0~34_combout\);

-- Location: LCCOMB_X9_Y1_N28
\Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Add0~30_combout\) # ((\Add0~32_combout\) # (\Add0~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~30_combout\,
	datab => \Add0~32_combout\,
	datad => \Add0~34_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X9_Y1_N18
\Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (\Equal0~0_combout\) # ((\Equal0~1_combout\) # ((\Equal0~3_combout\) # (\Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \Equal0~3_combout\,
	datad => \Equal0~4_combout\,
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X12_Y1_N30
\Selector1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (\key~combout\(1) & (((\Selector1~0_combout\ & \Equal0~5_combout\)))) # (!\key~combout\(1) & ((\Selector1~1_combout\) # ((\Selector1~0_combout\ & \Equal0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key~combout\(1),
	datab => \Selector1~1_combout\,
	datac => \Selector1~0_combout\,
	datad => \Equal0~5_combout\,
	combout => \Selector1~2_combout\);

-- Location: LCFF_X12_Y1_N31
\state_reg.state_read1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector1~2_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state_reg.state_read1~regout\);

-- Location: LCCOMB_X9_Y1_N26
\Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\Selector3~0_combout\ & ((\Equal0~5_combout\) # ((!\state_reg.state_idle~regout\ & !\key~combout\(2))))) # (!\Selector3~0_combout\ & (!\state_reg.state_idle~regout\ & (!\key~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~0_combout\,
	datab => \state_reg.state_idle~regout\,
	datac => \key~combout\(2),
	datad => \Equal0~5_combout\,
	combout => \Selector3~1_combout\);

-- Location: LCFF_X9_Y1_N27
\state_reg.state_write1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector3~1_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state_reg.state_write1~regout\);

-- Location: LCCOMB_X12_Y1_N28
\device0|addr_reg[17]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[17]~0_combout\ = (!\device0|state_reg.state_idle~regout\ & ((\state_reg.state_read1~regout\) # (\state_reg.state_write1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state_reg.state_read1~regout\,
	datac => \state_reg.state_write1~regout\,
	datad => \device0|state_reg.state_idle~regout\,
	combout => \device0|addr_reg[17]~0_combout\);

-- Location: LCFF_X10_Y1_N13
\device0|state_reg.state_idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \device0|addr_reg[17]~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|state_reg.state_idle~regout\);

-- Location: LCCOMB_X8_Y1_N10
\Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\state_reg.state_write1~regout\) # ((\device0|state_reg.state_idle~regout\ & \state_reg.state_write2~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_write1~regout\,
	datab => \device0|state_reg.state_idle~regout\,
	datac => \state_reg.state_write2~regout\,
	combout => \Selector4~0_combout\);

-- Location: LCFF_X8_Y1_N11
\state_reg.state_write2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector4~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state_reg.state_write2~regout\);

-- Location: LCCOMB_X10_Y1_N16
\Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\device0|state_reg.state_idle~regout\) # ((!\state_reg.state_write2~regout\ & ((!\state_reg.state_read2~regout\) # (!\device1|Equal0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device0|state_reg.state_idle~regout\,
	datab => \state_reg.state_write2~regout\,
	datac => \device1|Equal0~4_combout\,
	datad => \state_reg.state_read2~regout\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X10_Y1_N6
\count_reg[13]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \count_reg[13]~0_combout\ = ((!\state_reg.state_idle~regout\ & ((!\key~combout\(2)) # (!\key~combout\(1))))) # (!\Selector0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datab => \key~combout\(1),
	datac => \Selector0~0_combout\,
	datad => \key~combout\(2),
	combout => \count_reg[13]~0_combout\);

-- Location: LCFF_X9_Y2_N5
\count_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector22~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(0));

-- Location: LCCOMB_X8_Y2_N6
\device0|data_write_reg[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[0]~feeder_combout\ = count_reg(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(0),
	combout => \device0|data_write_reg[0]~feeder_combout\);

-- Location: LCCOMB_X12_Y1_N20
\device0|we_next~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|we_next~0_combout\ = (!\device0|state_reg.state_idle~regout\ & ((\state_reg.state_write1~regout\) # ((\state_reg.state_write2~regout\ & \state_reg.state_read1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \device0|state_reg.state_idle~regout\,
	datab => \state_reg.state_write2~regout\,
	datac => \state_reg.state_write1~regout\,
	datad => \state_reg.state_read1~regout\,
	combout => \device0|we_next~0_combout\);

-- Location: LCFF_X8_Y2_N7
\device0|data_write_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[0]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(0));

-- Location: LCCOMB_X12_Y1_N14
\device0|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|Selector0~0_combout\ = (!\state_reg.state_write1~regout\ & (!\device0|state_reg.state_idle~regout\ & ((!\state_reg.state_write2~regout\) # (!\state_reg.state_read1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_write1~regout\,
	datab => \state_reg.state_read1~regout\,
	datac => \state_reg.state_write2~regout\,
	datad => \device0|state_reg.state_idle~regout\,
	combout => \device0|Selector0~0_combout\);

-- Location: LCCOMB_X12_Y1_N6
\device0|oe_next~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|oe_next~0_combout\ = (!\state_reg.state_write1~regout\ & (\state_reg.state_read1~regout\ & (!\state_reg.state_write2~regout\ & !\device0|state_reg.state_idle~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_write1~regout\,
	datab => \state_reg.state_read1~regout\,
	datac => \state_reg.state_write2~regout\,
	datad => \device0|state_reg.state_idle~regout\,
	combout => \device0|oe_next~0_combout\);

-- Location: LCCOMB_X12_Y1_N0
\device0|state_reg.state_read~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|state_reg.state_read~feeder_combout\ = \device0|oe_next~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \device0|oe_next~0_combout\,
	combout => \device0|state_reg.state_read~feeder_combout\);

-- Location: LCFF_X12_Y1_N1
\device0|state_reg.state_read\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|state_reg.state_read~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|state_reg.state_read~regout\);

-- Location: LCCOMB_X12_Y1_N18
\device0|Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|Selector0~1_combout\ = (!\device0|Selector0~0_combout\ & !\device0|state_reg.state_read~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \device0|Selector0~0_combout\,
	datad => \device0|state_reg.state_read~regout\,
	combout => \device0|Selector0~1_combout\);

-- Location: LCFF_X12_Y1_N19
\device0|tri_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|Selector0~1_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|tri_reg~regout\);

-- Location: LCCOMB_X8_Y2_N8
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

-- Location: LCFF_X8_Y2_N9
\device0|data_write_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[1]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(1));

-- Location: LCFF_X8_Y2_N23
\device0|data_write_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(2),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(2));

-- Location: LCCOMB_X9_Y2_N6
\Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datac => \Add0~6_combout\,
	combout => \Selector19~0_combout\);

-- Location: LCFF_X9_Y2_N7
\count_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector19~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(3));

-- Location: LCCOMB_X8_Y2_N0
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

-- Location: LCFF_X8_Y2_N1
\device0|data_write_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[3]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(3));

-- Location: LCFF_X8_Y2_N19
\device0|data_write_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(4),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(4));

-- Location: LCCOMB_X9_Y2_N10
\Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datac => \Add0~10_combout\,
	combout => \Selector17~0_combout\);

-- Location: LCFF_X9_Y2_N11
\count_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector17~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(5));

-- Location: LCFF_X13_Y1_N9
\device0|data_write_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(5),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(5));

-- Location: LCCOMB_X13_Y1_N10
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

-- Location: LCFF_X13_Y1_N11
\device0|data_write_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[6]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(6));

-- Location: LCCOMB_X14_Y1_N8
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

-- Location: LCFF_X14_Y1_N9
\device0|data_write_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[7]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(7));

-- Location: LCFF_X13_Y1_N13
\device0|data_write_reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(8),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(8));

-- Location: LCCOMB_X8_Y1_N30
\Selector13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datac => \Add0~18_combout\,
	combout => \Selector13~0_combout\);

-- Location: LCFF_X9_Y1_N29
\count_reg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector13~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(9));

-- Location: LCCOMB_X13_Y1_N26
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

-- Location: LCFF_X13_Y1_N27
\device0|data_write_reg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[9]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(9));

-- Location: LCFF_X13_Y1_N17
\device0|data_write_reg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(10),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(10));

-- Location: LCCOMB_X10_Y1_N14
\Selector11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_reg.state_idle~regout\,
	datac => \Add0~22_combout\,
	combout => \Selector11~0_combout\);

-- Location: LCFF_X9_Y1_N15
\count_reg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector11~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(11));

-- Location: LCFF_X13_Y1_N15
\device0|data_write_reg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(11),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(11));

-- Location: LCCOMB_X8_Y1_N6
\Selector10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_reg.state_idle~regout\,
	datad => \Add0~24_combout\,
	combout => \Selector10~0_combout\);

-- Location: LCFF_X9_Y1_N17
\count_reg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector10~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(12));

-- Location: LCCOMB_X14_Y1_N26
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

-- Location: LCFF_X14_Y1_N27
\device0|data_write_reg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[12]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(12));

-- Location: LCCOMB_X13_Y1_N28
\device0|data_write_reg[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[13]~feeder_combout\ = count_reg(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(13),
	combout => \device0|data_write_reg[13]~feeder_combout\);

-- Location: LCFF_X13_Y1_N29
\device0|data_write_reg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[13]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(13));

-- Location: LCCOMB_X10_Y1_N0
\Selector8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\state_reg.state_idle~regout\ & \Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state_reg.state_idle~regout\,
	datad => \Add0~28_combout\,
	combout => \Selector8~0_combout\);

-- Location: LCFF_X10_Y1_N1
\count_reg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector8~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \count_reg[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count_reg(14));

-- Location: LCFF_X13_Y1_N7
\device0|data_write_reg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(14),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(14));

-- Location: LCCOMB_X12_Y1_N16
\device0|data_write_reg[15]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_write_reg[15]~feeder_combout\ = count_reg(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(15),
	combout => \device0|data_write_reg[15]~feeder_combout\);

-- Location: LCFF_X12_Y1_N17
\device0|data_write_reg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_write_reg[15]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|we_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_write_reg\(15));

-- Location: LCFF_X19_Y4_N29
\device0|data_read_reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[8]~8\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(8));

-- Location: LCCOMB_X19_Y4_N18
\device0|data_read_reg[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[9]~feeder_combout\ = \sram_dq[9]~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[9]~9\,
	combout => \device0|data_read_reg[9]~feeder_combout\);

-- Location: LCFF_X19_Y4_N19
\device0|data_read_reg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[9]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(9));

-- Location: LCFF_X19_Y4_N13
\device0|data_read_reg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[10]~10\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(10));

-- Location: LCCOMB_X13_Y2_N24
\device0|data_read_reg[11]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[11]~feeder_combout\ = \sram_dq[11]~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[11]~11\,
	combout => \device0|data_read_reg[11]~feeder_combout\);

-- Location: LCFF_X13_Y2_N25
\device0|data_read_reg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[11]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(11));

-- Location: LCFF_X19_Y4_N31
\device0|data_read_reg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[12]~12\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(12));

-- Location: LCCOMB_X13_Y2_N10
\device0|data_read_reg[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[13]~feeder_combout\ = \sram_dq[13]~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[13]~13\,
	combout => \device0|data_read_reg[13]~feeder_combout\);

-- Location: LCFF_X13_Y2_N11
\device0|data_read_reg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[13]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(13));

-- Location: LCCOMB_X13_Y2_N4
\device0|data_read_reg[14]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[14]~feeder_combout\ = \sram_dq[14]~14\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[14]~14\,
	combout => \device0|data_read_reg[14]~feeder_combout\);

-- Location: LCFF_X13_Y2_N5
\device0|data_read_reg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[14]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(14));

-- Location: LCFF_X19_Y4_N17
\device0|data_read_reg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sram_dq[15]~15\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(15));

-- Location: LCCOMB_X19_Y4_N26
\device0|data_read_reg[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[0]~feeder_combout\ = \sram_dq[0]~0\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[0]~0\,
	combout => \device0|data_read_reg[0]~feeder_combout\);

-- Location: LCFF_X19_Y4_N27
\device0|data_read_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[0]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(0));

-- Location: LCCOMB_X19_Y4_N4
\device0|data_read_reg[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[1]~feeder_combout\ = \sram_dq[1]~1\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[1]~1\,
	combout => \device0|data_read_reg[1]~feeder_combout\);

-- Location: LCFF_X19_Y4_N5
\device0|data_read_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[1]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(1));

-- Location: LCCOMB_X19_Y4_N22
\device0|data_read_reg[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[2]~feeder_combout\ = \sram_dq[2]~2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[2]~2\,
	combout => \device0|data_read_reg[2]~feeder_combout\);

-- Location: LCFF_X19_Y4_N23
\device0|data_read_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[2]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(2));

-- Location: LCCOMB_X19_Y4_N24
\device0|data_read_reg[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[3]~feeder_combout\ = \sram_dq[3]~3\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[3]~3\,
	combout => \device0|data_read_reg[3]~feeder_combout\);

-- Location: LCFF_X19_Y4_N25
\device0|data_read_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[3]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(3));

-- Location: LCCOMB_X19_Y4_N10
\device0|data_read_reg[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[4]~feeder_combout\ = \sram_dq[4]~4\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[4]~4\,
	combout => \device0|data_read_reg[4]~feeder_combout\);

-- Location: LCFF_X19_Y4_N11
\device0|data_read_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[4]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(4));

-- Location: LCCOMB_X19_Y4_N8
\device0|data_read_reg[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[5]~feeder_combout\ = \sram_dq[5]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[5]~5\,
	combout => \device0|data_read_reg[5]~feeder_combout\);

-- Location: LCFF_X19_Y4_N9
\device0|data_read_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[5]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(5));

-- Location: LCCOMB_X19_Y4_N2
\device0|data_read_reg[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[6]~feeder_combout\ = \sram_dq[6]~6\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[6]~6\,
	combout => \device0|data_read_reg[6]~feeder_combout\);

-- Location: LCFF_X19_Y4_N3
\device0|data_read_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[6]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(6));

-- Location: LCCOMB_X19_Y4_N20
\device0|data_read_reg[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|data_read_reg[7]~feeder_combout\ = \sram_dq[7]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sram_dq[7]~7\,
	combout => \device0|data_read_reg[7]~feeder_combout\);

-- Location: LCFF_X19_Y4_N21
\device0|data_read_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|data_read_reg[7]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|state_reg.state_read~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|data_read_reg\(7));

-- Location: LCCOMB_X8_Y2_N12
\device0|addr_reg[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[0]~feeder_combout\ = count_reg(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(0),
	combout => \device0|addr_reg[0]~feeder_combout\);

-- Location: LCFF_X8_Y2_N13
\device0|addr_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[0]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(0));

-- Location: LCCOMB_X8_Y2_N10
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

-- Location: LCFF_X8_Y2_N11
\device0|addr_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[1]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(1));

-- Location: LCFF_X8_Y2_N25
\device0|addr_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(2),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(2));

-- Location: LCCOMB_X8_Y2_N2
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

-- Location: LCFF_X8_Y2_N3
\device0|addr_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[3]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(3));

-- Location: LCFF_X8_Y2_N21
\device0|addr_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(4),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(4));

-- Location: LCFF_X13_Y1_N21
\device0|addr_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(5),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(5));

-- Location: LCCOMB_X13_Y1_N18
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

-- Location: LCFF_X13_Y1_N19
\device0|addr_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[6]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(6));

-- Location: LCCOMB_X14_Y1_N12
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

-- Location: LCFF_X14_Y1_N13
\device0|addr_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[7]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(7));

-- Location: LCFF_X13_Y1_N5
\device0|addr_reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(8),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(8));

-- Location: LCCOMB_X13_Y1_N22
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

-- Location: LCFF_X13_Y1_N23
\device0|addr_reg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[9]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(9));

-- Location: LCFF_X13_Y1_N25
\device0|addr_reg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(10),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(10));

-- Location: LCFF_X13_Y1_N31
\device0|addr_reg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(11),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(11));

-- Location: LCCOMB_X14_Y1_N2
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

-- Location: LCFF_X14_Y1_N3
\device0|addr_reg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[12]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(12));

-- Location: LCCOMB_X13_Y1_N0
\device0|addr_reg[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[13]~feeder_combout\ = count_reg(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(13),
	combout => \device0|addr_reg[13]~feeder_combout\);

-- Location: LCFF_X13_Y1_N1
\device0|addr_reg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[13]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(13));

-- Location: LCFF_X13_Y1_N3
\device0|addr_reg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(14),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(14));

-- Location: LCFF_X8_Y1_N1
\device0|addr_reg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => count_reg(15),
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(15));

-- Location: LCCOMB_X8_Y1_N22
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

-- Location: LCFF_X8_Y1_N23
\device0|addr_reg[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[16]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(16));

-- Location: LCCOMB_X8_Y1_N8
\device0|addr_reg[17]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|addr_reg[17]~feeder_combout\ = count_reg(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count_reg(17),
	combout => \device0|addr_reg[17]~feeder_combout\);

-- Location: LCFF_X8_Y1_N9
\device0|addr_reg[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|addr_reg[17]~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	ena => \device0|addr_reg[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|addr_reg\(17));

-- Location: LCCOMB_X12_Y1_N12
\device0|oe_reg~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \device0|oe_reg~feeder_combout\ = \device0|oe_next~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \device0|oe_next~0_combout\,
	combout => \device0|oe_reg~feeder_combout\);

-- Location: LCFF_X12_Y1_N13
\device0|oe_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \device0|oe_reg~feeder_combout\,
	aclr => \ALT_INV_key~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|oe_reg~regout\);

-- Location: LCFF_X12_Y1_N3
\device0|we_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \device0|we_next~0_combout\,
	aclr => \ALT_INV_key~combout\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \device0|we_reg~regout\);

-- Location: PIN_R20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_R19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_U19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_Y19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_T18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_V19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_U18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_W22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AB3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AB4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AA5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AB10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AA11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AB11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_V11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_W11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_Y10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_U10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_R10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_Y6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AA10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AB5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_Y7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_W7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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


