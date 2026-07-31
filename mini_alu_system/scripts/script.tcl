#=========================================
# Read Design
#=========================================

read_verilog counter.v
read_verilog alu.v
read_verilog single_port_ram.v
read_verilog top.v

hierarchy -check -top top

#=========================================
# RTL Processing
#=========================================

proc
opt
fsm
opt
memory
memory_map
opt

flatten
techmap
opt

show -format png -prefix top_gate top

#=========================================
# RTL Checks
#=========================================

check
stat

#=========================================
# RTL Schematic
#=========================================

show -format png -prefix top_rtl top

#=========================================
# Generic Synthesis
#=========================================

techmap
opt

#=========================================
# Gate-Level Checks
#=========================================

check
stat

#=========================================
# Netlist
#=========================================

write_verilog top_synth.v

#=========================================
# Gate-Level Schematic
#=========================================

show -format png -prefix top_gate top

#=========================================
# Report
#=========================================

tee -o top_report.txt stat