-- For the binary reverser function with an input of length 5, here's a code snippet to synthesize the module:

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use work.recursive_functions.all;


entity q2 is
    Port (
	bin_in : in std_logic_vector(4 downto 0);
    bin_out : out std_logic_vector(4 downto 0);
	bcd_in : in std_logic_vector(7 downto 0);
	bcd_out : out std_logic_vector(7 downto 0) 
    );
end q2;

architecture Synth of q2 is

	--signal bin_num : std_logic_vector(4 downto 0) := "11000";
--    signal reversed_num : std_logic_vector(4 downto 0);
--    signal bcd_num : std_logic_vector(7 downto 0) := "00010010";
--    signal converted_bcd_num : std_logic_vector(7 downto 0);

begin
	
	--process
--    begin
--        reversed_num <= binary_reverser(bin_num);
--        converted_bcd_num <= bcd_to_binary(bcd_num);
--        wait;
--    end process;
    -- bin_out <= reversed_num;
    -- bcd_out <= converted_bcd_num;
	
     process (bin_in)
     begin
         if ( bin_in /= "UUUUU" ) then
             bin_out <= binary_reverser(bin_in);
         end if;
     end process;
	 process (bcd_in)
     begin
         if ( bcd_in /= "UUUUUUUU" ) then
             bin_out <= bcd_to_binary(bcd_in);
         end if;
     end process;
	
--	 process
--         variable Input_binary : std_logic_vector(4 downto 0) := "11000";
--         -- variable Reversed_Result : std_logic_vector(Binary_Reverser(Input_binary)'length - 1 downto 0);
--         variable Reversed_Result : std_logic_vector(4 downto 0) := "00000";
--         variable input_bcd : std_logic_vector(7 downto 0) := "00010010";
--         -- variable Binary_Result : std_logic_vector(BCD_to_Binary(input_bcd)'length - 1 downto 0);
--         variable converted_BCD : std_logic_vector(7 downto 0) := "00000000";
--     begin
--         Reversed_Result := Binary_Reverser(Input_binary);
--         converted_BCD := bcd_to_binary(input_bcd);
--    --     bin_out <= Reversed_Result;
--    --     bcd_out <= converted_BCD;
--         wait;
--     end process;

end Synth;
