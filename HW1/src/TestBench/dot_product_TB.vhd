library HW1;
use HW1.types.all;

	-- Add your library and packages declaration here ...

entity dot_product_tb is
end dot_product_tb;

architecture TB_ARCHITECTURE of dot_product_tb is
	-- Component declaration of the tested unit
	component dot_product
	port(
		A : in int_array_8;
		B : in int_array_8;
		O : out INTEGER );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : int_array_8;
	signal B : int_array_8;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal O : INTEGER;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : dot_product
		port map (
			A => A,
			B => B,
			O => O
		);

	-- Add your stimulus here ...
	process 
		
	begin
		wait for 100ns;
		A <= (others => 0);
		B <= (others => 0);
		wait for 100ns;
		A <= (others => 1);
		B <= (others => 1);
		wait for 100ns;
		A <= (others => 2);
		B <= (others => 2);
		wait for 100ns;
		A(0) <= 0;
		A(1) <= 1;
		A(2) <= 2;
		A(3) <= 3;
		A(4) <= 4;
		A(5) <= 5;
		A(6) <= 6;
		A(7) <= 7;
		B(0) <= 0;
		B(1) <= 1;
		B(2) <= 2;
		B(3) <= 3;
		B(4) <= 4;
		B(5) <= 5;
		B(6) <= 6;
		B(7) <= 7;
		wait for 100ns;
		A(0) <= 5;
		A(1) <= 4;
		A(2) <= 3;
		A(3) <= 7;
		A(4) <= 6;
		A(5) <= 9;
		A(6) <= 8;
		A(7) <= 11;
		B(0) <= 1;
		B(1) <= 4;
		B(2) <= 2;
		B(3) <= 7;
		B(4) <= 6;
		B(5) <= 92;
		B(6) <= 8;
		B(7) <= 17;
		wait;
	end process;	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_dot_product of dot_product_tb is
	for TB_ARCHITECTURE
		for UUT : dot_product
			use entity work.dot_product(dot_product);
		end for;
	end for;
end TESTBENCH_FOR_dot_product;

