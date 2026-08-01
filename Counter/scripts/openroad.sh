#!/bin/bash

echo "======================================"
echo "Running OpenROAD Flow"
echo "======================================"

cd ~/OpenROAD-flow-scripts/flow || exit

make DESIGN_CONFIG=./designs/nangate45/counter/config.mk

echo "Copying physical design outputs..."

RESULTS=~/OpenROAD-flow-scripts/flow/results/nangate45/counter/base
REPORTS=~/OpenROAD-flow-scripts/flow/reports/nangate45/counter/base
DEST=~/digital-design-portfolio-clean/Counter/Physical_Design

# Final outputs
cp "$RESULTS/6_final.def"  "$DEST/results/counter.def"
cp "$RESULTS/6_final.sdc"  "$DEST/results/counter.sdc"
cp "$RESULTS/6_final.spef" "$DEST/results/counter.spef"
cp "$RESULTS/6_final.v"    "$DEST/results/counter.v"
cp "$RESULTS/6_final.gds"  "$DEST/gds/counter.gds"

# Reports
cp "$REPORTS/2_floorplan_final.rpt" "$DEST/reports/floorplan_report.rpt"
cp "$REPORTS/4_cts_final.rpt"       "$DEST/reports/cts_report.rpt"
cp "$REPORTS/5_route_drc.rpt"       "$DEST/reports/routing_drc.rpt"
cp "$REPORTS/6_finish.rpt"          "$DEST/reports/final_report.rpt"

echo "Portfolio updated successfully."

echo "======================================"
echo "Copying final outputs..."
echo "======================================"

RESULTS=~/OpenROAD-flow-scripts/flow/results/nangate45/counter/base
DEST=~/digital-design-portfolio-clean/Counter/Physical_Design

cp "$RESULTS/6_final.def"  "$DEST/results/counter.def"
cp "$RESULTS/6_final.sdc"  "$DEST/results/counter.sdc"
cp "$RESULTS/6_final.spef" "$DEST/results/counter.spef"
cp "$RESULTS/6_final.v"    "$DEST/results/counter.v"
cp "$RESULTS/6_final.gds"  "$DEST/gds/counter.gds"

echo "======================================"
echo "Done!"
echo "======================================"