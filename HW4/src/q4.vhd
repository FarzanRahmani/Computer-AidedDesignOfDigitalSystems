library IEEE;
use IEEE.std_logic_1164.all;

entity BINARY_TO_UNARY is
    port (
        binary: in std_logic_vector(2 downto 0);
        unary: out std_logic_vector(7 downto 0)
    );
end BINARY_TO_UNARY;

architecture transform of BINARY_TO_UNARY is
begin
    process (binary)
    begin
        case binary is
            when "000" =>
                unary <= "00000000";

            when "001" =>
                unary <= "00000001";

            when "010" =>
                unary <= "00000011";

            when "011" =>
                unary <= "00000111";

            when "100" =>
                unary <= "00001111";

            when "101" =>
                unary <= "00011111";

            when "110" =>
                unary <= "00111111";

            when "111" =>
                unary <= "01111111";

            when others =>
                unary <= (others => 'X');
        end case;
    end process;
end transform;
