SetActiveLib -work
comp -include "$dsn\src\q2_synthesized.vhd" 
comp -include "$dsn\src\TestBench\q2_TB.vhd" 
asim +access +r TESTBENCH_FOR_q2 
wave 
wave -noreg bin_in
wave -noreg bin_out
wave -noreg bcd_in
wave -noreg bcd_out
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\q2_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_q2 
