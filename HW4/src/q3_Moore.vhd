library ieee;
use ieee.std_logic_1164.all;

entity moore_fsm is
    port (
        clk : in std_logic;
        reset : in std_logic;
        input : in std_logic;
        output : out std_logic
    );
end moore_fsm;

architecture behavioral of moore_fsm is
    type state_type is (s0, s1, s2, s3, s4);
    signal state : state_type;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            state <= s0;
            -- output <= '0';
        elsif rising_edge(clk) then
            case state is
                when s0 =>
                    if input = '1' then
                        state <= s1;
                    end if;
                when s1 =>
                    if input = '1' then
                        state <= s2;
                    else
                        state <= s0;
                    end if;
                when s2 =>
                    if input = '1' then
                        state <= s3;
                    else
                        state <= s0;
                    end if;
                when s3 =>
                    if input = '0' then
                        state <= s4; -- transition to the final state where the output is set to '1'
                    else
                        state <= s3; -- stay in the current state until a '0' is encountered
                    end if;
                when s4 =>
                    -- output <= '1'; -- the subsequence "1110" was detected
                    -- state <= s0; -- transition back to the initial state to search for the next occurrence of the subsequence and set the output back to '0'
                    if input = '0' then
                        state <= s0; -- transition to the final state where the output is set to '1'
                    else
                        state <= s1; -- stay in the current state until a '0' is encountered
                    end if;
            end case;

            -- update the output based on the current state of the FSM (Moore model)
            case state is 
                when s4 => 
                    output <= '1'; 
                when others => 
                    output <= '0'; 
            end case; 

        end if;
    end process;

end behavioral;