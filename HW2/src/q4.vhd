library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Alarm_Clock is
    Port (
        clk : in STD_LOGIC;-- second pass
        reset : in STD_LOGIC;
        clock_set : in STD_LOGIC;
        alarm_set : in STD_LOGIC;
        alarm_stop : in STD_LOGIC;
        input_time : in STD_LOGIC_VECTOR(13 downto 0);
        on_alarm : out STD_LOGIC := '0'
    );
end Alarm_Clock;

architecture Behavioral of Alarm_Clock is
begin

    process(clk)

    variable current_time : unsigned(13 downto 0) := (others => '0');
    -- current_time(3 downto 0) --> LSB of minute[0 to 9]
    -- current_time(7 downto 4) --> MSB of minute[0 to 5] max 59
    -- current_time(11 downto 8) --> LSB of hour[0 to 9]
    -- current_time(13 downto 12) --> MSB of hour[0 to 2] max 23
    variable alarm_time : unsigned(13 downto 0) := (others => 'U');
    variable second : integer range 0 to 59 := 0;

    begin							 										 
		
		if rising_edge(clk) then
            second := second + 1;
            if second = 59 then
                second := 0;
			else
				second := second + 1;
            end if;

			if second = 0 then
                if current_time(3 downto 0) = "1001" then
                    current_time(3 downto 0) := "0000";
                    if current_time(7 downto 4) = "0101" then
                        current_time(7 downto 4) := "0000";
                        if current_time(11 downto 8) = "1001" then
                            current_time(11 downto 8) := "0000";
                            current_time(13 downto 12) := current_time(13 downto 12) + 1;
                        elsif (current_time(11 downto 8) = "0011" and current_time(13 downto 12) = "10") then
                            current_time(11 downto 8) := "0000";
                            current_time(13 downto 12) := "00";
                        else
                            current_time(11 downto 8) := current_time(11 downto 8) + 1;
                        end if;
                    else
                        current_time(7 downto 4) := current_time(7 downto 4) + 1;
                    end if;
                else
                    current_time(3 downto 0) := current_time(3 downto 0) + 1;
                end if;
            end if;
        end if;
		
		----------------------------------------
		
		if reset = '1' then
            current_time := (others => '0');
			second := 0;
        end if;
		
		--------------------------------

        if clock_set = '1' then
            current_time := unsigned(input_time);
			second := 0;
        elsif alarm_set = '1' then
            alarm_time := unsigned(input_time);
        end if;

        ---------------------------------  	

        if current_time = alarm_time then
            on_alarm <= '1' after 1ns;
        elsif alarm_stop = '1' then
            on_alarm <= '0' after 1ns;
        end if;
        
        ----------------------------------

    end process;
	

end Behavioral;