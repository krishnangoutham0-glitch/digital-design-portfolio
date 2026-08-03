#!/bin/bash

echo "=========================================="
echo " Tiny Instruction Executor Reorganization"
echo "=========================================="

#=========================================================
# Rename script.tcl
#=========================================================
if [ -f scripts/script.tcl ]; then
    mv scripts/script.tcl scripts/yosys_synth.tcl
    echo "Renamed script.tcl -> yosys_synth.tcl"
fi

#=========================================================
# Rename STA Script
#=========================================================
if [ -f scripts/sta_script.tcl ]; then
    mv scripts/sta_script.tcl scripts/sta.tcl
    echo "Renamed sta_script.tcl -> sta.tcl"
fi

#=========================================================
# Rename netlist -> synth
#=========================================================
if [ -d netlist ]; then
    mv netlist synth_temp
    rm -rf synth
    mv synth_temp synth
    echo "Renamed netlist -> synth"
fi

#=========================================================
# Flatten reports
#=========================================================

mkdir -p reports

mv reports/simulation/*.rpt reports/ 2>/dev/null
mv reports/synthesis/*.rpt reports/ 2>/dev/null
mv reports/sta/*.rpt reports/ 2>/dev/null

rmdir reports/simulation 2>/dev/null
rmdir reports/synthesis 2>/dev/null
rmdir reports/sta 2>/dev/null
rmdir reports/physical_design 2>/dev/null

echo "Reports reorganized."

#=========================================================
# Flatten Images
#=========================================================

mv images/gate/* images/ 2>/dev/null
mv images/rtl/* images/ 2>/dev/null

rmdir images/gate 2>/dev/null
rmdir images/rtl 2>/dev/null
rmdir images/physical_design 2>/dev/null

echo "Images reorganized."

#=========================================================
# Remove Empty Directories
#=========================================================

find . -type d -empty -delete

echo "Removed empty directories."

#=========================================================
# Done
#=========================================================

echo
echo "=========================================="
echo " Project Reorganized Successfully"
echo "=========================================="

echo
tree