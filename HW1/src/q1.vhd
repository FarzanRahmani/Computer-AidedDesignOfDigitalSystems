library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_STD.ALL;
use work.types.all;
--use ieee.std_logic_arith.all;

entity MATRIX_ADDER is

	port (
	i: in matrix_3in3_of_std_logic_vector4; -- 3*3 matrix of std_logic_vector(0 to 3)
	o: out integer
		);
end MATRIX_ADDER;

architecture farzan of MATRIX_ADDER is
begin
	-- o <= i.sum();
	process(i) 
	variable result : integer := 0;
	begin
		--result := to_integer(unsigned(i(0,0))) + to_integer(unsigned(i(0,1))) + to_integer(unsigned(i(0,2))) +
        --      to_integer(unsigned(i(1,0))) + to_integer(unsigned(i(1,1))) + to_integer(unsigned(i(1,2))) +
        --      to_integer(unsigned(i(2,0))) + to_integer(unsigned(i(2,1))) + to_integer(unsigned(i(2,2)));
		
		result := 0;
		for j in 0 to 2 loop
			for k in 0 to 2 loop 
				result := to_integer(unsigned(i(j,k))) + result;				
				-- result := conv_integer(unsigned(i(j,k))) + result;				
				-- result := conv_integer(conv_unsigned(i(j,k), 4)) + result;				
			end loop;		
		end loop;
		
		o <= result;
	
	end process;		
		
	
end farzan;											   