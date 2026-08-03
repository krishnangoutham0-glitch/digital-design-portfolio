#=========================================================
# Tiny Instruction Executor - Yosys Synthesis
#=========================================================

#---------------------------------------------------------
# Read RTL
#---------------------------------------------------------
read_verilog rtl/program_counter.v
read_verilog rtl/instruction_memory.v
read_verilog rtl/instruction_decoder.v
read_verilog rtl/register_file.v
read_verilog rtl/alu.v
read_verilog rtl/control_unit.v
read_verilog rtl/top.v

#---------------------------------------------------------
# Set Top Module
#---------------------------------------------------------
hierarchy -check -top top

#---------------------------------------------------------
# RTL -> Gate-Level
#---------------------------------------------------------
proc
opt

fsm
opt

memory
memory_map

techmap
opt

# flatten

#---------------------------------------------------------
# Map Flip-Flops
#---------------------------------------------------------
dfflibmap -liberty /Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

#---------------------------------------------------------
# Map Combinational Logic
#---------------------------------------------------------
abc -liberty /Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

#---------------------------------------------------------
# Final Optimization
#---------------------------------------------------------
clean -purge
opt

#---------------------------------------------------------
# Statistics
#---------------------------------------------------------
stat
stat -liberty /Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

#---------------------------------------------------------
# Write Synthesized Netlist
#---------------------------------------------------------
autoname -hide

write_verilog -noattr -simple-lhs netlist/top_synth.v

#---------------------------------------------------------
# Gate-Level Schematic (Top Module Only)
#---------------------------------------------------------
select -clear
select top
show -format svg -prefix images/gate/top_gate