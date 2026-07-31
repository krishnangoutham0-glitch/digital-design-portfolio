export DESIGN_NAME = counter
export PLATFORM = nangate45

export VERILOG_FILES = /Users/gouthamkrishnan/ASIC_Projects/Counter/rtl/counter.v

export SDC_FILE = /Users/gouthamkrishnan/ASIC_Projects/Counter/constraints/constraint.sdc

export PDN_TCL = /Users/gouthamkrishnan/ASIC_Projects/Counter/grid_strategy-M1-M4-M7.tcl

# Synthesis
export ABC_AREA = 1
export SYNTH_REPEATABLE_BUILD = 1

# Make the core much larger
export CORE_UTILIZATION = 10
export CORE_ASPECT_RATIO = 1

# Give extra whitespace
export PLACE_DENSITY = 0.20
export PLACE_DENSITY_LB_ADDON = 0.10

# Explicit die size (large enough for PDN)
export DIE_AREA = 0 0 100 100
export CORE_AREA = 10 10 90 90

export TNS_END_PERCENT = 100