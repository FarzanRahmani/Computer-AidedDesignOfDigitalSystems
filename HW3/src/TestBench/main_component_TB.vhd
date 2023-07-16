--library HW3;
--use HW3.image_filter_pkg.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.image_filter_pkg.ALL;
USE std.textio.all;

	-- Add your library and packages declaration here ...

entity main_component_tb is
	-- Generic declarations of the tested unit
		generic(
		N : INTEGER := 1 );
end main_component_tb;

architecture TB_ARCHITECTURE of main_component_tb is
	-- Component declaration of the tested unit
	component main_component
		generic(
		N : INTEGER := 1 );
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		image_in : in image_t;
		filter_in : in filter_t;
		feature_map : inout image_t );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal image_in : image_t;
	signal filter_in : filter_t;
	signal feature_map : image_t;
	-- Observed signals - signals mapped to the output ports of tested entity

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : main_component
		generic map (
			N => N
		)

		port map (
			clk => clk,
			reset => reset,
			image_in => image_in,
			filter_in => filter_in,
			feature_map => feature_map
		);

	-- Add your stimulus here ...
	process 
	begin
		clk <= '0';
		wait for 1ns;
		clk <= '1';
		wait for 1ns;
	end process;
	
	process
	begin
		reset <= '1';
		wait for 100ns;
		reset <= '0';
		filter_in <= (
                (1.0, 1.0, 1.0),
                (1.0, 1.0, 1.0),
                (1.0, 1.0, 1.0)
            );
        image_in <= (
            0  => (0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            1 => (0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            2 => (0, 0, 0, 3, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            3 => (0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            4 => (0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            5 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            6 => (0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            7 => (0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            8 => (0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            9 => (0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            10 => (0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
            11 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, 254),
            12 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, 254, 254, 253, 253),
            13 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, 254, 253, 253, 252, 252),
            14 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 253, 253, 253, 252, 252, 251),
            15 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 253, 252, 252, 252, 251, 251),
            16 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 249, 253, 254, 253, 253, 254, 254, 254, 252, 248, 239, 242, 249, 244),
            17 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 253, 254, 254, 0, 254, 253, 253, 253, 251, 249, 246, 244, 238, 222),
            18 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 254, 254, 253, 251, 250, 250, 248, 247, 248, 247, 242, 228, 209, 192),
            19 => (0, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 253, 0, 251, 249, 250, 250, 248, 246, 245, 236, 218, 195, 179, 176),
            20 => (0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, 254, 250, 249, 251, 251, 247, 243, 229, 212, 190, 175, 177, 187),
            21 => (0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, 253, 249, 250, 250, 247, 239, 229, 201, 189, 179, 180, 192, 210),
            22 => (0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 254, 253, 248, 248, 247, 238, 219, 203, 182, 181, 185, 199, 215, 228),
            23 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 254, 253, 247, 246, 242, 228, 203, 183, 179, 183, 194, 211, 228, 235),
            24 => (0, 0, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 254, 254, 0, 0, 253, 245, 241, 244, 227, 192, 172, 171, 169, 191, 218, 232, 234, 229),
            25 => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 254, 253, 253, 253, 248, 247, 237, 223, 205, 181, 169, 175, 187, 206, 225, 236, 236, 232),
            26 => (0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 253, 252, 250, 249, 240, 245, 224, 193, 178, 169, 169, 185, 207, 219, 230, 235, 234, 229),
            27 => (0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 253, 249, 246, 244, 240, 234, 200, 171, 166, 165, 174, 199, 219, 225, 231, 230, 225, 221),
            28 => (0, 0, 0, 0, 0, 26, 0, 0, 253, 254, 0, 0, 252, 247, 242, 239, 238, 211, 175, 162, 169, 172, 186, 214, 228, 230, 231, 228, 223, 220),
            29 => (0, 0, 27, 0, 0, 0, 0, 0, 251, 253, 0, 0, 251, 245, 238, 234, 219, 182, 157, 162, 173, 183, 203, 225, 233, 233, 232, 231, 228, 226)
            );
		wait for 2000ns;
		reset <= '0';
	
		wait;
	end process;
	
	
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_main_component of main_component_tb is
	for TB_ARCHITECTURE
		for UUT : main_component
			use entity work.main_component(structural);
		end for;
	end for;
end TESTBENCH_FOR_main_component;

