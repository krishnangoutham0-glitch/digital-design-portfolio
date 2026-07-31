# ============================================
# Technology-aware synthesis using Nangate45
# Design : FSM
# ============================================

# Read Nangate45 Liberty library
read_liberty -lib \
/Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
# Read RTL
read_verilog fsm.v

# Set top module
hierarchy -top fsm

# Generic synthesis
proc
opt
fsm
opt
memory
opt

# Technology mapping
techmap
opt

# Map flip-flops
dfflibmap -liberty /Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

# Map combinational logic
abc -liberty /Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

# Cleanup
clean

# Report statistics
stat

# Write synthesized netlist
write_verilog fsm_gate.v