read_verilog rtl/lfsr_4bit.v

hierarchy -check -top lfsr_4bit

proc
opt

fsm
opt

memory
opt

techmap
opt

dfflibmap -liberty /Users/gouthamkrishnan/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

abc -liberty /Users/gouthamkrishnan/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

clean

write_verilog -noattr synth/lfsr_4bit_synth.v

stat

show \
-prefix images/gate_schematic \
-format svg