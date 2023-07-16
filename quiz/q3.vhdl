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



-----------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.ALL;	
use work.types.all; -- in packages.vhd

entity q3 is
  port(  mat1 : in farzan_mat;
  mat2 : in farzan_mat;
  mode : in std_logic;   
  output : out integer      );
end q3;
architecture behavioral of q3 is
begin    
	process(mat1, mat2, mode) 
	variable result : integer := 0;    
	begin
		result := 0;
	    if mode = '0' then -- mul
		   for i in 1 downto 0 loop    
			   for j in 1 downto 0 loop
		     		result := result + (to_integer(signed(mat1(i,j))) * to_integer(signed(mat2(i,j))));     
			   end loop;
		   end loop;  
		else -- divide
		   for i in 1 downto 0 loop
			   for j in 1 downto 0 loop  --
				   -- result := result + integer(to_integer(unsigned(mat1(i,j))) / to_integer(unsigned(mat2(i,j))));
				   if mat2(i,j) /= "0000" then
					   result := result + to_integer(unsigned(mat1(i,j))) / to_integer(unsigned(mat2(i,j)));
					end if;
		   end loop;  
	   end loop;
  end if;   
  output <= result;    
	end process;
end architecture behavioral;