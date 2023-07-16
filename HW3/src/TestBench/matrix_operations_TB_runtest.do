SetActiveLib -work
comp -include "$dsn\src\q1_synthesized.vhd" 
comp -include "$dsn\src\TestBench\matrix_operations_TB.vhd" 
asim +access +r TESTBENCH_FOR_matrix_operations 
wave 
wave -noreg add
wave -noreg mul
wave -noreg fill
wave -noreg print_A
wave -noreg print_B
wave -noreg print_Added
wave -noreg print_Multiplied
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\matrix_operations_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_matrix_operations 
