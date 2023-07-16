SetActiveLib -work
comp -include "$dsn\src\q2.vhd" 
comp -include "$dsn\src\TestBench\two_bit_alu_TB.vhd" 
asim +access +r TESTBENCH_FOR_two_bit_alu 
wave 
wave -noreg A
wave -noreg B
wave -noreg CONTROL_BITS
wave -noreg O
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\two_bit_alu_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_two_bit_alu 
