library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alarm_clock_tb is
end alarm_clock_tb;

architecture TB_ARCHITECTURE of alarm_clock_tb is
	-- Component declaration of the tested unit
	component alarm_clock
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		clock_set : in STD_LOGIC;
		alarm_set : in STD_LOGIC;
		alarm_stop : in STD_LOGIC;
		input_time : in STD_LOGIC_VECTOR(13 downto 0);
		on_alarm : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal clock_set : STD_LOGIC;
	signal alarm_set : STD_LOGIC;
	signal alarm_stop : STD_LOGIC;
	signal input_time : STD_LOGIC_VECTOR(13 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal on_alarm : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alarm_clock
		port map (
			clk => clk,
			reset => reset,
			clock_set => clock_set,
			alarm_set => alarm_set,
			alarm_stop => alarm_stop,
			input_time => input_time,
			on_alarm => on_alarm
		);

	-- Add your stimulus here ...
	process 
		
	begin  
		reset <= '1'; -- reset time
		clock_set <= '0';
		alarm_set <= '0';
		alarm_stop <= '0';
		wait for 1ns;
		reset <= '0';
		wait for 100ns;
		
		input_time <= "01001100100001";--set time to 13:21
		reset <= '0';
		alarm_set <= '0';
		clock_set <= '1';
		wait for 1ns;
		clock_set <= '0';
		wait for 100ns;
		
		input_time <= "01001100100101";-- set alarm at 13:25
		reset <= '0';
		alarm_set <= '1';
		clock_set <= '0';
		wait for 1ns;
		alarm_set <= '0';
		wait for 500ns;

		alarm_stop <= '1'; -- stop the alarm
		wait for 10ns;
		alarm_stop <= '0';
		wait for 200ns;
		
		reset <= '1'; -- reset time
		clock_set <= '0';
		alarm_set <= '0';
		alarm_stop <= '0';
		wait for 1ns;
		reset <= '0';
		wait for 100ns;
		
		input_time <= "01100101010101";-- set time at 19:55
		reset <= '0';
		alarm_set <= '0';
		clock_set <= '1';
		wait for 1ns;
		clock_set <= '0';
		wait for 100ns;
		
		input_time <= "10000100000001";-- set alarm at 21:01
		reset <= '0';
		alarm_set <= '1';
		clock_set <= '0';
		wait for 1ns;
		alarm_set <= '0';
		wait for 4000ns;
		
		alarm_stop <= '1'; -- stop the alarm
		wait for 10ns;
		alarm_stop <= '0';
		wait for 200ns;
		
		input_time <= "00000100000111";-- set alarm at 01:07
		reset <= '0';
		alarm_set <= '1';
		clock_set <= '0';
		wait for 1ns;
		alarm_set <= '0';
		wait for 16000ns;
		
		alarm_stop <= '1'; -- stop the alarm
		wait for 10ns;
		alarm_stop <= '0';
		wait for 200ns;
		
		wait;
		
	end process;
	
	process 
	begin
		clk <= '0';
		wait for 1ns;
		clk <= '1';
		wait for 1ns;
		clk <= '0';
		wait for 1ns;
		clk <= '1';
		wait for 1ns;
		clk <= '0';
		wait for 1ns;
		clk <= '1';
		wait for 1ns;
		clk <= '0';
		wait for 1ns;
		clk <= '1';
		wait for 1ns;
		clk <= '0';
		wait for 1ns;
		clk <= '1';
		wait for 1ns;
		clk <= '0';
		wait for 1ns;
		clk <= '1';
		wait for 1ns;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alarm_clock of alarm_clock_tb is
	for TB_ARCHITECTURE
		for UUT : alarm_clock
			use entity work.alarm_clock(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_alarm_clock;

