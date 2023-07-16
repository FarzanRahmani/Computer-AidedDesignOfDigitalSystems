library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.ALL;

package types is 
	
	type COMPLEX_NUM is record
	    -- x + iy
		x : real;
		y : real;
	end record;
	
	type int_array_8 is array(0 to 7) of integer;
	
	type matrix_3in3_of_std_logic_vector4 is array(0 to 2, 0 to 2) of std_logic_vector(0 to 3);
	
 	type farzan_mat is array (1 downto 0, 1 downto 0) of std_logic_vector(3 downto 0);   
	
end types;

-------------------------------------------------------------------------------
--
-- Title       : q1
-- Design      : quiz3
-- Author      : LENOVO
-- Company     : IUST
--
-------------------------------------------------------------------------------
--
-- File        : D:\My_Designs\CAD\quiz3\src\q1.vhd
-- Generated   : Fri Jun  2 09:48:54 2023
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
--{entity {q1} architecture {q1}}

library IEEE;
use IEEE.std_logic_1164.all;

entity q1 is
	 port(
		 in1 : in INTEGER;
		 in2 : in INTEGER;
		 gcd : out INTEGER;
		 lcm : out INTEGER
	     );
end q1;

--}} End of automatically maintained section

architecture q1 of q1 is
begin

	-- enter your statements here --
	process(in1, in2)
        variable temp_1, temp_2, remainder: INteger;
    begin
        temp_1 := in1;
        temp_2 := in2;
        while (temp_2 /= 0) loop
            remainder := temp_1 mod temp_2;
            temp_1 := temp_2;
            temp_2 := remainder;
        end loop;
        gcd <= temp_1;
        lcm <= in1 * in2 / temp_1;
    end process;

end q1;
