SetActiveLib -work
comp -include "$dsn\src\q3_Moore.vhd" 
comp -include "$dsn\src\TestBench\moore_fsm_TB.vhd" 
asim +access +r TESTBENCH_FOR_moore_fsm 
wave 
wave -noreg clk
wave -noreg reset
wave -noreg input
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\moore_fsm_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_moore_fsm 
