library HW2;
use HW2.types.all;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_STD.ALL;	
use work.types.all; -- in packages.vhd

	-- Add your library and packages declaration here ...

entity root_picker_tb is
end root_picker_tb;

architecture TB_ARCHITECTURE of root_picker_tb is
	-- Component declaration of the tested unit
	component root_picker
	port(
		input : in STD_LOGIC_VECTOR(9 downto 0);
		output : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(9 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(5 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : root_picker
		port map (
			input => input,
			output => output
		);

	-- Add your stimulus here ...
	process 
		
	begin  
	wait for 100ns;
    input <= "0001110000";
	wait for 100ns;
    input <= "0000101000";
	wait for 100ns;
    input <= "1111111111";
	wait for 100ns;
    input <= "0000000000";
	wait for 100ns;
    input <= "0000101011";
	wait for 100ns;
    input <= "0000101001";
	wait for 100ns;
    input <= "0000000001";
	wait for 100ns;
    input <= "0000100000";
    wait;
	end process;	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_root_picker of root_picker_tb is
	for TB_ARCHITECTURE
		for UUT : root_picker
			use entity work.root_picker(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_root_picker;

