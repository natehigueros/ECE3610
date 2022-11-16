----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2022 02:48:34 PM
-- Design Name: 
-- Module Name: top_controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity top_controller is
--  Port ( );
end top_controller;

architecture Behavioral of top_controller is
    -- UART component
    component UART_Top is
         Port (clk, rst, sdata : in std_logic;
               sdata_out: out std_logic;
               LED_out : out std_logic_vector(7 downto 0));
    end component;
    
    -- SPI Component
    component spi_top is
        generic(Volt_Max : in integer := 12);
        Port(reset, clk: in std_logic;
           data_in_top: in std_logic_vector(5 downto 0);
           toggle : in std_logic;
           toggle_display : out std_logic;
           load_button : in std_logic;
           CS0_n, spi_clk, sdata_0, sdata_1: out std_logic
        );
    end component;
    
    -- XADC 
    
    -- Add RAM 1
    
    -- Add RAM 2
    
    
    
    

begin

UUT0 : UART_Top port map(clk => ,
                         rst => ,
                         sdata => ,
                         sdata_out => ,
                         LED__out =>
                         );
                         
UUT1 : spi_top port map(Volt_Max => ,
                        reset => ,
                        clk => ,
                        data_in_top => ,
                        toggle => ,
                        toggle_display => ,
                        load_button => ,
                        CS0_n => ,
                        spi_clk => ,
                        sdata_0 => ,
                        sdata_1 =>
                        );

    process(clk, rst)
        begin
            
    end process;



end Behavioral;
