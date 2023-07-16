-------------------------------------------------------------------------------
--
-- Title       : root_picker
-- Design      : HW2
-- Author      : LENOVO
-- Company     : IUST
--
-------------------------------------------------------------------------------
--
-- File        : D:\My_Designs\CAD\HW2\src\q2.vhd
-- Generated   : Thu May 25 14:13:34 2023
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
--{entity {root_picker} architecture {root_picker}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_STD.ALL;	
use work.types.all; -- in packages.vhd
-- use ieee.std_logic_arith.all;

entity root_picker is
	 port(
		 input : in STD_LOGIC_VECTOR(9 downto 0);
		 output : out STD_LOGIC_VECTOR(5 downto 0)
	     );
end root_picker;

--}} End of automatically maintained section

architecture Behavioral of root_picker is
begin

	-- enter your statements here --
	process (input)
        variable x : integer;
        variable result : std_logic_vector(5 downto 0) := (others => '0');
        variable y : integer;
    begin
		--y := INTEGER(ceil(SQRT(REAL(x))));
		
		x := to_integer(unsigned(input));
		y := 0;		
		-- y^2 = x
		while y**2 < x loop
			y := y + 1; -- ceil 			
		end loop;
		result := std_logic_vector(to_unsigned(y, 6));
        output <= result;
    end process;

end Behavioral;
