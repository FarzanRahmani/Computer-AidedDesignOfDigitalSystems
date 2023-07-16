SetActiveLib -work
comp -include "$dsn\src\q3.vhd" 
comp -include "$dsn\src\TestBench\one_by_one_TB.vhd" 
asim +access +r TESTBENCH_FOR_one_by_one 
wave 
wave -noreg input
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\one_by_one_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_one_by_one 
