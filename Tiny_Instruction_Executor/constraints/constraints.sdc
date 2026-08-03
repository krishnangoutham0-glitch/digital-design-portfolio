############################################################
# Tiny Instruction Executor
# Synopsys Design Constraints (SDC)
# Target Technology : Nangate45
############################################################

#===========================================================
# Clock Definition
#===========================================================

create_clock \
-name clk \
-period 10.000 \
-waveform {0.000 5.000} \
[get_ports clk]

#===========================================================
# Clock Characteristics
#===========================================================

# Clock uncertainty (jitter + skew)
set_clock_uncertainty 0.10 [get_clocks clk]

# Clock transition (slew)
set_clock_transition 0.10 [get_clocks clk]

# Source latency
set_clock_latency 0.20 [get_clocks clk]

#===========================================================
# Input Constraints
#===========================================================

# Reset arrives 1 ns after the clock edge
set_input_delay 1.00 \
-clock clk \
[get_ports reset]

# Drive strength of external reset source
set_driving_cell \
-lib_cell BUF_X1 \
[get_ports reset]

#===========================================================
# Reset Constraints
#===========================================================

# Reset is asynchronous and not part of normal timing
set_false_path \
-from [get_ports reset]

#===========================================================
# Output Constraints
#===========================================================

set_output_delay 1.00 -clock clk [get_ports pc_out*]
set_output_delay 1.00 -clock clk [get_ports halt_out]
set_output_delay 1.00 -clock clk [get_ports alu_result_out*]
set_output_delay 1.00 -clock clk [get_ports reg_write_out]
set_output_delay 1.00 -clock clk [get_ports dest_out*]

#===========================================================
# Output Loading
#===========================================================

# Assume each output drives a small external load
set_load 0.05 [all_outputs]