library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_top_tb is
--  Port ( );
end uart_top_tb;



architecture Behavioral of uart_top_tb is
component UART_Top is
     Port (clk, rst, sdata : in std_logic;
               sdata_out: out std_logic;
               LED_out : out std_logic_vector(7 downto 0));
               --state_LED: out std_logic_vector(2 downto 0) );
end component;

signal clk_tb, load_tb, reset_tb, busy_tb: std_logic:= '0';
signal sdata_tb : std_logic:= '1';
signal sdata_out_tb : std_logic:= '1';
--signal pdata_tb: std_logic_vector(7 downto 0);
signal LED_out_tb: std_logic_vector(7 downto 0);
signal state_LED_tb: std_logic_vector(2 downto 0);
constant BIT_PERIOD: time := 8680ns;-- 868E-6; 

procedure TX_BITS(
        data : in std_logic_vector(7 downto 0);
        signal tx_serial : out std_logic) is
    begin
        tx_serial <= '0';
        wait for BIT_PERIOD; -- BIT_PERIOD is a constant that you need to calculate
        
        for ii in 0 to 7 loop
            tx_serial <= data(ii);
            wait for BIT_PERIOD;
        end loop;
         
        tx_serial <= '1';
        wait for BIT_PERIOD;
         
    end TX_BITS;
begin
clk_tb<= not clk_tb after 5ns;
UUT: UART_TOP port map( clk => clk_tb,
                        rst => reset_tb,
                        sdata => sdata_tb,
                        sdata_out => sdata_out_tb,
                        LED_out => LED_out_tb
                        --state_LED => state_LED_tb
);


process
begin
reset_tb <= '1';
wait for 10 ns;
reset_tb <= '0';
TX_BITS(x"AB", sdata_tb);
wait for bit_period;
reset_tb <= '1';
wait for 10 ns;
reset_tb <= '0';
wait for bit_period;
TX_BITS(x"1f", sdata_tb);
wait for bit_period;
TX_BITS(x"4B", sdata_tb);



wait;
end process;
end Behavioral;