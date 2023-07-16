-------------------------------------------------------------------------------
--
-- Title       : TWO_BIT_ALU
-- Design      : HW1
-- Author      : LENOVO
-- Company     : IUST
--
-------------------------------------------------------------------------------
--
-- File        : d:\My_Designs\CAD\HW1\src\q2.vhd
-- Generated   : Sat Mar 25 15:22:07 2023
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {TWO_BIT_ALU} architecture {ALU}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TWO_BIT_ALU is
	 port(
		 A : in STD_LOGIC_VECTOR(1 downto 0);
		 B : in STD_LOGIC_VECTOR(1 downto 0);
		 CONTROL_BITS : in STD_LOGIC_VECTOR(1 downto 0); -- "00":add, "01":sub, "10":and, "11":or
		 O : out STD_LOGIC_VECTOR(1 downto 0)
	     );
end TWO_BIT_ALU;

--}} End of automatically maintained section

architecture ALU of TWO_BIT_ALU is 		
begin 
	process(A, B, CONTROL_BITS) 
		
	begin  	 
		if ( CONTROL_BITS = "00" ) then  -- "00":add
			-- O <= A + B;
			--tmp <= to_integer(unsigned(A) + to_integer(unsigned(B);
			-- O <= std_logic_vector(to_unsigned(tmp) ;
			-- O <= std_logic_vector(to_unsigned( to_integer(unsigned(A)) + to_integer(unsigned(B)) , 2));
			O <= std_logic_vector( unsigned(A) + unsigned(B) );
		elsif ( CONTROL_BITS = "01" ) then -- "01":sub
			-- O <= A - B ;
			O <= std_logic_vector( unsigned(A) - unsigned(B) );
			-- O <= conv_std_logic_vector( unsigned(A) + unsigned(B) , 3);
	    elsif ( CONTROL_BITS = "10" ) then  -- "10":and 
			O <= (A and B) ;
			-- O <= '0' & (A and B) ;
		else  -- "11":or
			O <= (A or B) ;
			-- O <= '0' & (A or B) ;
		end if;		
	end process;	
end ALU;
