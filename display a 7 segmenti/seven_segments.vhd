----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:41:31 11/20/2013 
-- Design Name: 
-- Module Name:    seven_segments - Behavioral 
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


entity seven_segments is
			Port ( clock: 		 in std_logic;
					 dots:  		 in std_logic_vector(3 downto 0);
					 reset: 		 in std_logic; --reset 0-attivo
					 inputs: 	 in std_logic_vector(15 downto 0);
					 en_display: in std_logic_vector(3 downto 0);
					 anodes: 	 out std_logic_vector(3 downto 0);
					 cathodes: 	 out std_logic_vector(7 downto 0));
end seven_segments;

architecture Structural of seven_segments is

component clock_filter 
			generic( clock_frequency_in 	: integer := 50000000;
						clock_frequency_out 	: integer := 5000000);
			Port ( 	clock_in 	: in  STD_LOGIC;
						reset 		: in STD_LOGIC; --reset 0-attivo
						clock_out 	: out  STD_LOGIC);
end component;

component anodes_manager 
			Port( count: 		in std_logic_vector(1 downto 0);
				   en: 	 		in std_logic_vector(3 downto 0);
					reset: 		in std_logic; --reset 0-attivo
					to_anodes:  out std_logic_vector(3 downto 0));
end component;			

component cathodes_manager 
			Port( inputs:  	 in std_logic_vector (15 downto 0);
					dots: 		 in std_logic_vector (3 downto 0);
					count: 		 in std_logic_vector(1 downto 0);
					to_cathodes: out std_logic_vector(7 downto 0));	
end component;

signal clock_en: std_logic;
signal count: std_logic_vector(1 downto 0);

begin

div_clock: clock_filter
		  generic map (clock_frequency_in => 50000000,clock_frequency_out => 100)
		  port map (clock, reset, clock_en);
								
count4: entity work.count_modn 
		  generic map(4) 
		  port map (clock, reset, clock_en, count);
		  
anod_mng: anodes_manager 
		  port map(count,en_display,reset,anodes);
		  
catho_mng: cathodes_manager 
		  port map(inputs,dots,count,cathodes);

end Structural;
