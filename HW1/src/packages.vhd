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
	
end types;