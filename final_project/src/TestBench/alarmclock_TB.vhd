library AlarmClock;
use AlarmClock.mypackage.all;	
library ieee;  
use ieee.std_logic_1164.all;
use ieee.MATH_REAL.all;
use ieee.NUMERIC_STD.all; 

	-- Add your library and packages declaration here ...

entity alarmclock_tb is
end alarmclock_tb;

architecture TB_ARCHITECTURE of alarmclock_tb is
	-- Component declaration of the tested unit
	component alarmclock
	port(
		clk : in STD_LOGIC;
		clock : out UNSIGNED(21 downto 0);
		alarms : out alarmarr;
		stopwatch : out UNSIGNED(21 downto 0);
		reverse_timer : out INTEGER;
		input_time : in UNSIGNED(13 downto 0);
		reset : in STD_LOGIC;
		reset_stopwatch : in STD_LOGIC;
		stop_stopwatch : in STD_LOGIC;
		clock_set : in STD_LOGIC;
		alarm_set : in INTEGER;
		alarm_stop : in STD_LOGIC;
		revtimer_set : in STD_LOGIC;
		on_alarm : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal input_time : UNSIGNED(13 downto 0);
	signal reset : STD_LOGIC;
	signal reset_stopwatch : STD_LOGIC;
	signal stop_stopwatch : STD_LOGIC;
	signal clock_set : STD_LOGIC;
	signal alarm_set : INTEGER;
	signal alarm_stop : STD_LOGIC;
	signal revtimer_set : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal clock : UNSIGNED(21 downto 0);
	signal alarms : alarmarr;
	signal stopwatch : UNSIGNED(21 downto 0);
	signal reverse_timer : INTEGER;
	signal on_alarm : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alarmclock
		port map (
			clk => clk,
			clock => clock,
			alarms => alarms,
			stopwatch => stopwatch,
			reverse_timer => reverse_timer,
			input_time => input_time,
			reset => reset,
			reset_stopwatch => reset_stopwatch,
			stop_stopwatch => stop_stopwatch,
			clock_set => clock_set,
			alarm_set => alarm_set,
			alarm_stop => alarm_stop,
			revtimer_set => revtimer_set,
			on_alarm => on_alarm
		);

	-- Add your stimulus here ...
	process
	begin
		if clk = '0' then
			clk <= '1';
		else
			clk <= '0';
		end if;
		wait for 0.5 ns;
	end process;  
	
	process begin
		-- TEST NORMAL CLOCK
		-- just initailize clock and wait;
		reset <= '0';
		input_time <= "00000000000000";
		reset_stopwatch <= '0';
		stop_stopwatch <= '1';
		clock_set <= '0';
		alarm_set <= 0;
		alarm_stop <= '0';
		revtimer_set <= '0';
		
		-- TEST SET AND RESET CLOCK
--		wait for 100 ns;
--		input_time <= "00000000000101";
--		clock_set <= '1';
--		wait for 1 ns;
--		clock_set <= '0';
--		input_time <= "00000000000000";
--		wait for 10 ns;
--		reset <= '1';
--		wait for 1 ns;
--		reset <= '0';
--
--		-- TEST ALARMS 
--		-- turn on 4 alarms
--		input_time <= "00000000000001";
--		alarm_set <= 1;
--		wait for 1 ns;
--		input_time <= "00000000000010";
--		alarm_set <= 2;
--		wait for 1 ns;
--		input_time <= "00000000000011";
--		alarm_set <= 3;			  	
--		wait for 1 ns;
--		input_time <= "00000000000100";
--		alarm_set <= 4;
--		wait for 1 ns; 
--		alarm_set <= 0;	
--		
--		-- wait for first and second alarm and stop them
--		wait for 60 ns;
--		alarm_stop <= '1';	
--		wait for 1 ns;
--		alarm_stop <= '0';
--		wait for 60 ns;
--		alarm_stop <= '1';
--		wait for 1 ns;
--		alarm_stop <= '0';	
--		
--		-- remove the 3rd alarm	 
--		input_time <= "00000000000000"; 
--		alarm_set <= 3;
--		wait for 1 ns; 
--		alarm_set <= 0;
--		
--		-- wait for 4th alarm and stop it
--		wait for 120 ns;
--		alarm_stop <= '1';	
--		wait for 1 ns;
--		
--		-- TEST REV TIMER
--		wait for 70 ns;
--		input_time <= "00000000000010";
--		revtimer_set <= '1';
--		wait for 1 ns;
--		revtimer_set <= '0';
--		wait for 125 ns;
--		alarm_stop <= '1';
--		wait for 1 ns;
--		alarm_stop <= '0';	

	-- TEST STOPWATCH 
	wait for 10 ns;
	stop_stopwatch <= '0';
	wait for 20 ns;	
	stop_stopwatch <='1';
	wait for 5 ns;
	stop_stopwatch <= '0';
	wait for 50 ns;
	stop_stopwatch <= '1';
	wait for 2 ns;
	reset_stopwatch <= '1';	
	wait for 1 ns;
	reset_stopwatch <= '0';
	stop_stopwatch <= '0';
	wait;
	end process;
	
	
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alarmclock of alarmclock_tb is
	for TB_ARCHITECTURE
		for UUT : alarmclock
			use entity work.alarmclock(alarmclock_behave);
		end for;
	end for;
end TESTBENCH_FOR_alarmclock;

