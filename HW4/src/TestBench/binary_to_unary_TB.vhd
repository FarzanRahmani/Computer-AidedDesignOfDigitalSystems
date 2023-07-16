library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity binary_to_unary_tb is
end binary_to_unary_tb;

architecture TB_ARCHITECTURE of binary_to_unary_tb is
	-- Component declaration of the tested unit
	component binary_to_unary
	port(
		binary : in STD_LOGIC_VECTOR(2 downto 0);
		unary : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal binary : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal unary : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : binary_to_unary
		port map (
			binary => binary,
			unary => unary
		);

	-- Add your stimulus here ... 
	process 
	begin
	wait for 100ns;
	binary <= "000";
    wait for 100ns;
    binary <= "001";
    wait for 100ns;
    binary <= "010";
	wait for 100ns;
	binary <= "011";
    wait for 100ns;
    binary <= "100";
    wait for 100ns;
    binary <= "101";
	wait for 100ns;
	binary <= "110";
    wait for 100ns;
    binary <= "111";
    wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_binary_to_unary of binary_to_unary_tb is
	for TB_ARCHITECTURE
		for UUT : binary_to_unary
			use entity work.binary_to_unary(transform);
		end for;
	end for;
end TESTBENCH_FOR_binary_to_unary;

