library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.image_filter_pkg.ALL;
USE std.textio.all;

entity main_component is
    generic (
        N: integer := 28 -- 1, 2, 4, 7, 14, 28
    );
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        image_in : in image_t;
        filter_in : in filter_t;
        feature_map: inout image_t
    );
end entity main_component;

-- Implement the main component architecture to instantiate the convolution units and connect 
--       them accordingly:
architecture structural of main_component is
	-- Instantiate convolution units and interconnect them
    component convolution_unit
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            window : in image_t;
            filter : in filter_t;
            result : out real
        );
    end component;

    type CU_array is array(0 to N-1) of real;
    signal CU_outputs: CU_array;
    signal win: image_t;
    signal result_map: image_t := (others => (others => 0));
    subtype index_t is integer range 0 to N-1;
    signal current_index: index_t := 0;

begin  -- Implement the main component architecture here
    -- Instantiate convolution units
    gen_units: for i in 0 to N-1 generate
        cu: convolution_unit
            port map (clk, reset, win, filter_in, CU_outputs(i));
    end generate;

    process(clk, reset)
        variable x, y: integer;
    begin
        if reset = '1' then
            current_index <= 0;
            feature_map <= (others => (others => 0));
        elsif rising_edge(clk) then
            -- Get the 3x3 window for the current position
            for row in 0 to 2 loop
                for col in 0 to 2 loop
                    x := (current_index mod (IMAGE_SIZE_X - FILTER_SIZE + 1)) + row;
                    y := (current_index / (IMAGE_SIZE_X - FILTER_SIZE + 1)) + col;
                    win(row, col) <= image_in(x, y);
                end loop;
            end loop;

            -- Store the result in the feature map and update the current index
            x := current_index mod (IMAGE_SIZE_X - FILTER_SIZE + 1);
            y := current_index / (IMAGE_SIZE_X - FILTER_SIZE + 1);
            result_map(x, y) <= integer(CU_outputs(current_index));
            feature_map <= result_map;
            if current_index = N - 1 then
                current_index <= 0;
            else
                current_index <= current_index + 1;
            end if;
        end if;
    end process;

    
    -- Save the result into a txt file
    process	(feature_map)
        -- file result_file: text;
        file result_file : text open write_mode is "feature_map.txt";
		variable row          : line;
    begin
        -- file_open(result_file, "feature_map.txt", write_mode);
        -- for i in 0 to 28 loop
        --     for j in 0 to 28 loop
        for i in 0 to IMAGE_SIZE_X - FILTER_SIZE loop
            for j in 0 to IMAGE_SIZE_X - FILTER_SIZE loop
                -- write(result_file, feature_map(i, j));
                -- write(result_file, " ");
                write(row,feature_map(i, j), right, 15);
                write(row," ", right, 15);
            end loop;
            -- writeline(result_file, "");
            writeline(result_file,row);
        end loop;
        file_close(result_file);
    end process;
end architecture structural;