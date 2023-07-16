library ieee;  
use ieee.std_logic_1164.all;
use ieee.MATH_REAL.all;
use ieee.NUMERIC_STD.all; 
use work.mypackage.all;

entity AlarmClock is
    port (	
	    clk : in STD_LOGIC;
		clock: out unsigned(21 downto 0);	 
		alarms: out alarmarr;
		stopwatch: out unsigned(21 downto 0);
		reverse_timer: out integer;
		
		input_time : in UNSIGNED(13 downto 0);
        reset : in STD_LOGIC;
		reset_stopwatch: in std_logic;
		stop_stopwatch: in std_logic;
        clock_set : in STD_LOGIC;
        alarm_set : in INTEGER := 0;
        alarm_stop : in STD_LOGIC := '0';
		revtimer_set: in STD_LOGIC;
        on_alarm : out STD_LOGIC := '0'
    );
end AlarmClock;	   

architecture alarmclock_behave of alarmclock is 
begin	
	process(clk) 
	variable clock_time: UNSIGNED(21 downto 0) := "0000000000000000000000"; 
	variable alarm_times: alarmarr := (others => (others => '0'));
	variable revtimer: INTEGER := 0;
	variable stopwatch_time: UNSIGNED(21 downto 0) := "0000000000000000000000"; 
	alias secondl: UNSIGNED(3 downto 0) is clock_time(3 downto 0);	 -- second right digit
	alias secondb: UNSIGNED(3 downto 0) is clock_time(7 downto 4); 	 -- second left digit
	alias minutel: UNSIGNED(3 downto 0) is clock_time(11 downto 8);
	alias minuteb: UNSIGNED(3 downto 0) is clock_time(15 downto 12);
	alias hourl: UNSIGNED(3 downto 0) is clock_time(19 downto 16); 
	alias hourb: UNSIGNED(1 downto 0) is clock_time(21 downto 20); 
	begin
		if(rising_edge(clk)) then
			-- REV TIMER FUNCTIONALITY
			if revtimer /= 0 then
				revtimer := revtimer -1; 
				if revtimer = 0 then
					on_alarm <= '1';   
				end if;
			end if;
			
			-- CLOCK FUNCTIONALITY
			clock_time := increase_clock(clock_time);  
			
			-- STOPWATCH FUNCTIONALITY
			if stop_stopwatch /= '1' then
				stopwatch_time := increase_clock(stopwatch_time);
			end if;
			
			-- RESET CLOCK FUNCTIONALITY
			if reset = '1' then
				clock_time := (others => '0');
			end if;
			
			-- RESET CLOCK FUNCTIONALITY
			if reset_stopwatch = '1' then
				stopwatch_time := (others => '0');
			end if;
			
			-- SET CLOCK FUNCTIONALITY
			if clock_set = '1' then
				clock_time(21 downto 8) := input_time;
			end if;				 
			
			-- SET ALARM FUNCTIONALITY
			if alarm_set = 1 or alarm_set = 2 or alarm_set = 3 or alarm_set = 4 or alarm_set = 5 then
				alarm_times(alarm_set-1)(21 downto 8) := input_time;
			end if;

			-- ALARM ON FUNCTIONALITY
			if clock_time(21 downto 8) /= "00000000000000" then	  
				for i in 0 to 5 loop
					if clock_time = alarm_times(i) then
						on_alarm <= '1';
						exit;
					end if;
				end loop;
			end if;
			
			-- ALARM OFF FUNCTIONALITY
			if alarm_stop = '1' then 
				on_alarm <= '0';
			end if;
			
			-- REV TIMER SET FUNCTIONALITY
			if revtimer_set = '1' then
				revtimer := to_integer(input_time(3 downto 0))*60 + to_integer(input_time(7 downto 4))*600 + to_integer(input_time(11 downto 8))*3600 + to_integer(input_time(13 downto 12))*36000;
			end if;
			
		end if;	 
		
		clock <= clock_time;
		alarms <= alarm_times;
		stopwatch <= stopwatch_time;
		reverse_timer <= revtimer;
		
		
	end process;
	
end architecture alarmclock_behave;


---------------------------------------------------------------------------	 
---------------------------------------------------------------------------