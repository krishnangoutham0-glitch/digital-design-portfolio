############################################################
# 1. Read Technology LEF
############################################################

read_lef /Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef

############################################################
# 2. Read Standard Cell LEF
############################################################

read_lef /Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef

############################################################
# 3. Read Liberty
############################################################

read_liberty /Users/gouthamkrishnan/PDK/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

############################################################
# 4. Read Netlist
############################################################

read_verilog counter_synth.v

############################################################
# 5. Link Design
############################################################

link_design counter

############################################################
# 6. Create Floorplan
############################################################

initialize_floorplan \
    -site FreePDK45_38x28_10R_NP_162NW_34O \
    -utilization 50 \
    -aspect_ratio 1.0 \
    -core_space 2


# IO Pin Placement
############################################################

place_pins \
    -hor_layers metal2 \
    -ver_layers metal3


############################################################
# Placement
############################################################

global_placement

detailed_placement

check_placement
############################################################
# 7. Save DEF
############################################################

write_def counter_floorplan.def

############################################################
# 8. Launch GUI
############################################################

gui