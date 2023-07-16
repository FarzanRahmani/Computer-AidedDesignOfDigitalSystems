SetActiveLib -work
comp -include "$dsn\src\q1.vhd" 
comp -include "$dsn\src\TestBench\matrix_adder_TB.vhd" 
asim +access +r TESTBENCH_FOR_matrix_adder 
wave 
wave -noreg i
wave -noreg o
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\matrix_adder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_matrix_adder 
