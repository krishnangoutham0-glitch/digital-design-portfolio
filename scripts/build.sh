#!/bin/bash

# ----------------------------------------
# Build Script for Digital Design Portfolio
# ----------------------------------------

if [ $# -ne 1 ]; then
    echo "Usage: ./scripts/build.sh <project_name>"
    exit 1
fi

PROJECT=$1
BASE="projects/$PROJECT"

RTL="$BASE/rtl/${PROJECT}.v"
TB="$BASE/tb/${PROJECT}_tb.v"

LOGDIR="$BASE/logs"
SIMDIR="$BASE/waveforms"

mkdir -p "$LOGDIR"
mkdir -p "$SIMDIR"

echo "======================================"
echo "Building Project : $PROJECT"
echo "======================================"

# Check project

if [ ! -d "$BASE" ]; then
    echo "❌ Project does not exist."
    exit 1
fi

if [ ! -f "$RTL" ]; then
    echo "❌ RTL file missing."
    exit 1
fi

if [ ! -f "$TB" ]; then
    echo "❌ Testbench missing."
    exit 1
fi

echo "✅ Project structure OK"

# Compile

echo ""
echo "[1/2] Compiling..."

iverilog \
-o "$SIMDIR/${PROJECT}.out" \
"$RTL" \
"$TB" \
> "$LOGDIR/compile.log" 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Compilation Failed"
    echo "See: $LOGDIR/compile.log"
    exit 1
fi

echo "✅ Compilation Successful"

# Run simulation

echo ""
echo "[2/2] Running Simulation..."

vvp "$SIMDIR/${PROJECT}.out" \
> "$LOGDIR/simulation.log" 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Simulation Failed"
    echo "See: $LOGDIR/simulation.log"
    exit 1
fi

echo "✅ Simulation Successful"

echo ""
echo "======================================"
echo "BUILD SUCCESSFUL"
echo "======================================"
