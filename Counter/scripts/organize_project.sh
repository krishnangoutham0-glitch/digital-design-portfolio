#!/bin/bash

echo "Organizing project: $(basename "$PWD")"

# Create directories
mkdir -p rtl
mkdir -p tb
mkdir -p constraints
mkdir -p scripts
mkdir -p sim
mkdir -p synth
mkdir -p sta
mkdir -p lec
mkdir -p pnr
mkdir -p docs
mkdir -p output

# RTL
mv *.v rtl/ 2>/dev/null

# Testbench
mv rtl/*tb*.v tb/ 2>/dev/null
mv rtl/test*.v tb/ 2>/dev/null

# Constraints
mv *.sdc constraints/ 2>/dev/null

# Scripts
mv *.tcl scripts/ 2>/dev/null
mv *.mk scripts/ 2>/dev/null
mv *.sh scripts/ 2>/dev/null

# Simulation
mv *.vcd sim/ 2>/dev/null
mv *.vvp sim/ 2>/dev/null
mv *_sim sim/ 2>/dev/null
mv waves sim/ 2>/dev/null

# Synthesis
mv *synth*.v synth/ 2>/dev/null
mv netlist synth/ 2>/dev/null
mv schematics synth/ 2>/dev/null

# STA
mv *sta*.log sta/ 2>/dev/null

# Documentation
mv *.png docs/ 2>/dev/null
mv *.pdf docs/ 2>/dev/null

# Generated output
mv build output/ 2>/dev/null
mv logs output/ 2>/dev/null
mv reports output/ 2>/dev/null
mv coverage output/ 2>/dev/null
mv coverage_report output/ 2>/dev/null
mv obj_dir output/ 2>/dev/null

echo ""
echo "Done!"