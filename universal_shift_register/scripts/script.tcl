read_verilog   universal_shift_register.v

hierarchy -top universal_shift_register
proc
opt

show -format png -prefix gate_netlist

stat

write_verilog universal_shift_register_synth.v