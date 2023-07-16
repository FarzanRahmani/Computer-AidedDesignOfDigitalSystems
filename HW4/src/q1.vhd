library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    port (
        clk : in std_logic;
        reset : in std_logic;
        input : in std_logic_vector(0 to 20);
        start_index : out std_logic_vector(4 downto 0);
        end_index : out std_logic_vector(4 downto 0);
        last_start_index : out std_logic_vector(4 downto 0);
        last_end_index : out std_logic_vector(4 downto 0)
    );
end fsm;

architecture behavioral of fsm is
    type state_type is (start, first_one, first_zero, second_one, second_zero, done);
    signal state : state_type;
    signal index : unsigned(4 downto 0);
    signal temp_start_index : unsigned(4 downto 0);
    signal temp_end_index : unsigned(4 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            state <= start;
            index <= (others => '0');
            temp_start_index <= (others => '0');
            temp_end_index <= (others => '0');
            start_index <= (others => '0');
            end_index <= (others => '0');
            last_start_index <= (others => '0');
            last_end_index <= (others => '0');
        elsif rising_edge(clk) then
            if index = "10101" then
                state <= done;
            else
                case state is
                    when start =>
                        if input(to_integer(index)) = '1' then
                            state <= first_one;
                        else
                            index <= index + 1;
                        end if;
                    when first_one =>
                        if input(to_integer(index)) = '0' then
                            -- temp_start_index <= index;
                            temp_start_index <= index + 1;
                            state <= first_zero;
                        end if;
                        index <= index + 1;
                    when first_zero =>
                        if input(to_integer(index)) = '1' then
                            -- temp_end_index <= index - 1;
                            temp_end_index <= index;
                            start_index <= std_logic_vector(temp_start_index);
                            end_index <= std_logic_vector(index);
                            state <= second_one;
                        else
                            index <= index + 1;
                        end if;
                    when second_one =>
                        if input(to_integer(index)) = '0' then
                            -- temp_start_index <= index;
                            temp_start_index <= index + 1;
                            state <= second_zero;
                        end if;
                        index <= index + 1;
                    when second_zero =>
                        if input(to_integer(index)) = '1' then
                            -- temp_end_index <= index - 1;
                            temp_end_index <= index;
                            last_start_index <= std_logic_vector(temp_start_index);
                            last_end_index <= std_logic_vector(index);
                            state <= second_one;
                        else
                            index <= index + 1;
                        end if;
                    when done =>
                        null; -- do nothing
                end case;
            end if ;
        end if;
    end process;

end behavioral;