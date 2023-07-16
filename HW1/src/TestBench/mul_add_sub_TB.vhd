library HW1;
use HW1.types.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.ALL;


	-- Add your library and packages declaration here ...

entity mul_add_sub_tb is
end mul_add_sub_tb;

architecture TB_ARCHITECTURE of mul_add_sub_tb is
	-- Component declaration of the tested unit
	component mul_add_sub
	port(
		a : in COMPLEX_NUM;
		b : in COMPLEX_NUM;
		mul : in STD_LOGIC;
		add : in STD_LOGIC;
		sub : in STD_LOGIC;
		o : out COMPLEX_NUM );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : COMPLEX_NUM;
	signal b : COMPLEX_NUM;
	signal mul : STD_LOGIC;
	signal add : STD_LOGIC;
	signal sub : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o : COMPLEX_NUM;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : mul_add_sub
		port map (
			a => a,
			b => b,
			mul => mul,
			add => add,
			sub => sub,
			o => o
		);

	-- Add your stimulus here ... 
	process 
		
	begin
		wait for 100ns;
		-- a = 2.0 + 3.0i
		a.x <= 2.0;
		a.y <= 3.0;
		-- b = 1.0 -1.0i
		b.x <= 1.0;
		b.y <= -1.0;
		mul <= '1';
		add <= '0';
		sub <= '0';
		wait for 100ns;
		mul <= '0';
		add <= '1';
		wait for 100ns;
		add <= '0';
		sub <= '1';
		wait for 100ns;
		-- a = -5.0 + -3.5i
		a.x <= -5.0;
		a.y <= -3.5;
		-- b = -7.0 + 0.1i
		b.x <= -7.0;
		b.y <= 0.1;
		mul <= '1';
		add <= '0';
		sub <= '0';
		wait for 100ns;
		mul <= '0';
		add <= '1';
		wait for 100ns;
		add <= '0';
		sub <= '1';
		wait;
	end process;	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mul_add_sub of mul_add_sub_tb is
	for TB_ARCHITECTURE
		for UUT : mul_add_sub
			use entity work.mul_add_sub(farzan);
		end for;
	end for;
end TESTBENCH_FOR_mul_add_sub;

