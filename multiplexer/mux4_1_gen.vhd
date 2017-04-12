----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:50:20 12/11/2013 
-- Design Name: 
-- Module Name:    mux4_1_gen - Structural 
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

entity mux4_1_gen is
		generic(n:natural:=4);
		Port( input0: in std_logic_vector(n-1 downto 0);
				input1: in std_logic_vector(n-1 downto 0);
				input2: in std_logic_vector(n-1 downto 0);
				input3: in std_logic_vector(n-1 downto 0);
				sel: in std_logic_vector(1 downto 0);
				output: out std_logic_vector(n-1 downto 0));
end mux4_1_gen;

architecture Structural of mux4_1_gen is

signal s0: std_logic_vector(n-1 downto 0);
signal s1: std_logic_vector(n-1 downto 0);

begin

m1: entity work.mux2_1_gen generic map(n) port map(input0,input1,sel(0),s0);
m2: entity work.mux2_1_gen generic map(n) port map(input2,input3,sel(0),s1);
m3: entity work.mux2_1_gen generic map(n) port map(s0,s1,sel(1),output);

end Structural;

