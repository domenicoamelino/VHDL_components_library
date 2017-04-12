library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1_gen is
generic(n:natural:=1);
    Port ( a : in  STD_LOGIC_VECTOR(n-1 downto 0);
           b : in  STD_LOGIC_VECTOR(n-1 downto 0);
           sel : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR(n-1 downto 0));
end mux2_1_gen;

architecture dataflow of mux2_1_gen is

signal n_sel : std_logic;

begin

	n_sel <= not sel;
	e: for i in 0 to n-1 generate
		o(i) <= (a(i) and n_sel) or (b(i) and sel);
	end generate;
	
end dataflow;