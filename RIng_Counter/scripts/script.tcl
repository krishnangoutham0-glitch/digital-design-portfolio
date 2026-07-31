read_verilog ring_counter.v

hierarchy -top ring_counter

proc
opt

show -format png -prefix gate_netlist

stat

write_verilog ring_counter_synth.v