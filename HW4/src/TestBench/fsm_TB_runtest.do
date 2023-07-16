SetActiveLib -work
comp -include "$dsn\src\q1.vhd" 
comp -include "$dsn\src\TestBench\fsm_TB.vhd" 
asim +access +r TESTBENCH_FOR_fsm 
wave 
wave -noreg clk
wave -noreg reset
wave -noreg input
wave -noreg start_index
wave -noreg end_index
wave -noreg last_start_index
wave -noreg last_end_index
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\fsm_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_fsm 
