library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_ARITH.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
-- USE std.textio.all;

package recursive_functions is
    -- BCD to binary conversion function
    -- function bcd_to_binary(bcd: std_logic_vector) return std_logic_vector;
    function bcd_to_binary(bcd_num : in std_logic_vector) return std_logic_vector;
    function bcd_to_binary(bcd_num : in std_logic_vector) return unsigned;
    
    -- Binary reverser function
    function binary_reverser(bin: in std_logic_vector) return std_logic_vector;
	-- function binary_reverser(bin_num : in std_logic_vector) return std_logic_vector;
	-- function binary_reverser(Input : in std_logic_vector) return std_logic_vector;
	
end package recursive_functions;

package body recursive_functions is
    -- BCD to binary conversion function
    -- function bcd_to_binary(bcd: std_logic_vector) return std_logic_vector is
    -- variable binary_result: std_logic_vector(bcd'length-1 downto 0) := (others => '0');
    -- begin
    --     if bcd = "0000" then
    --         return binary_result;
    --     else
    --         binary_result := bcd_to_binary(bcd - "0001");
    --         return binary_result + 1;
    --     end if;
    -- end function bcd_to_binary;

     function bcd_to_binary(bcd_num : in std_logic_vector) return std_logic_vector is
         variable Result : std_logic_vector(3 downto 0);
     begin
         if bcd_num = "0000" then
             Result := "0000";
         else
             Result := std_logic_vector(unsigned(Result) * 10 + (to_integer(unsigned(bcd_num(3 downto 0)))));
             Result := bcd_to_binary(bcd_num(7 downto 4)) & Result;
         end if;
        
         return Result;
     end bcd_to_binary;
    
	-- function bcd_to_binary(bcd_num : in std_logic_vector) return unsigned is
    --     variable bcd_len : natural := bcd_num'length;
    --     variable bcd_val : unsigned(bcd_len*4-1 downto 0) := (others => '0');
    -- begin
    --     if bcd_len > 0 then
    --         -- bcd_val := bcd_to_binary(bcd_num(bcd_len-1 downto 0));
    --         -- bcd_val := bcd_val + unsigned(to_integer(unsigned(bcd_num(bcd_len))) * 10**(4*bcd_len-4));
    --         bcd_val := bcd_to_binary(bcd_num(bcd_len-2 downto 0));
    --         bcd_val := bcd_val + unsigned(to_integer(unsigned(bcd_num(bcd_len - 1))) * 10**(4*bcd_len-4));
    --     end if;
    --     return bcd_val;
    -- end function bcd_to_binary;

    function bcd_to_binary(bcd_num : in std_logic_vector) return unsigned is
        variable bcd_len : natural := bcd_num'length;
        variable bcd_val : unsigned(bcd_len-1 downto 0) := (others => '0');
    begin
        if bcd_len > 4 then
            bcd_val := bcd_to_binary(bcd_num((bcd_len-1)-4 downto 0));
            -- bcd_val := bcd_val + unsigned(to_integer(unsigned(bcd_num(bcd_len - 1 downto bcd_len - 4))) * (10**((bcd_len-4) / 4)) );
        end if;
        return bcd_val;
    end function bcd_to_binary;



	
	
    -- Binary reverser function
     function binary_reverser(bin: in std_logic_vector) return std_logic_vector is
     variable reversed_bin: std_logic_vector(bin'length-1 downto 0) := (others => '0');
     begin
         if bin'length = 1 then
             return bin;
         else
             reversed_bin(bin'length-1) := bin(0);
             reversed_bin(bin'length-2 downto 0) := binary_reverser(bin(bin'length-1 downto 1));
             return reversed_bin;
         end if;
     end function binary_reverser;

    -- function binary_reverser(bin_num : in std_logic_vector) return std_logic_vector is
    --     variable bin_len : natural := bin_num'length;
    --     variable reversed_num: std_logic_vector(bin_len-1 downto 0) := (others => '0');
    -- begin
    --     if bin_len > 0 then
    --     reversed_num(bin_len-1) := bin_num(0);
    --     reversed_num(bin_len-2 downto 0) := binary_reverse(bin_num(1 to bin_len-1));
    --     end if;
    --     return reversed_num;
    -- end function binary_reverser;
    
    --function binary_reverser(Input : in std_logic_vector) return std_logic_vector is
--        variable Result : std_logic_vector(Input'length - 1 downto 0);
--    begin
--        if Input'length = 1 then
--        	Result := Input;
--        else
--        	Result := binary_reverser(Input(0 to Input'length-2)) & Input(Input'length-1);
--        end if;
--        
--        return Result;
--    end binary_reverser;

end package body recursive_functions;