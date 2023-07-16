-- Create a package to define the image, filter, types, functions, and procedures:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package image_filter_pkg is
    constant IMAGE_SIZE_X: integer := 30;
    constant IMAGE_SIZE_Y: integer := 30;
    constant FILTER_SIZE: integer := 3;
    constant MAX_UNITS: integer := 28; -- 1, 2, 4, 7, 14, 28
    subtype pixel_t is integer range 0 to 255;
    subtype filter_coeff_t is real range 0.0 to 1.0;
    type image_t is array (0 to IMAGE_SIZE_X-1, 0 to IMAGE_SIZE_Y-1) of pixel_t;
    type filter_t is array (0 to FILTER_SIZE-1, 0 to FILTER_SIZE-1) of filter_coeff_t;
    -- Additional types, functions and procedures can be added here
end package image_filter_pkg;