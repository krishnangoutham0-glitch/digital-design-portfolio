read_verilog counter.v
proc
memory
opt
async2sync
rename counter counter_gold

read_verilog build/counter_synth.v
proc
memory
opt
async2sync
rename counter counter_gate

equiv_make counter_gold counter_gate equiv

hierarchy -top equiv

equiv_simple
equiv_induct

equiv_status