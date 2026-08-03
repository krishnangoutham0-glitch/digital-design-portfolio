#!/bin/bash

echo "=========================================="
echo " Tiny Instruction Executor - OpenROAD Flow"
echo "=========================================="

PROJECT=$(pwd)
ORFS=~/OpenROAD-flow-scripts/flow
DESIGN=tiny_instruction_executor
DEST="$PROJECT/Physical_Design"

echo
echo "Updating OpenROAD Design Files..."

DESIGN_DIR="$ORFS/designs/nangate45/$DESIGN"

mkdir -p "$DESIGN_DIR"

cp "$PROJECT/rtl/"*.v "$DESIGN_DIR/"
cp "$PROJECT/constraints/constraints.sdc" \
"$DESIGN_DIR/constraints.sdc"
echo
echo "Running OpenROAD..."

make -C "$ORFS" \
OPENROAD_EXE=$HOME/OpenROAD/build/bin/openroad \
YOSYS_EXE=/opt/homebrew/bin/yosys \
KLAYOUT_CMD=/Applications/KLayout/klayout.app/Contents/MacOS/klayout \
DESIGN_CONFIG=./designs/nangate45/tiny_instruction_executor/config.mk

if [ $? -ne 0 ]; then
    echo
    echo "❌ OpenROAD Flow Failed."
    exit 1
fi

echo
echo "Copying Outputs..."

RESULTS="$ORFS/results/nangate45/$DESIGN/base"
REPORTS="$ORFS/reports/nangate45/$DESIGN/base"
LOGS="$ORFS/logs/nangate45/$DESIGN/base"

mkdir -p "$DEST/results"
mkdir -p "$DEST/reports"
mkdir -p "$DEST/logs"
mkdir -p "$DEST/gds"

cp -r "$RESULTS/"* "$DEST/results/" 2>/dev/null
cp -r "$REPORTS/"* "$DEST/reports/" 2>/dev/null
cp -r "$LOGS/"* "$DEST/logs/" 2>/dev/null

if [ -f "$RESULTS/6_final.gds" ]; then
    cp "$RESULTS/6_final.gds" "$DEST/gds/top.gds"
fi

echo
echo "=========================================="
echo " OpenROAD Flow Completed Successfully"
echo "=========================================="