library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity one_by_one_tb is
end one_by_one_tb;

architecture TB_ARCHITECTURE of one_by_one_tb is
	-- Component declaration of the tested unit
	component one_by_one
	port(
		input : in BIT_VECTOR(16 downto 1);
		output : out BIT_VECTOR(1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : BIT_VECTOR(16 downto 1);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : BIT_VECTOR(1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : one_by_one
		port map (
			input => input,
			output => output
		);

	-- Add your stimulus here ...
	process 
		
	begin  
	wait for 100ns;
    input <= "1100110000111111";
	wait for 100ns;
    input <= "1010101010101010";
	wait for 100ns;
    input <= "0101010101010101";
	wait for 100ns;
    input <= "1111111100000000";
	wait for 100ns;
    input <= "1111111111111111";
	wait for 100ns;
    input <= "0000000000000000";
	wait for 100ns;
    input <= "0000000011111111";
	wait for 100ns;
    input <= "1000101000111110";
	wait for 100ns;
    input <= "1111010001010100";
    wait;
	end process;	


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_one_by_one of one_by_one_tb is
	for TB_ARCHITECTURE
		for UUT : one_by_one
			use entity work.one_by_one(one_by_one);
		end for;
	end for;
end TESTBENCH_FOR_one_by_one;

