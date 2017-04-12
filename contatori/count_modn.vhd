----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:19:01 11/20/2013 
-- Design Name: 
-- Module Name:    count_mod4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
USE ieee.numeric_std.ALL;
use ieee.math_real.all;

entity count_modn is
		generic(n:natural:=8);
		Port ( clock: in std_logic;
				 reset: in std_logic; --reset 0-attivo
				 en: in std_logic; 
				 count: out std_logic_vector(natural(ceil(log2(real(n))))-1 downto 0)
				 );
end count_modn;

architecture Behavioral of count_modn is

signal c: std_logic_vector(natural(ceil(log2(real(n))))-1 downto 0):=(others =>'0');

begin

process(clock,reset,en,c)
begin
count <= c;

	if reset = '0' then
		c <= (others => '0');
	elsif rising_edge(clock) AND en = '1' then
		c <= std_logic_vector(unsigned(c) + 1);
	end if;

end process;

end Behavioral;

