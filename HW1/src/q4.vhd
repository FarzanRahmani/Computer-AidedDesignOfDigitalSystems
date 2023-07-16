-------------------------------------------------------------------------------
--
-- Title       : DOT_PRODUCT
-- Design      : HW1
-- Author      : LENOVO
-- Company     : IUST
--
-------------------------------------------------------------------------------
--
-- File        : D:\My_Designs\CAD\HW1\src\q4.vhd
-- Generated   : Sat Mar 25 20:09:41 2023
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
--{entity {DOT_PRODUCT} architecture {DOT_PRODUCT}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_STD.ALL;	
use work.types.all; -- in packages.vhd

entity DOT_PRODUCT is
	 port(
		 A : in int_array_8;
		 B : in int_array_8;
		 O : out INTEGER
	     );
end DOT_PRODUCT;

--}} End of automatically maintained section

architecture DOT_PRODUCT of DOT_PRODUCT is
begin

	-- enter your statements here --
	process(A, B) 
	variable tmp : integer;		
	begin
	tmp := 0;
	for i in 0 to 7 loop
		-- tmp += A(i) * B(i);
		tmp := tmp + (A(i) * B(i));
	end loop;
	O <= tmp;
	
	end process;		

end DOT_PRODUCT;
