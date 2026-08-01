###############################################################################
# Mini ALU System Configuration
###############################################################################

export DESIGN_NAME = top
export PLATFORM = nangate45

export VERILOG_FILES = \
$(DESIGN_HOME)/alu.v \
$(DESIGN_HOME)/counter.v \
$(DESIGN_HOME)/single_port_ram.v \
$(DESIGN_HOME)/top.v

export SDC_FILE = $(DESIGN_HOME)/constraints.sdc

#------------------------------------------------------------------------------
# Synthesis
#------------------------------------------------------------------------------
export ABC_AREA = 1
export SYNTH_REPEATABLE_BUILD = 1

#------------------------------------------------------------------------------
# Floorplanning
#------------------------------------------------------------------------------
export CORE_UTILIZATION = 10
export CORE_ASPECT_RATIO = 1

export PLACE_DENSITY = 0.20
export PLACE_DENSITY_LB_ADDON = 0.10

export DIE_AREA = 0 0 120 120
export CORE_AREA = 10 10 110 110

#------------------------------------------------------------------------------
# Timing
#------------------------------------------------------------------------------
export TNS_END_PERCENT = 100