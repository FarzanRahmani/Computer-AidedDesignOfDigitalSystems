SetActiveLib -work
comp -include "$dsn\src\q4.vhd" 
comp -include "$dsn\src\TestBench\dot_product_TB.vhd" 
asim +access +r TESTBENCH_FOR_dot_product 
wave 
wave -noreg A
wave -noreg B
wave -noreg O
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\dot_product_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_dot_product 
