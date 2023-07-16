library HW3;
use HW3.Recursive_Functions_Pkg.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use work.recursive_functions.all;

	-- Add your library and packages declaration here ...

entity q2_tb is
end q2_tb;

architecture TB_ARCHITECTURE of q2_tb is
	-- Component declaration of the tested unit
	component q2
	port(
		bin_in : in STD_LOGIC_VECTOR(4 downto 0);
		bin_out : out STD_LOGIC_VECTOR(4 downto 0);
		bcd_in : in STD_LOGIC_VECTOR(7 downto 0);
		bcd_out : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal bin_in : STD_LOGIC_VECTOR(4 downto 0);
	signal bcd_in : STD_LOGIC_VECTOR(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal bin_out : STD_LOGIC_VECTOR(4 downto 0);
	signal bcd_out : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q2
		port map (
			bin_in => bin_in,
			bin_out => bin_out,
			bcd_in => bcd_in,
			bcd_out => bcd_out
		);

	-- Add your stimulus here ...
	process 
		
	begin
		-- wait for 100ns;
		bin_in <= "11000";
		bcd_in <= "00010010";
		wait for 100ns;
		bin_in <= "10101";
		bcd_in <= "00110011";
		wait;
	
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q2 of q2_tb is
	for TB_ARCHITECTURE
		for UUT : q2
			use entity work.q2(synth);
		end for;
	end for;
end TESTBENCH_FOR_q2;

