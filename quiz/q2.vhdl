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

--------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.ALL;	
use work.types.all; -- in packages.vhd


entity avg_median is
    Port ( x0, x1, x2, x3, x4, x5, x6 : in  std_logic_vector(7 downto 0);
           avg : out  std_logic_vector(7 downto 0);
           median : out  std_logic_vector(7 downto 0));
end avg_median;

architecture Behavioral of avg_median is
    subtype int8 is signed(7 downto 0);
    type int8_array is array (0 to 6) of int8;

    function sort(arr: int8_array) return int8_array is
        variable temp: int8_array := arr;
    begin
        for i in temp'range loop
            for j in temp'low to temp'high-1 loop
                if temp(j) > temp(j+1) then
                    temp(j) := temp(j) xor temp(j+1);
                    temp(j+1) := temp(j) xor temp(j+1);
                    temp(j) := temp(j) xor temp(j+1);
                end if;
            end loop;
        end loop;
        return temp;
    end function;

begin
    process(x0, x1, x2, x3, x4, x5, x6)
        variable sum: int8 := (others => '0');
        variable sorted_x: int8_array;
        variable x: int8_array := (int8(signed(x0)), int8(signed(x1)), int8(signed(x2)), int8(signed(x3)), int8(signed(x4)), int8(signed(x5)), int8(signed(x6)));
    begin
        for i in x'range loop
            sum := sum + x(i);
        end loop;
        avg <= std_logic_vector(sum / 7);

        sorted_x := sort(x);
        median <= std_logic_vector(sorted_x(3));
    end process;
end Behavioral;



--library IEEE;                         
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.Numeric_STD.ALL;	
--use work.types.all; -- in packages.vhd
--entity MedianAverage is
--    port (
--        num1, num2, num3, num4, num5, num6, num7: in std_logic_vector(7 downto 0);
--        median: out std_logic_vector(7 downto 0);
--        average: out std_logic_vector(7 downto 0)
--    );
--end MedianAverage;
--
--architecture Behavioral of MedianAverage is
--    type num_array is array (natural range <>) of std_logic_vector(7 downto 0);
--    signal numbers: num_array(0 to 6);
--    signal sorted: num_array(0 to 6);
--    signal sum: unsigned(7 downto 0);
--begin
--    -- Assign input values to the array
--    numbers(0) <= num1;
--    numbers(1) <= num2;
--    numbers(2) <= num3;
--    numbers(3) <= num4;
--    numbers(4) <= num5;
--    numbers(5) <= num6;
--    numbers(6) <= num7;
--
--    -- Sort the numbers in ascending order
--    process(numbers)
--        variable temp: std_logic_vector(7 downto 0);
--    begin
--        sorted <= numbers;
--        for i in 0 to 5 loop
--            for j in i+1 to 6 loop
--                if sorted(i) > sorted(j) then
--                    temp := sorted(i);
--                    sorted(i) := sorted(j);
--                    sorted(j) := temp;
--                end if;
--            end loop;
--        end loop;
--    end process;
--
--    -- Calculate the median
--    median <= sorted(3);
--
--    -- Calculate the average
--    process(numbers)
--        variable temp_sum: unsigned(7 downto 0) := (others => '0');
--    begin
--        for i in 0 to 6 loop
--            temp_sum := temp_sum + unsigned(numbers(i));
--        end loop;
--
--        sum <= temp_sum;
--        average <= std_logic_vector(sum(7 downto 0) / 7);
--    end process;
--end Behavioral;
