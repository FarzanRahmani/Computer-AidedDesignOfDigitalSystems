library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity unary_to_binary_tb is
end unary_to_binary_tb;

architecture TB_ARCHITECTURE of unary_to_binary_tb is
	-- Component declaration of the tested unit
	component unary_to_binary
	port(
		unary : in STD_LOGIC_VECTOR(15 downto 0);
		binary : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal unary : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal binary : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : unary_to_binary
		port map (
			unary => unary,
			binary => binary
		);

	-- Add your stimulus here ...
	process 
	begin
	wait for 100ns;
	unary <= "0000000000000000";
    wait for 100ns;
    unary <= "0000000000000001";
    wait for 100ns;
    unary <= "0000000000000011";
    wait for 100ns;
    unary <= "0000000000000111";
    wait for 100ns;
    unary <= "0000000000001111";
    wait for 100ns;
    unary <= "0000000000011111";
    wait for 100ns;
    unary <= "0000000000111111";
    wait for 100ns;
    unary <= "0000000001111111";
    wait for 100ns;
    unary <= "0000000011111111";
    wait for 100ns;
    unary <= "0000000111111111";
    wait for 100ns;
    unary <= "0000001111111111";
    wait for 100ns;
    unary <= "0000011111111111";
    wait for 100ns;
    unary <= "0000111111111111";
    wait for 100ns;
    unary <= "0001111111111111";
    wait for 100ns;
    unary <= "0011111111111111";
    wait for 100ns;
    unary <= "0111111111111111";
    wait for 100ns;
    unary <= "1111111111111111";
    wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_unary_to_binary of unary_to_binary_tb is
	for TB_ARCHITECTURE
		for UUT : unary_to_binary
			use entity work.unary_to_binary(transform);
		end for;
	end for;
end TESTBENCH_FOR_unary_to_binary;

