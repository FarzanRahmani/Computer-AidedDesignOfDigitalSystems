-------------------------------------------------------------------------------
--
-- Title       : sorter
-- Design      : HW2
-- Author      : LENOVO
-- Company     : IUST
--
-------------------------------------------------------------------------------
--
-- File        : D:\My_Designs\CAD\HW2\src\q1.vhd
-- Generated   : Thu May 25 12:46:54 2023
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {sorter} architecture {sorter}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_STD.ALL;	
use work.types.all; -- in packages.vhd
--use ieee.std_logic_arith.all;

entity sorter is
	 port(
		 input : in array_of_8bit;
		 output : out array_of_8bit
	     );
end sorter;

--}} End of automatically maintained section

architecture sorter of sorter is
begin

	-- enter your statements here --
	process(input)
	variable tmp : std_logic_vector(0 to 7);
	variable result : array_of_8bit;	
	begin
	--result(1) := input(1);
	result := input;
	--for I in 0 to input'length-1 loop
	for I in 0 to 9 loop
		--for J in 0 to input'length-1 loop
		for J in 0 to 9 loop
			if ( unsigned(result(I)) <= unsigned(result(J)) ) then
				tmp := result(I);
				result(I) := result(J);
				result(J) := tmp;
			end if;						
		end loop;				
	end loop;
	output <= result;
	
	end process;	

end sorter;
