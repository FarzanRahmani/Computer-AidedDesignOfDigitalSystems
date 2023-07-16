-- Create the convolution unit entity:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.image_filter_pkg.ALL;

entity convolution_unit is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        window : in image_t;
        filter : in filter_t;
        result : out real
    );
end entity convolution_unit;

-- Implement the convolution unit architecture:
architecture behavioral of convolution_unit is
    begin
        process(clk, reset)
		variable tmp: real := 0.0;
        begin
            if reset = '1' then
                result <= 0.0;
            elsif rising_edge(clk) then
                -- result <= real( (window(0,0) * filter(0,0) + window(0,1) * filter(0,1) + window(0,2) * filter(0,2) +
                --             window(1,0) * filter(1,0) + window(1,1) * filter(1,1) + window(1,2) * filter(1,2) +
                --             window(2,0) * filter(2,0) + window(2,1) * filter(2,1) + window(2,2) * filter(2,2)) / 9.0 );
				tmp := 0.0;
                for i in 0 to 2 loop
                    for j in 0 to 2 loop
                        tmp := tmp + real(window(i, j)) * real(filter(i, j));
                    end loop;
                end loop;
                tmp := tmp / 9.0;
				result <= tmp;
            end if;
        end process;
    end architecture behavioral;