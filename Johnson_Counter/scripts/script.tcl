read_verilog johnson_counter.v

hierarchy -top johnson_counter

proc
opt

show -format png -prefix gate_netlist

stat

write_verilog johnson_counter_synth.v