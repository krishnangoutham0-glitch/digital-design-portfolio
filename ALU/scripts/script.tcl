#=========================================================
# Yosys Synthesis Script
# Design : ALU
#=========================================================

# Read RTL
read_verilog alu.v

# Set top module
hierarchy -top alu

# Check design consistency
check

# Convert behavioral processes to netlists
proc

# Optimize logic
opt

# Generate RTL schematic (.dot file)
show -format dot -prefix alu_rtl

# Print design statistics
stat

# Write generic synthesized netlist
write_verilog alu_netlist.v

#---------------------------------------------------------
# Full synthesis
#---------------------------------------------------------
synth

# Statistics after synthesis
stat

# Write synthesized gate-level netlist
write_verilog alu_synth.v

echo ""
echo "======================================="
echo " Yosys Script Completed Successfully"
echo "======================================="