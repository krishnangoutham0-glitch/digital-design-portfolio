###############################################################################
# Mini ALU System Timing Constraints
###############################################################################

#----------------------------------------------------------------------------
# Clock Definition
#----------------------------------------------------------------------------
create_clock -name clk \
             -period 10.000 \
             -waveform {0.000 5.000} \
             [get_ports clk]

#----------------------------------------------------------------------------
# Clock Uncertainty
#----------------------------------------------------------------------------
set_clock_uncertainty -setup 0.20 [get_clocks clk]
set_clock_uncertainty -hold  0.05 [get_clocks clk]

#----------------------------------------------------------------------------
# Clock Transition (Slew)
#----------------------------------------------------------------------------
set_clock_transition 0.10 [get_clocks clk]

#----------------------------------------------------------------------------
# Clock Source Latency
#----------------------------------------------------------------------------
set_clock_latency -source 0.30 [get_clocks clk]

#----------------------------------------------------------------------------
# Input Delays
#----------------------------------------------------------------------------

# Reset
set_input_delay -clock clk -max 1.00 [get_ports reset]
set_input_delay -clock clk -min 0.20 [get_ports reset]

# Counter Direction
set_input_delay -clock clk -max 1.00 [get_ports up_down]
set_input_delay -clock clk -min 0.20 [get_ports up_down]

# ALU Input A
set_input_delay -clock clk -max 1.00 [get_ports A]
set_input_delay -clock clk -min 0.20 [get_ports A]

# ALU Input B
set_input_delay -clock clk -max 1.00 [get_ports B]
set_input_delay -clock clk -min 0.20 [get_ports B]

#----------------------------------------------------------------------------
# Output Delays
#----------------------------------------------------------------------------

# Counter Output
set_output_delay -clock clk -max 1.50 [get_ports count]
set_output_delay -clock clk -min 0.20 [get_ports count]

# ALU Result
set_output_delay -clock clk -max 1.50 [get_ports result]
set_output_delay -clock clk -min 0.20 [get_ports result]

# RAM Output
set_output_delay -clock clk -max 1.50 [get_ports data_out]
set_output_delay -clock clk -min 0.20 [get_ports data_out]

#----------------------------------------------------------------------------
# Driving Cell
#----------------------------------------------------------------------------
# Uncomment if supported by the standard cell library
#
# set_driving_cell -lib_cell BUF_X1 [all_inputs]

#----------------------------------------------------------------------------
# Output Load
#----------------------------------------------------------------------------

set_load 0.05 [get_ports count]
set_load 0.05 [get_ports result]
set_load 0.05 [get_ports data_out]

###############################################################################
# End of File
###############################################################################