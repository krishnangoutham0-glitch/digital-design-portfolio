export DESIGN_NAME = lfsr_4bit
export PLATFORM = nangate45

export VERILOG_FILES = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/lfsr_4bit.v
export SDC_FILE = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/constraints.sdc

# Remove automatic floorplanning
# export CORE_UTILIZATION = 10

export CORE_ASPECT_RATIO = 1

export DIE_AREA = 0 0 120 120
export CORE_AREA = 10 10 110 110

export PLACE_DENSITY = 0.20
export PLACE_DENSITY_LB_ADDON = 0.10

export TNS_END_PERCENT = 100
export SYNTH_REPEATABLE_BUILD = 1

export PDN_TCL = $(PLATFORM_DIR)/grid_strategy-M1-M4-M7.tcl