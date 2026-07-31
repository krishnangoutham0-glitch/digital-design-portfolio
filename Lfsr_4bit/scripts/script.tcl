read_verilog lfsr_4bit.v
hierarchy -check -top lfsr_4bit

proc
opt
fsm
opt
memory
opt

check
stat

show -format png -prefix lfsr_4bit_rtl

techmap
opt

check
stat

write_verilog lfsr_4bit_synth.v

show -format png -prefix lfsr_4bit_gate

tee -o lfsr_4bit_report.txt stat