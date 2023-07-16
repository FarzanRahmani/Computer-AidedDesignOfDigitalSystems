library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity fsm is
    port (
        clk, input, reset : in std_logic;
        output : out std_logic
    );
end entity fsm;

architecture sim of fsm is
type state is (S0, S1, S2);
signal mealy_state: state;
begin
    process(clk, reset)
    begin
        if(clk'event and clk = '1') then
            if reset = '1' then
                mealy_state <= S0;
            else
                case mealy_state is
                    when S0 =>
                        if(input = '0') then
                            mealy_state <= S2;
                        else
                            mealy_state <= S1;
                        end if;

                    when S1 =>
                        if(input = '0') then
                            mealy_state <= S2;
                        else
                            mealy_state <= S1;
                        end if;

                    when S2 =>
                        mealy_state <= S2;
                    end case;
            end if;
        end if;
    end process;

    output <= '1' when ((mealy_state = S0 and input = '1')
                        or
                        (mealy_state = S1 and input = '1'))
                else '0';
end sim;