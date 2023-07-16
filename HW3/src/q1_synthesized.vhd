library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.complex_matrix_pkg.ALL;


entity matrix_operations is
	port (
        add: in std_logic;
        mul: in std_logic;
		fill: in std_logic;
		print_A: in std_logic;
		print_B: in std_logic;
		print_Added: in std_logic;
		print_Multiplied: in std_logic
    );
end entity matrix_operations;

architecture behavioral of matrix_operations is
    -- Include the complex_matrix_pkg package
--    use work.complex_matrix_pkg.all;

    -- Declare input and output matrices
    shared variable Matrix_A, Matrix_B, Matrix_Added, Matrix_Multiplied: matrix;

begin
    -- Instantiate the complex_matrix_pkg package
    -- matrix_pkg_inst: complex_matrix_pkg;
	
	process( add, mul, fill, print_A, print_B, print_Added, print_Multiplied) 
		
	begin
	--report "Hello"
--		severity NOTE;
			
	if ( fill = '1' ) then
		-- Fill Matrix_A and Matrix_B randomly
	    fill_matrix_randomly(Matrix_A);
	    fill_matrix_randomly(Matrix_B);
	elsif ( add = '1' ) then
		-- Add the matrices
    	Matrix_Added := add_matrices(Matrix_A, Matrix_B);
	elsif ( mul = '1' ) then
		-- Multiply the matrices
    	Matrix_Multiplied := multiply_matrices(Matrix_A, Matrix_B);
	elsif ( print_A = '1' ) then
		report "Matrix A";
    	print_matrix(Matrix_A);
	elsif ( print_B = '1' ) then
		report "Matrix B";
		print_matrix(Matrix_B);
	elsif ( print_Added = '1' ) then
		report "Added Matrix";
		print_matrix(Matrix_Added);
	elsif ( print_Multiplied = '1' ) then
		report "Multiplied Matrix";
		print_matrix(Matrix_Multiplied);
	else 
	    null;    
	end if;		
	
	end process;	

end architecture behavioral;

