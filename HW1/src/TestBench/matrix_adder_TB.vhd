library HW1;
use HW1.types.all;

	-- Add your library and packages declaration here ...

entity matrix_adder_tb is
end matrix_adder_tb;

architecture TB_ARCHITECTURE of matrix_adder_tb is
	-- Component declaration of the tested unit
	component matrix_adder
	port(
		i : in matrix_3in3_of_std_logic_vector4;
		o : out INTEGER );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal i : matrix_3in3_of_std_logic_vector4;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o : INTEGER;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : matrix_adder
		port map (
			i => i,
			o => o
		);

	-- Add your stimulus here ...
	process 
		
	begin
		wait for 100ns;
		i(0, 0) <= "0000";
		i(0, 1) <= "0001";
		i(0, 2) <= "0010";
		i(1, 0) <= "0011";
		i(1, 1) <= "0100";
		i(1, 2) <= "0101";
		i(2, 0) <= "0110";
		i(2, 1) <= "0111";
		i(2, 2) <= "1000";
		wait for 100ns;
		i(0, 0) <= "1001";
		i(0, 1) <= "1010";
		i(0, 2) <= "1011";
		i(1, 0) <= "1100";
		i(1, 1) <= "1101";
		i(1, 2) <= "1110";
		i(2, 0) <= "1111";
		i(2, 1) <= "0000";
		i(2, 2) <= "0001";
		wait for 100ns;
		i(0, 0) <= "1111";
		i(0, 1) <= "1111";
		i(0, 2) <= "1111";
		i(1, 0) <= "1111";
		i(1, 1) <= "1111";
		i(1, 2) <= "1111";
		i(2, 0) <= "1111";
		i(2, 1) <= "1111";
		i(2, 2) <= "1111";
		wait for 100ns;
		i(0, 0) <= "0000";
		i(0, 1) <= "0000";
		i(0, 2) <= "0000";
		i(1, 0) <= "0000";
		i(1, 1) <= "0000";
		i(1, 2) <= "0000";
		i(2, 0) <= "0000";
		i(2, 1) <= "0000";
		i(2, 2) <= "0000";
		wait;
	end process;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_matrix_adder of matrix_adder_tb is
	for TB_ARCHITECTURE
		for UUT : matrix_adder
			use entity work.matrix_adder(farzan);
		end for;
	end for;
end TESTBENCH_FOR_matrix_adder;

