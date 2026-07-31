#=========================================================
# Read RTL
#=========================================================
read_verilog counter.v

#=========================================================
# Set Top Module
#=========================================================
hierarchy -check -top counter

#=========================================================
# RTL -> Netlist
#=========================================================
proc
opt
fsm
opt

memory
memory_map

techmap
opt

#---------------------------------------------------------
# Map Flip-Flops
#---------------------------------------------------------
dfflibmap -liberty /Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

#---------------------------------------------------------
# Map Combinational Logic
#---------------------------------------------------------
abc -liberty /Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

clean
opt

stat

write_verilog -noattr counter_synth.v