----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:53:20 11/20/2013 
-- Design Name: 
-- Module Name:    anodes_manager - Behavioral 
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

entity anodes_manager is
		 Port(
				count: in std_logic_vector(1 downto 0);
				en: in std_logic_vector(3 downto 0);
				reset: in std_logic; --reset 0-attivo
				to_anodes: out std_logic_vector(3 downto 0));
		 
end anodes_manager;

architecture Structural of anodes_manager is

signal anod: std_logic_vector(3 downto 0);

begin

to_anodes <= anod or en;

--al posto del seguente process viene utilizzata una rete combinatoria
--decisore: process(count)
--begin
--	CASE count IS
--		WHEN "00" => anod <= "1110"; -- gli anodi sono comandati con MOS PNP e quindi il segnale è 0-attivo
--		WHEN "01" => anod <= "1101";
--		WHEN "10" => anod <= "1011";
--		WHEN "11" => anod <= "0111";
--		WHEN others => anod <= "0000";
--	end CASE;
--end process;

--codificatore per gli anodi minimizzato
--anod(3 2 1 0) = a b c d
anod(3) <= not(anod(2)) or not(count(1));
anod(2) <= count(0) or not(count(1));
anod(1) <= not(count(0)) or count(1);
anod(0) <= (not(anod(2)) or count(0)) or not(reset);

end Structural;

