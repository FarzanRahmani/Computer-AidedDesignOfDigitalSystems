library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity fsm_tb is
end fsm_tb;

architecture TB_ARCHITECTURE of fsm_tb is
	-- Component declaration of the tested unit
	component fsm
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		-- input : in STD_LOGIC_VECTOR(20 downto 0);
		input : in STD_LOGIC_VECTOR(0 to 20);
		start_index : out STD_LOGIC_VECTOR(4 downto 0);
		end_index : out STD_LOGIC_VECTOR(4 downto 0);
		last_start_index : out STD_LOGIC_VECTOR(4 downto 0);
		last_end_index : out STD_LOGIC_VECTOR(4 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	-- signal input : STD_LOGIC_VECTOR(20 downto 0);
	signal input : STD_LOGIC_VECTOR(0 to 20);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal start_index : STD_LOGIC_VECTOR(4 downto 0);
	signal end_index : STD_LOGIC_VECTOR(4 downto 0);
	signal last_start_index : STD_LOGIC_VECTOR(4 downto 0);
	signal last_end_index : STD_LOGIC_VECTOR(4 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : fsm
		port map (
			clk => clk,
			reset => reset,
			input => input,
			start_index => start_index,
			end_index => end_index,
			last_start_index => last_start_index,
			last_end_index => last_end_index
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
		input <= "000000000000000000000";
		
		wait for 10ns;
		reset <= '0';
		input <= "001111000000111110001";
		
		wait for 300ns;
		reset <= '1'; -- reset fsm
		
		wait for 10ns;
		reset <= '0';
		
		wait for 10ns;
		input <= "011111111001111111001";
		
		wait for 300ns;

		
		wait;
		
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fsm of fsm_tb is
	for TB_ARCHITECTURE
		for UUT : fsm
			use entity work.fsm(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_fsm;

