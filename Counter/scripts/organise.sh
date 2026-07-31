#!/bin/bash

echo "Creating project structure..."

mkdir -p rtl
mkdir -p tb
mkdir -p constraints
mkdir -p scripts
mkdir -p sim
mkdir -p synth
mkdir -p sta
mkdir -p images
mkdir -p output

########################################
# RTL
########################################
[ -f counter.v ] && mv counter.v rtl/

########################################
# Testbench
########################################
[ -f counter_tb.v ] && mv counter_tb.v tb/
[ -f test.v ] && mv test.v tb/

########################################
# Constraints
########################################
[ -f constraints.sdc ] && mv constraints.sdc constraints/

########################################
# Scripts
########################################
[ -f run.sh ] && mv run.sh scripts/
[ -f config.mk ] && mv config.mk scripts/
[ -f floor.tcl ] && mv floor.tcl scripts/
[ -f sta_script.tcl ] && mv sta_script.tcl scripts/
[ -f script.tcl ] && mv script.tcl scripts/
[ -f lec.tcl ] && mv lec.tcl scripts/

########################################
# Simulation
########################################
[ -f counter_sim ] && mv counter_sim sim/
[ -f sim.vvp ] && mv sim.vvp sim/
[ -f counter.vcd ] && mv counter.vcd sim/
[ -d waves ] && mv waves sim/

########################################
# Synthesis
########################################
[ -f counter_synth.v ] && mv counter_synth.v synth/
[ -d netlist ] && mv netlist synth/
[ -d schematics ] && mv schematics synth/

########################################
# STA
########################################
[ -f sta_report.log ] && mv sta_report.log sta/

########################################
# Images
########################################
[ -f counter_gate.png ] && mv counter_gate.png images/
[ -f counter_rtl.png ] && mv counter_rtl.png images/

########################################
# Physical Design Output
########################################
[ -d build ] && mv build output/
[ -d logs ] && mv logs output/
[ -d reports ] && mv reports output/
[ -d coverage ] && mv coverage output/
[ -d coverage_report ] && mv coverage_report output/
[ -d obj_dir ] && mv obj_dir output/
[ -f counter_floorplan.def ] && mv counter_floorplan.def output/

echo ""
echo "========================================"
echo " Project organized successfully!"
echo "========================================"