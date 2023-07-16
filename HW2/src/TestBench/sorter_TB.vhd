library HW2;
use HW2.types.all;

	-- Add your library and packages declaration here ...

entity sorter_tb is
end sorter_tb;

architecture TB_ARCHITECTURE of sorter_tb is
	-- Component declaration of the tested unit
	component sorter
	port(
		input : in array_of_8bit;
		output : out array_of_8bit );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : array_of_8bit;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : array_of_8bit;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sorter
		port map (
			input => input,
			output => output
		);

	-- Add your stimulus here ...
	process 
	begin
	wait for 100ns;
	-- fill with random values
    input(0) <= "11111111";
    input(1) <= "00000000";
    input(2) <= "00000001";
    input(3) <= "00100011";
    input(4) <= "11000011";
    input(5) <= "00000010";
    input(6) <= "00001111";
    input(7) <= "00000101";
    input(8) <= "11110000";
    input(9) <= "11001100";
	wait for 100ns;
    input(0) <= "00001111";
    input(1) <= "11001100";
    input(2) <= "00000001";
    input(3) <= "00110011";
    input(4) <= "01010101";
    input(5) <= "10101010";
    input(6) <= "00000000";
    input(7) <= "11111111";
    input(8) <= "11100001";
    input(9) <= "00101101";
    wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sorter of sorter_tb is
	for TB_ARCHITECTURE
		for UUT : sorter
			use entity work.sorter(sorter);
		end for;
	end for;
end TESTBENCH_FOR_sorter;

