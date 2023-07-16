library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity two_bit_alu_tb is
end two_bit_alu_tb;

architecture TB_ARCHITECTURE of two_bit_alu_tb is
	-- Component declaration of the tested unit
	component two_bit_alu
	port(
		A : in STD_LOGIC_VECTOR(1 downto 0);
		B : in STD_LOGIC_VECTOR(1 downto 0);
		CONTROL_BITS : in STD_LOGIC_VECTOR(1 downto 0);
		O : out STD_LOGIC_VECTOR(1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(1 downto 0);
	signal B : STD_LOGIC_VECTOR(1 downto 0);
	signal CONTROL_BITS : STD_LOGIC_VECTOR(1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal O : STD_LOGIC_VECTOR(1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : two_bit_alu
		port map (
			A => A,
			B => B,
			CONTROL_BITS => CONTROL_BITS,
			O => O
		);

	-- Add your stimulus here ...
	process 
		
	begin
		wait for 100ns;
        A <= "10";
        B <= "01";
        CONTROL_BITS <= "00";
        wait for 100ns;
        CONTROL_BITS <= "01";
        wait for 100ns;
        CONTROL_BITS <= "10";
        wait for 100ns;
        CONTROL_BITS <= "11";
        wait for 100ns;
        A <= "11";
        B <= "10";
        CONTROL_BITS <= "00";
        wait for 100ns;
        CONTROL_BITS <= "01";
        wait for 100ns;
        CONTROL_BITS <= "10";
        wait for 100ns;
        CONTROL_BITS <= "11";
        wait for 100ns;
        A <= "01";
        B <= "00";
        CONTROL_BITS <= "00";
        wait for 100ns;
        CONTROL_BITS <= "01";
        wait for 100ns;
        CONTROL_BITS <= "10";
        wait for 100ns;
        CONTROL_BITS <= "11";
        wait for 100ns;
		A <= "00";
        B <= "11";
        CONTROL_BITS <= "00";
        wait for 100ns;
        CONTROL_BITS <= "01";
        wait for 100ns;
        CONTROL_BITS <= "10";
        wait for 100ns;
        CONTROL_BITS <= "11";
        wait;
	
	end process;	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_two_bit_alu of two_bit_alu_tb is
	for TB_ARCHITECTURE
		for UUT : two_bit_alu
			use entity work.two_bit_alu(alu);
		end for;
	end for;
end TESTBENCH_FOR_two_bit_alu;

