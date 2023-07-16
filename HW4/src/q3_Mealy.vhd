library ieee;
use ieee.std_logic_1164.all;

entity mealy_fsm is
    port (
        clk : in std_logic;
        reset : in std_logic;
        input : in std_logic;
        output : out std_logic
    );
end mealy_fsm;

architecture behavioral of mealy_fsm is
    type state_type is (s0, s1, s2, s3);
    signal state : state_type;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            state <= s0;
            -- output <= '0';
        elsif rising_edge(clk) then
        -- elsif (clk'event AND clk = '1') THEN
            case state is
                when s0 =>
                    if input = '1' then
                        state <= s1;
                    end if;
                    -- output <= '0';
                when s1 =>
                    if input = '1' then
                        state <= s2;
                    else
                        state <= s0;
                    end if;
                    -- output <= '0';
                when s2 =>
                    if input = '1' then
                        state <= s3;
                    else
                        state <= s0;
                    end if;
                    -- output <= '0';
                when s3 =>
                    if input = '0' then
                        -- output <= '1'; -- the subsequence "1110" was detected
                        state <= s0; -- transition back to the initial state to search for the next occurrence of the subsequence
                    else
                        -- output <= '0';
                        state <= s3; -- stay in the current state until a '0' is encountered
                    end if;
            end case;
        end if;
    end process;

    output <= '1' when (state = s3 AND input = '0') ELSE              
          '0';


end behavioral;