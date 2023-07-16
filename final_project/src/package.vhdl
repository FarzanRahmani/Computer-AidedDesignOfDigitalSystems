library ieee;  
use ieee.std_logic_1164.all;
use ieee.MATH_REAL.all;
use ieee.NUMERIC_STD.all;

package mypackage is
	type alarmarr is array (0 to 5) of UNSIGNED(21 downto 0);
	function increase_clock (intime: UNSIGNED(21 downto 0))return UNSIGNED;
end mypackage;

package body mypackage is
	function increase_clock (intime: UNSIGNED(21 downto 0))return UNSIGNED is 
	variable clock_time : Unsigned(21 downto 0) := intime;
	alias secondl: UNSIGNED(3 downto 0) is clock_time(3 downto 0);	 -- second right digit
	alias secondb: UNSIGNED(3 downto 0) is clock_time(7 downto 4); 	 -- second left digit
	alias minutel: UNSIGNED(3 downto 0) is clock_time(11 downto 8);
	alias minuteb: UNSIGNED(3 downto 0) is clock_time(15 downto 12);
	alias hourl: UNSIGNED(3 downto 0) is clock_time(19 downto 16); 
	alias hourb: UNSIGNED(1 downto 0) is clock_time(21 downto 20);
	begin
		clock_time := intime;
		secondl := secondl + 1; 
			if secondl = "1010" then
				secondl := "0000";
				secondb := secondb + 1;
			end if;
			if secondb = "0110" then
				secondb := "0000";
				minutel := minutel + 1;
			end if;
			if minutel = "1010" then
				minutel := "0000";
				minuteb := minuteb + 1;
			end if;
			if minuteb = "0110" then
				minuteb := "0000";
				hourl := hourl + 1;
			end if;
			if hourl = "1010" then
				hourl := "0000";
				hourb := hourb +1;
			end if;
			if hourb = "10" and hourl = "0100" then
				hourb := "00";	
				hourl := "0000";
			end if;
		return clock_time;
	end increase_clock;
	
end mypackage;