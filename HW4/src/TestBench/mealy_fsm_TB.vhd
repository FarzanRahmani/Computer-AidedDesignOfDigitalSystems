library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity mealy_fsm_tb is
end mealy_fsm_tb;

architecture TB_ARCHITECTURE of mealy_fsm_tb is
	-- Component declaration of the tested unit
	component mealy_fsm
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		input : in STD_LOGIC;
		output : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal input : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : mealy_fsm
		port map (
			clk => clk,
			reset => reset,
			input => input,
			output => output
		);

	-- Add your stimulus here ...
	process 
	begin
		clk <= '0';
		wait for 5ns;
		clk <= '1';
		wait for 5ns;
	end process;
	
	process 
		
	begin
		wait for 100ns;
		reset <= '1'; -- reset fsm
		input <= '0';
		wait for 10ns;
		reset <= '0';
		wait for 10ns;
		input <= '1';
		wait for 10ns;
		input <= '1';
		wait for 10ns;
		input <= '1';
		wait for 10ns;
		input <= '1';
		wait for 10ns;
		input <= '0';
		wait for 10ns;
		input <= '1';
		wait for 10ns;
		input <= '0';
		wait for 10ns;
		input <= '1';
		wait for 10ns;
		input <= '1';
		wait for 10ns;
		input <= '0';
		wait for 10ns;
		
		wait;
		
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mealy_fsm of mealy_fsm_tb is
	for TB_ARCHITECTURE
		for UUT : mealy_fsm
			use entity work.mealy_fsm(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_mealy_fsm;

