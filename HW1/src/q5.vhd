library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.ALL;	
use work.types.all; -- in packages.vhd

entity MUL_ADD_SUB is	
	port (
	a, b: in COMPLEX_NUM;
	mul, add, sub: in std_logic;
	o: out COMPLEX_NUM 
		);
end MUL_ADD_SUB;

architecture farzan of MUL_ADD_SUB is
begin	
process(a, b, add, sub, mul)
begin
    if add = '1' then
        o.x <= a.x + b.x;
        o.y <= a.y + b.y;
    elsif sub = '1' then
        o.x <= a.x - b.x;
        o.y <= a.y - b.y;
    elsif mul = '1' then
        o.x <= a.x * b.x - a.y * b.y;
        o.y <= a.x * b.y + a.y * b.x;
    end if;
end process;
	
end farzan;