----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:01 11/20/2013 
-- Design Name: 
-- Module Name:    cathodes_manager - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity cathodes_manager is
		Port( inputs: in std_logic_vector (15 downto 0);
				dots: in std_logic_vector (3 downto 0);
				count: in std_logic_vector(1 downto 0);
				to_cathodes: out std_logic_vector(7 downto 0)
		);
end cathodes_manager;

architecture Structural of cathodes_manager is
--													  --"ABCDEFG" -- logica negata
--constant zero 	: std_logic_vector(6 downto 0):="1000000";
--constant one 	: std_logic_vector(6 downto 0):="1111001";
--constant two 	: std_logic_vector(6 downto 0):="0100100";
--constant three  : std_logic_vector(6 downto 0):="0110000";
--constant four 	: std_logic_vector(6 downto 0):="0011001";
--constant five 	: std_logic_vector(6 downto 0):="0010010";
--constant six 	: std_logic_vector(6 downto 0):="0000010";
--constant seven  : std_logic_vector(6 downto 0):="1111000";
--constant eight  : std_logic_vector(6 downto 0):="0000000";
--constant nine 	: std_logic_vector(6 downto 0):="0010000";
--constant A 		: std_logic_vector(6 downto 0):="0001000";
--constant B 		: std_logic_vector(6 downto 0):="0000011";
--constant C 		: std_logic_vector(6 downto 0):="1000110";
--constant D 		: std_logic_vector(6 downto 0):="0100001";
--constant E 		: std_logic_vector(6 downto 0):="0000110";
--constant F 		: std_logic_vector(6 downto 0):="0001110";



signal nib: std_logic_vector(3 downto 0);
signal segments: std_logic_vector(6 downto 0);

begin

--al posto del process seguente viene utilizzato un mux
--select_display: process(count,nib,segments,inputs)
begin
	CASE count IS
		when "00" => nib <= inputs(3 downto 0);
		when "01" => nib <= inputs(7 downto 4);
		when "10" => nib <= inputs(11 downto 8);
		when "11" => nib <= inputs(15 downto 12);
		when others => nib <= (others => '0');
	end CASE;

end process;

--al posto del process seguente viene utilizzata una rete combinatoria
--coder: process(nib,segments)
--begin
--	CASE nib IS
--		when "0000" => segments <= zero;
--		when "0001" => segments <= one;
--		when "0010" => segments <= two;
--		when "0011" => segments <= three;
--		when "0100" => segments <= four;
--		when "0101" => segments <= five;
--		when "0110" => segments <= six;
--		when "0111" => segments <= seven;
--		when "1000" => segments <= eight;
--		when "1001" => segments <= nine;
--		when "1010" => segments <= A;
--		when "1011" => segments <= B;
--		when "1100" => segments <= C;
--		when "1101" => segments <= D;
--		when "1110" => segments <= E;
--		when "1111" => segments <= F;
--		when others => segments <= (others => '0');
--	end CASE;
--end process;

-- coder minimizzato con la full_simplify di SIS
segments(0) <= (nib(0) and not(segments(3)) and not(segments(4)))
				or	(not(nib(1)) and segments(3));
				
segments(1) <= (nib(0) and not(segments(4)) and not(segments(5)))
				or (nib(2) and not(segments(3)) and not(segments(5)));
				
segments(2) <= (nib(3) and nib(2) and not(segments(5)) ) or (not(nib(0)) and segments(5));	

segments(3) <= (not(nib(2)) and nib(1) and not(nib(0)) and not(segments(5)))
				or (nib(2) and nib(1) and nib(0))
				or (segments(5) and segments(6))
				or (not(nib(0)) and segments(4));

segments(4) <= (not(nib(3)) and not(nib(1)) and not(segments(6)))
				or (not(nib(2)) and not(nib(1)) and nib(0))
				or (not(nib(3)) and nib(0));
				
segments(5) <= (nib(3) and nib(2) and not(nib(1)) and not(segments(6)))
				or (not(nib(3)) and not(nib(2)) and not(segments(6)))
				or (nib(0) and segments(6));

segments(6) <= (nib(3) and nib(2) and not(nib(1)) and not(nib(0)))
				or (not(nib(3)) and nib(2) and nib(1) and nib(0))
				or (not(nib(3)) and not(nib(2)) and not(nib(1)));

				
to_cathodes <= segments & not dots(to_integer(unsigned(count))); 

end Structural;

