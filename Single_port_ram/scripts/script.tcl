#=========================================
# Read Design
#=========================================
read_verilog single_port_ram.v
hierarchy -check -top single_port_ram

#=========================================
# RTL Processing
#=========================================
proc
opt
fsm
opt
memory
opt

#=========================================
# RTL Checks
#=========================================
check
stat

#=========================================
# RTL Schematic
#=========================================
show -format png -prefix single_port_ram_rtl

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
write_verilog single_port_ram_synth.v

#=========================================
# Gate-Level Schematic
#=========================================
show -format png -prefix single_port_ram_gate

#=========================================
# Report
#=========================================
tee -o single_port_ram_report.txt statyo