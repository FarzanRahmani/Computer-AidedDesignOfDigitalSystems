SetActiveLib -work
comp -include "$dsn\src\q4.vhd" 
comp -include "$dsn\src\TestBench\alarm_clock_TB.vhd" 
asim +access +r TESTBENCH_FOR_alarm_clock 
wave 
wave -noreg clk
wave -noreg reset
wave -noreg clock_set
wave -noreg alarm_set
wave -noreg alarm_stop
wave -noreg input_time
wave -noreg on_alarm
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\alarm_clock_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_alarm_clock 
