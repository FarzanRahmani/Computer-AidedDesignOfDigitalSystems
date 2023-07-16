library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q2_fsm is
    generic (
        n : positive := 17
    );
    port (
        clk : in std_logic;
        reset : in std_logic;
        input : in std_logic_vector(n-1 downto 0);
        output : out std_logic_vector(n-1 downto 0)
    );
end q2_fsm;

architecture behavioral of q2_fsm is
    type state_type is (start, s1, s2, s3, s4, s5, s6, done);
    type state_type_2 is (start_2, s1_2, s2_2, s3_2, s4_2, done_2);
    signal state : state_type;
    signal state_2 : state_type_2;
    signal index : unsigned(4 downto 0);
    signal index_2 : unsigned(4 downto 0);
    signal temp_output : std_logic_vector(n-1 downto 0);
    signal temp_output_2 : std_logic_vector(n-1 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            state <= start;
            index <= (others => '0');
            temp_output <= (others => '0');
            state_2 <= start_2; -----
            index_2 <= (others => '0');
            temp_output_2 <= (others => '0'); 
        elsif rising_edge(clk) then
            if index = n-1 then
                null;
			else				
	            case state is
	                when start =>
	                    if input(to_integer(index)) = '1' then
	                        state <= s1;
	                    end if;
	                    index <= index + 1;
	                when s1 =>
	                    if input(to_integer(index)) = '0' then
	                        state <= s2;
	                    end if;
	                    index <= index + 1;
	                when s2 =>
	                    if input(to_integer(index)) = '0' then
	                        state <= s3;
	                    end if;
	                    index <= index + 1;
	                when s3 =>
	                    if input(to_integer(index)) = '1' then
	                        state <= s4;
	                    end if;
	                    index <= index + 1;
	                when s4 =>
	                    if input(to_integer(index)) = '0' then
	                        state <= s5;
	                    end if;
	                    index <= index + 1;
	                when s5 =>
	                    if input(to_integer(index)) = '0' then
	                        state <= s6;
	                    end if;
	                    index <= index + 1;
	                when s6 =>
	                    if input(to_integer(index)) = '1' then
	                        temp_output <= not input; -- invert the input
	                        state <= done; -- transition to the done state
	                    else
	                        index <= index + 1; -- continue searching for the subsequence "1001001"
	                    end if;
	                when done =>
	                    null; -- do nothing
	            end case;	
            end if;

            if index_2 = n-1 then
                null;
            else  
	            case state_2 is
	                when start_2 =>
	                    if input(to_integer(index_2)) = '0' then
	                        state_2 <= s1_2;
	                    end if;
	                    index_2 <= index_2 + 1;
	                when s1_2 =>
	                    if input(to_integer(index_2)) = '0' then
	                        state_2 <= s2_2;
	                    end if;
	                    index_2 <= index_2 + 1;
	                when s2_2 =>
	                    if input(to_integer(index_2)) = '1' then
	                        state_2 <= s3_2;
	                    end if;
	                    index_2 <= index_2 + 1;
	                when s3_2 =>
	                    if input(to_integer(index_2)) = '0' then
	                        state_2 <= s4_2;
	                    end if;
	                    index_2 <= index_2 + 1;
	                when s4_2 =>
	                    if input(to_integer(index_2)) = '0' then
	                        temp_output_2 <= std_logic_vector(unsigned(input) + 1); -- add one to the input 
	                        state_2 <= done_2; -- transition to the done state
	                    end if;
	                    index_2 <= index_2 + 1; -- continue searching for the subsequence "00100"
	                when done_2 =>
	                    null; -- do nothing
	            end case;            
            end if;
        end if;
    end process;

    -- update the output
    output <= (not input) when state = done else 
    std_logic_vector(unsigned(input) + 1) when state_2 = done_2 else
    input; -- default output is the input
	
	-- output <= temp_output when state = done else 
    --           temp_output_2 when state_2 = done_2 else
    --           input; -- default output is the input

end behavioral;