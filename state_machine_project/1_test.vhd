library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end tb;

architecture beh of tb is
    component fsm is
        port (
            clk, input, reset : in std_logic;
            output : out std_logic
        );
    end component fsm;
signal input, clk, reset, output : std_logic;
begin
    UUT: fsm port map(clk => clk, input => input, reset => reset, output => output);
    process
    begin
        clk <= '0';
        wait for 20 ns;
        clk <= not clk;
        input <= '1';
        reset <= '0';
        wait for 20 ns;
        clk <= not clk;
        input <= '1';
        reset <= '0';
        wait for 20 ns;
        clk <= not clk;
        input <= '0';
        reset <= '0';
        wait for 20 ns;
        clk <= not clk;
        input <= '1';
        reset <= '0';
        wait for 20 ns;
        clk <= not clk;
        input <= '1';
        reset <= '1';
        wait for 20 ns;
        clk <= not clk;
        input <= '1';
        reset <= '0';
        wait for 20 ns;
        clk <= not clk;
        input <= '1';
        reset <= '0';
        wait for 20 ns;
    end process;
end beh;