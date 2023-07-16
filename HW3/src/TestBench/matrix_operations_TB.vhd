library ieee;
use ieee.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.ALL;
library HW3;
use HW3.complex_matrix_pkg.all;

	-- Add your library and packages declaration here ...

entity matrix_operations_tb is
end matrix_operations_tb;

architecture TB_ARCHITECTURE of matrix_operations_tb is
	-- Component declaration of the tested unit
	component matrix_operations
	port(
		add : in STD_LOGIC;
		mul : in STD_LOGIC;
		fill : in STD_LOGIC;
		print_A : in STD_LOGIC;
		print_B : in STD_LOGIC;
		print_Added : in STD_LOGIC;
		print_Multiplied : in STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal add : STD_LOGIC;
	signal mul : STD_LOGIC;
	signal fill : STD_LOGIC;
	signal print_A : STD_LOGIC;
	signal print_B : STD_LOGIC;
	signal print_Added : STD_LOGIC;
	signal print_Multiplied : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : matrix_operations
		port map (
			add => add,
			mul => mul,
			fill => fill,
			print_A => print_A,
			print_B => print_B,
			print_Added => print_Added,
			print_Multiplied => print_Multiplied
		);

	-- Add your stimulus here ...
	process 
		
	begin
		wait for 100ns;
		fill <= '1';
		print_A <= '0';
		print_B <= '0';
		add <= '0';
		mul <= '0';
		print_Added <= '0';
		print_Multiplied <= '0';
		
		wait for 100ns;
		fill <= '0';
		print_A <= '1';
		
		wait for 100ns;
		print_A <= '0';
		print_B <= '1';
		
		wait for 100ns;
		print_B <= '0';
		add <= '1';
		
		wait for 100ns;
		add <= '0';
		print_Added <= '1';
		
		wait for 100ns;
		mul <= '1';
		print_Added <= '0';
		
		wait for 100ns;
		mul <= '0';
		print_Multiplied <= '1';
		
		wait for 100ns;
		fill <= '0';
		print_A <= '0';
		print_B <= '0';
		add <= '0';
		mul <= '0';
		print_Added <= '0';
		print_Multiplied <= '0';
		
		wait for 100ns;
	
	end process;	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_matrix_operations of matrix_operations_tb is
	for TB_ARCHITECTURE
		for UUT : matrix_operations
			use entity work.matrix_operations(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_matrix_operations;

