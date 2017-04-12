----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:47:32 12/21/2013 
-- Design Name: 
-- Module Name:    one_click - Behavioral 
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

entity one_click is
			Port(clock: STD_LOGIC;
				  button_in: in STD_LOGIC;
				  key_pressed: out STD_LOGIC);
end one_click;

architecture Behavioral of one_click is

	type state is (wait_press,pressed,wait_released); -- la lista degli stati
	
	signal currents, nexts: state := wait_press; -- lo stato iniziale è quello idle

begin

	evolution: process(clock)
		begin
			if rising_edge(clock) then
				currents <= nexts;
			end if;
		
		end process;
		
	
	outputs: process(currents,nexts,button_in)
		begin
		
			CASE currents IS
				WHEN wait_press => key_pressed <= '0';
									    if button_in = '1' then
											 nexts <= pressed;
										 else
											 nexts <= wait_press;
										 end if;
								
				WHEN pressed => 	key_pressed <= '1';
										nexts <= wait_released;
											
				WHEN wait_released =>
										key_pressed <= '0';
										if button_in = '0' then
											nexts <= wait_press;
										else
											nexts <= wait_released;
										end if;

				end CASE;
		end process;



end Behavioral;

