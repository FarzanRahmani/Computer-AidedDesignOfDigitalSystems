SetActiveLib -work
comp -include "$dsn\src\q3_MC.vhd" 
comp -include "$dsn\src\TestBench\main_component_TB.vhd" 
asim +access +r TESTBENCH_FOR_main_component 
wave 
wave -noreg clk
wave -noreg reset
wave -noreg image_in
wave -noreg filter_in
wave -noreg feature_map
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\main_component_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_main_component 
