SetActiveLib -work
comp -include "$dsn\src\clock.vhdl" 
comp -include "$dsn\src\TestBench\alarmclock_TB.vhd" 
asim +access +r TESTBENCH_FOR_alarmclock 
wave 
wave -noreg clk
wave -noreg clock
wave -noreg alarms
wave -noreg stopwatch
wave -noreg reverse_timer
wave -noreg input_time
wave -noreg reset
wave -noreg reset_stopwatch
wave -noreg stop_stopwatch
wave -noreg clock_set
wave -noreg alarm_set
wave -noreg alarm_stop
wave -noreg revtimer_set
wave -noreg on_alarm
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\alarmclock_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_alarmclock 
