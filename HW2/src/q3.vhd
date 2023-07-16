-------------------------------------------------------------------------------
--
-- Title       : one_by_one
-- Design      : HW2
-- Author      : LENOVO
-- Company     : IUST
--
-------------------------------------------------------------------------------
--
-- File        : D:\My_Designs\CAD\HW2\src\q3.vhd
-- Generated   : Thu May 25 14:59:50 2023
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
--{entity {one_by_one} architecture {one_by_one}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_STD.ALL;	
use work.types.all; -- in packages.vhd
--use ieee.std_logic_arith.all;

entity one_by_one is
	 port(
		 input : in BIT_VECTOR(16 downto 1);
		 output : out BIT_VECTOR(1 downto 0)
	     );
end one_by_one;

--}} End of automatically maintained section

architecture one_by_one of one_by_one is
begin

	-- enter your statements here --
	process( input ) 
	
	variable even_idx : integer;
	variable odd_idx : integer;
	
	begin
		even_idx := 0;
		odd_idx := 0;
		
		--- for I in 1 to input'length loop
		for I in 1 to 16 loop
			if ( I mod 2 = 0 ) then
				--even_idx := to_integer(to_unsigned(input(I),1)) + even_idx;
				--even_idx := to_integer( unsigned( input ) ) + even_idx;
				if ( ( input(I) = '1'  ) ) then
					even_idx := even_idx + 1;
				end if;				
			else
				-- odd_idx := to_integer(unsigned(input(I))) + odd_idx;
				if ( ( input(I) = '1'  ) ) then
					odd_idx := odd_idx + 1;
				end if;
			end if;			
		end loop;		
		
		if (even_idx mod 3 = 0) then
			output(1) <= '1';
		else
			output(1) <= '0';
		end	 if;
		
		if (odd_idx mod 5 = 0) then
			output(0) <= '1';
		else
		output(0) <= '0';
		end	 if;
	
	end process;	

end one_by_one;
