----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:49:34 10/08/2013 
-- Design Name: 
-- Module Name:    mux2_1 - Behavioral 
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

entity mux2_1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           o : out  STD_LOGIC);
end mux2_1;

architecture dataflow of mux2_1 is

signal n_sel : std_logic;

begin

	 o <= (a and n_sel) or (b and sel);
	 n_sel <= not sel;

--	with sel select
--		o <= a when '0',
--				b when '1',
--				'X' when others;
	
end dataflow;

