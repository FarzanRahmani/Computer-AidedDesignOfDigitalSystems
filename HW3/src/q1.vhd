-- Here's a basic design of a VHDL package that implements complex matrix operations 
-- using procedures and functions:

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.MATH_REAL.ALL;
-- USE ieee.MATH_REAL.uniform;
USE std.textio.all;

package complex_matrix_pkg is

    -- Define a custom complex data type
    type complex is record
        real_part: real;
        imag_part: real;
    end record;

    -- Define a generic size for matrix dimensions
    constant matrix_size: positive := 3; -- 10

    -- Define a matrix type using the complex type
    type matrix is array (0 to matrix_size - 1, 0 to matrix_size - 1) of complex;

    -- Function to add two given matrices
    function add_matrices(A: matrix; B: matrix) return matrix;

    -- Function to multiply two given matrices
    function multiply_matrices(A: matrix; B: matrix) return matrix;

    -- Procedure to fill a matrix randomly
    procedure fill_matrix_randomly(out_matrix: out matrix);

    -- Procedure to print out the result
    procedure print_matrix(M: matrix);	
	
	shared variable seed1 : integer := 999;
	shared variable seed2 : integer := 999;

end complex_matrix_pkg;

package body complex_matrix_pkg is

    function add_matrices(A: matrix; B: matrix) return matrix is
        variable result: matrix;
    begin
        for i in 0 to matrix_size - 1 loop
            for j in 0 to matrix_size - 1 loop
                result(i, j).real_part := A(i, j).real_part + B(i, j).real_part;
                result(i, j).imag_part := A(i, j).imag_part + B(i, j).imag_part;
            end loop;
        end loop;
        return result;
    end function add_matrices;

    function multiply_matrices(A: matrix; B: matrix) return matrix is
        variable result: matrix;
        variable temp: complex;
    begin
        for i in 0 to matrix_size - 1 loop
            for j in 0 to matrix_size - 1 loop
                temp.real_part := 0.0;
                temp.imag_part := 0.0;
                for k in 0 to matrix_size - 1 loop
                    temp.real_part := temp.real_part + (A(i, k).real_part * B(k, j).real_part) - (A(i, k).imag_part * B(k, j).imag_part);
                    temp.imag_part := temp.imag_part + (A(i, k).real_part * B(k, j).imag_part) + (A(i, k).imag_part * B(k, j).real_part);
                end loop;
                result(i, j) := temp;
            end loop;
        end loop;
        return result;
    end function multiply_matrices;

    procedure fill_matrix_randomly(out_matrix: out matrix) is
	-- procedure fill_matrix_randomly(out_matrix: out matrix, seed: inout integer) is
	variable r : real;
	variable max_val : real := 1000.0;
	variable min_val : real := 0.0;
	-- variable seed1, seed2 : integer := 	999;
    begin
		--seed1 := 999;
		--seed2 := 999;
		--max_val := 1000.0;
		--min_val := 0.0;
        for i in 0 to matrix_size - 1 loop
            for j in 0 to matrix_size - 1 loop
				
				uniform(seed1, seed2, r);
				seed1 := seed1 - 1; 
  				r := r * (max_val - min_val) + min_val;
				out_matrix(i, j).real_part := r;
				
				uniform(seed1, seed2, r);
				seed2 := seed2 - 1;
				r := r * (max_val - min_val) + min_val;
				out_matrix(i, j).imag_part := r;			
            end loop;
        end loop;
    end procedure fill_matrix_randomly;

    procedure print_matrix(M: matrix) is
    begin
        for i in 0 to matrix_size - 1 loop
            for j in 0 to matrix_size - 1 loop
                report "M(" & integer'image(i) & "," & integer'image(j) & ") = (" &
                       real'image(M(i, j).real_part) & " + " & real'image(M(i, j).imag_part) & "j)";
            end loop;
        end loop;
    end procedure print_matrix;

end complex_matrix_pkg;



-- This package provides a custom complex data type, a matrix type using the complex data
-- type, and functions and procedures for adding, multiplying, filling, and printing 
-- matrices. The matrix dimensions are specified using the matrix_size constant, which can
--  be modified to accommodate matrices of different dimensions.