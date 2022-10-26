library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity xadc is
  Port (clk, rst : in std_logic);
end xadc;

architecture Behavioral of xadc is

COMPONENT xadc_wiz_0
  PORT (
    di_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0); --data in
    daddr_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    den_in : IN STD_LOGIC;
    dwe_in : IN STD_LOGIC;
    drdy_out : OUT STD_LOGIC;
    do_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --data out
    dclk_in : IN STD_LOGIC;
    reset_in : IN STD_LOGIC;
    vp_in : IN STD_LOGIC;
    vn_in : IN STD_LOGIC;
    user_temp_alarm_out : OUT STD_LOGIC;
    vccint_alarm_out : OUT STD_LOGIC;
    vccaux_alarm_out : OUT STD_LOGIC;
    ot_out : OUT STD_LOGIC;
    channel_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    eoc_out : OUT STD_LOGIC;
    alarm_out : OUT STD_LOGIC;
    eos_out : OUT STD_LOGIC;
    busy_out : OUT STD_LOGIC
  );
END COMPONENT;

signal    di_in :  STD_LOGIC_VECTOR(15 DOWNTO 0):= x"0000";
signal    den_in :  STD_LOGIC;
signal    dwe_in :  STD_LOGIC:= '0';
signal    drdy_out :  STD_LOGIC;
signal    do_out :  STD_LOGIC_VECTOR(15 DOWNTO 0);
signal    dclk_in :  STD_LOGIC;
signal    reset_in :  STD_LOGIC;
signal    vp_in :  STD_LOGIC:= '0';
signal    vn_in :  STD_LOGIC:= '0';
signal    user_temp_alarm_out :  STD_LOGIC;
signal    vccint_alarm_out :  STD_LOGIC;
signal    vccaux_alarm_out :  STD_LOGIC;
signal    ot_out :  STD_LOGIC;
signal    channel_out :  STD_LOGIC_VECTOR(4 DOWNTO 0);
signal    eoc_out :  STD_LOGIC;
signal    alarm_out :  STD_LOGIC;
signal    eos_out : STD_LOGIC;
signal    busy_out : STD_LOGIC;
signal    daddr_in :  STD_LOGIC_VECTOR(6 DOWNTO 0):= "00"&channel_out;


begin
--top: xadc port map(clk=>clk_s, rst=> rst_s);

LAB4 : xadc_wiz_0
  PORT MAP (
    di_in => di_in,
    daddr_in => daddr_in,
    den_in => den_in,
    dwe_in => dwe_in,
    drdy_out => drdy_out,
    do_out => do_out,
    dclk_in => dclk_in,
    reset_in => reset_in,
    vp_in => vp_in,
    vn_in => vn_in,
    user_temp_alarm_out => user_temp_alarm_out,
    vccint_alarm_out => vccint_alarm_out,
    vccaux_alarm_out => vccaux_alarm_out,
    ot_out => ot_out,
    channel_out => channel_out,
    eoc_out => den_in,
    alarm_out => alarm_out,
    eos_out => eos_out,
    busy_out => busy_out
  );
process(clk,rst)
begin
    if rst = '1' then
        there is issue here
    elsif ot_out = '1' then
        
    end if;
end process;
end Behavioral;
