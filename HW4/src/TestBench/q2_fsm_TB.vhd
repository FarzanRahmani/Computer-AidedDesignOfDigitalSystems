library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity q2_fsm_tb is
	-- Generic declarations of the tested unit
		generic(
		n : POSITIVE := 17 );
end q2_fsm_tb;

architecture TB_ARCHITECTURE of q2_fsm_tb is
	-- Component declaration of the tested unit
	component q2_fsm
		generic(
		n : POSITIVE := 17 );
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		input : in STD_LOGIC_VECTOR(n-1 downto 0);
		output : out STD_LOGIC_VECTOR(n-1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal input : STD_LOGIC_VECTOR(n-1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(n-1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q2_fsm
		generic map (
			n => n
		)

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
		reset <= '1';
		wait for 10ns;
		reset <= '0';
		input <= "00111100011110001";
		wait for 300ns;
		
		reset <= '1';
		wait for 10ns;
		reset <= '0';
		input <= "11000111111111111";		
		wait for 300ns;
		
		reset <= '1';
		wait for 10ns;
		reset <= '0';
		input <= "11000111000000000";
		wait for 300ns;
		
		wait;
	end process;	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q2_fsm of q2_fsm_tb is
	for TB_ARCHITECTURE
		for UUT : q2_fsm
			use entity work.q2_fsm(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_q2_fsm;

