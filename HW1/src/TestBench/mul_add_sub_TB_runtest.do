SetActiveLib -work
comp -include "$dsn\src\q5.vhd" 
comp -include "$dsn\src\TestBench\mul_add_sub_TB.vhd" 
asim +access +r TESTBENCH_FOR_mul_add_sub 
wave 
wave -noreg a
wave -noreg b
wave -noreg mul
wave -noreg add
wave -noreg sub
wave -noreg o
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\mul_add_sub_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_mul_add_sub 
