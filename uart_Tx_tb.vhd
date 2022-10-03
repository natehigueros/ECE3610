library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity receiver_tb is
--  Port ( );
end receiver_tb;

architecture Behavioral of receiver_tb is
component uart_tx is
    port ( clk : in std_logic; -- clock input
    reset : in std_logic; -- reset, active high
    pdata : in std_logic_vector(7 downto 0); -- parallel data in
    load : in std_logic; -- load signal, active high
    busy : out std_logic; -- busy indicator
    sdata : out std_logic); -- serial data out
end component;

signal clk_tb, load_tb, reset_tb, busy_tb: std_logic:= '0';
signal sdata_tb : std_logic:= '1';
signal pdata_tb: std_logic_vector(7 downto 0);
constant BIT_PERIOD: time := 8680ns;-- 868E-6; 

--procedure TX_BITS(
--        data : in std_logic_vector(7 downto 0);
--        signal tx_serial : out std_logic) is
--    begin
--        tx_serial <= '0';
--        wait for BIT_PERIOD; -- BIT_PERIOD is a constant that you need to calculate
        
--        for ii in 0 to 7 loop
--            tx_serial <= data(ii);
--            wait for BIT_PERIOD;
--        end loop;
         
--        tx_serial <= '1';
--        wait for BIT_PERIOD;
         
--    end TX_BITS;
begin
clk_tb<= not clk_tb after 5ns;
UUT: uart_tx port map( clk => clk_tb,
                  reset=> reset_tb,
                  sdata=> sdata_tb,
                  pdata=> pdata_tb,
                  load=> load_tb,
                  busy=> busy_tb);


process
begin
reset_tb <= '1';
wait for 10 ns;
reset_tb <= '0';
wait for BIT_PERIOD;
load_tb <= '1';
pdata_tb <= "00001111";
wait for BIT_PERIOD;
load_tb <= '0';

wait for 10 us;

wait for 10*BIT_PERIOD;
load_tb <= '1';
pdata_tb <= "10101010";
wait for BIT_PERIOD;
load_tb <= '0';


wait;
end process;
end Behavioral;