###############################################################################
# Created by write_sdc
###############################################################################
current_design top
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_transition 0.1000 [get_clocks {clk}]
set_clock_uncertainty 0.1000 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {alu_result_out[0]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {alu_result_out[1]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {alu_result_out[2]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {alu_result_out[3]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {alu_result_out[4]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {alu_result_out[5]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {alu_result_out[6]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {alu_result_out[7]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {dest_out[0]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {dest_out[1]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {dest_out[2]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {dest_out[3]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {halt_out}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc_out[0]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc_out[1]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc_out[2]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc_out[3]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc_out[4]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc_out[5]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc_out[6]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc_out[7]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reg_write_out}]
set_false_path\
    -from [get_ports {reset}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0500 [get_ports {halt_out}]
set_load -pin_load 0.0500 [get_ports {reg_write_out}]
set_load -pin_load 0.0500 [get_ports {alu_result_out[7]}]
set_load -pin_load 0.0500 [get_ports {alu_result_out[6]}]
set_load -pin_load 0.0500 [get_ports {alu_result_out[5]}]
set_load -pin_load 0.0500 [get_ports {alu_result_out[4]}]
set_load -pin_load 0.0500 [get_ports {alu_result_out[3]}]
set_load -pin_load 0.0500 [get_ports {alu_result_out[2]}]
set_load -pin_load 0.0500 [get_ports {alu_result_out[1]}]
set_load -pin_load 0.0500 [get_ports {alu_result_out[0]}]
set_load -pin_load 0.0500 [get_ports {dest_out[3]}]
set_load -pin_load 0.0500 [get_ports {dest_out[2]}]
set_load -pin_load 0.0500 [get_ports {dest_out[1]}]
set_load -pin_load 0.0500 [get_ports {dest_out[0]}]
set_load -pin_load 0.0500 [get_ports {pc_out[7]}]
set_load -pin_load 0.0500 [get_ports {pc_out[6]}]
set_load -pin_load 0.0500 [get_ports {pc_out[5]}]
set_load -pin_load 0.0500 [get_ports {pc_out[4]}]
set_load -pin_load 0.0500 [get_ports {pc_out[3]}]
set_load -pin_load 0.0500 [get_ports {pc_out[2]}]
set_load -pin_load 0.0500 [get_ports {pc_out[1]}]
set_load -pin_load 0.0500 [get_ports {pc_out[0]}]
set_driving_cell -lib_cell BUF_X1 -pin {Z} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
###############################################################################
# Design Rules
###############################################################################
