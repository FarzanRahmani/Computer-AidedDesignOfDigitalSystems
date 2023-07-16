library HW3;
use HW3.recursive_functions.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

	-- Add your library and packages declaration here ...

entity binary_reverser_example_tb is
end binary_reverser_example_tb;

architecture TB_ARCHITECTURE of binary_reverser_example_tb is
	-- Component declaration of the tested unit
	component binary_reverser_example
	port(
		bin_in : in STD_LOGIC_VECTOR(4 downto 0);
		bin_out : out STD_LOGIC_VECTOR(4 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal bin_in : STD_LOGIC_VECTOR(4 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal bin_out : STD_LOGIC_VECTOR(4 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : binary_reverser_example
		port map (
			bin_in => bin_in,
			bin_out => bin_out
		);

	-- Add your stimulus here ...
	process 
		
	begin
		-- wait for 100ns;
		bin_in <= "11000";
		wait for 100ns;
		bin_in <= "10101";
		wait for 100ns;
		bin_in <= "01011";
		wait for 100ns;
		bin_in <= "10001";
		wait for 100ns;
		bin_in <= "11010";
		wait;
	
	end process;	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_binary_reverser_example of binary_reverser_example_tb is
	for TB_ARCHITECTURE
		for UUT : binary_reverser_example
			use entity work.binary_reverser_example(synth);
		end for;
	end for;
end TESTBENCH_FOR_binary_reverser_example;

