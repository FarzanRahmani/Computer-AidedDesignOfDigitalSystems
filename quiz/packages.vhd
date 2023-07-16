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