###############################################################################
# Created by write_sdc
###############################################################################
current_design counter
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_transition 0.1000 [get_clocks {clk}]
set_clock_uncertainty -setup 0.2000 clk
set_clock_uncertainty -hold 0.0500 clk
set_propagated_clock [get_clocks {clk}]
set_clock_latency -source 0.3000 [get_clocks {clk}]
set_input_delay 0.2000 -clock [get_clocks {clk}] -min -add_delay [get_ports {reset}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -max -add_delay [get_ports {reset}]
set_input_delay 0.2000 -clock [get_clocks {clk}] -min -add_delay [get_ports {up_down}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -max -add_delay [get_ports {up_down}]
set_output_delay 0.2000 -clock [get_clocks {clk}] -min -add_delay [get_ports {count[0]}]
set_output_delay 1.5000 -clock [get_clocks {clk}] -max -add_delay [get_ports {count[0]}]
set_output_delay 0.2000 -clock [get_clocks {clk}] -min -add_delay [get_ports {count[1]}]
set_output_delay 1.5000 -clock [get_clocks {clk}] -max -add_delay [get_ports {count[1]}]
set_output_delay 0.2000 -clock [get_clocks {clk}] -min -add_delay [get_ports {count[2]}]
set_output_delay 1.5000 -clock [get_clocks {clk}] -max -add_delay [get_ports {count[2]}]
set_output_delay 0.2000 -clock [get_clocks {clk}] -min -add_delay [get_ports {count[3]}]
set_output_delay 1.5000 -clock [get_clocks {clk}] -max -add_delay [get_ports {count[3]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0500 [get_ports {count[3]}]
set_load -pin_load 0.0500 [get_ports {count[2]}]
set_load -pin_load 0.0500 [get_ports {count[1]}]
set_load -pin_load 0.0500 [get_ports {count[0]}]
###############################################################################
# Design Rules
###############################################################################
