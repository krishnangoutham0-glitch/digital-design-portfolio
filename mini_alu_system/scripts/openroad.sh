#!/bin/bash

echo "======================================"
echo "Running OpenROAD Flow"
echo "======================================"

cd ~/OpenROAD-flow-scripts/flow || exit

make DESIGN_CONFIG=./designs/nangate45/mini_alu_system/config.mk

echo "======================================"
echo "Copying Outputs"
echo "======================================"

RESULTS=~/OpenROAD-flow-scripts/flow/results/nangate45/mini_alu_system/base
REPORTS=~/OpenROAD-flow-scripts/flow/reports/nangate45/mini_alu_system/base
DEST=~/digital-design-portfolio-clean/mini_alu_system/Physical_Design

cp "$RESULTS/6_final.def"  "$DEST/results/top.def"
cp "$RESULTS/6_final.sdc"  "$DEST/results/top.sdc"
cp "$RESULTS/6_final.spef" "$DEST/results/top.spef"
cp "$RESULTS/6_final.v"    "$DEST/results/top.v"
cp "$RESULTS/6_final.gds"  "$DEST/gds/top.gds"

cp "$REPORTS/2_floorplan_final.rpt" "$DEST/reports/floorplan_report.rpt"
cp "$REPORTS/4_cts_final.rpt" "$DEST/reports/cts_report.rpt"
cp "$REPORTS/5_route_drc.rpt" "$DEST/reports/routing_drc.rpt"
cp "$REPORTS/6_finish.rpt" "$DEST/reports/final_report.rpt"

echo "======================================"
echo "Done!"
echo "======================================"