library IEEE;
use IEEE.std_logic_1164.all;

entity UNARY_TO_BINARY is
	port (
	unary: in std_logic_vector(15 downto 0);
	binary: out std_logic_vector(3 downto 0) 
		);
end UNARY_TO_BINARY;

architecture transform of UNARY_TO_BINARY is
begin
	binary <= "0000" when unary = "0000000000000000" else 
        "0001" when unary = "0000000000000001" else 
        "0010" when unary = "0000000000000011" else 
        "0011" when unary = "0000000000000111" else 
        "0100" when unary = "0000000000001111" else 
        "0101" when unary = "0000000000011111" else 
        "0110" when unary = "0000000000111111" else 
        "0111" when unary = "0000000001111111" else 
        "1000" when unary = "0000000011111111" else 
        "1001" when unary = "0000000111111111" else 
        "1010" when unary = "0000001111111111" else 
        "1011" when unary = "0000011111111111" else 
        "1100" when unary = "0000111111111111" else 
        "1101" when unary = "0001111111111111" else 
        "1110" when unary = "0011111111111111" else 
        "1111" when unary = "0111111111111111" else 
        "XXXX";

end transform;