#!/bin/bash

set -e

############################################################
# Usage
############################################################

if [ $# -ne 1 ]; then
    echo "Usage: ./run.sh <design>"
    echo
    echo "Example:"
    echo "    ./run.sh fsm"
    echo "    ./run.sh counter"
    exit 1
fi

############################################################
# Variables
############################################################

DESIGN=$1
TB="${DESIGN}_tb"

RTL="${DESIGN}.v"
TBFILE="${TB}.v"

BUILD="build"

NETLIST="${DESIGN}_netlist.v"
SYNTH="${DESIGN}_synth.v"

RTL_DOT="${DESIGN}_rtl.dot"
GATE_DOT="${DESIGN}_gate.dot"

############################################################
# Checks
############################################################

[[ -f "$RTL" ]] || { echo "ERROR: $RTL not found."; exit 1; }
[[ -f "$TBFILE" ]] || { echo "ERROR: $TBFILE not found."; exit 1; }
[[ -f script.tcl ]] || { echo "ERROR: script.tcl not found."; exit 1; }

############################################################
# Clean
############################################################

echo "============================================="
echo "      ASIC FRONT-END AUTOMATION FLOW"
echo "============================================="

rm -rf "$BUILD"
mkdir -p "$BUILD"

############################################################
# RTL Simulation
############################################################

echo
echo "[1/6] RTL Simulation"

verilator --binary \
    --Mdir "$BUILD/obj_dir" \
    --trace \
    --coverage \
    -Wno-fatal \
    -Wno-TIMESCALEMOD \
    -Wno-WIDTHTRUNC \
    -Wno-CASEOVERLAP \
    --top-module "$TB" \
    "$RTL" "$TBFILE"

./"$BUILD"/obj_dir/V"$TB" | tee "$BUILD/rtl_output.log"

[[ -f waveform.vcd ]] && mv waveform.vcd "$BUILD/rtl_waveform.vcd"

if [[ -f coverage.dat ]]; then
    mv coverage.dat "$BUILD/coverage_rtl.dat"

    verilator_coverage \
        --annotate "$BUILD/coverage_rtl" \
        "$BUILD/coverage_rtl.dat"
fi

############################################################
# Synthesis
############################################################

echo
echo "[2/6] Yosys Synthesis"

yosys -s script.tcl

[[ -f "$NETLIST" ]] && mv "$NETLIST" "$BUILD/"
[[ -f "$SYNTH" ]] && mv "$SYNTH" "$BUILD/"
[[ -f "$RTL_DOT" ]] && mv "$RTL_DOT" "$BUILD/"
[[ -f "$GATE_DOT" ]] && mv "$GATE_DOT" "$BUILD/"

############################################################
# Schematics
############################################################

echo
echo "[3/6] Generating Schematics"

if [[ -f "$BUILD/$RTL_DOT" ]]; then
    dot -Tpng \
        "$BUILD/$RTL_DOT" \
        -o "$BUILD/${DESIGN}_rtl.png"
fi

if [[ -f "$BUILD/$GATE_DOT" ]]; then
    dot -Tpng \
        "$BUILD/$GATE_DOT" \
        -o "$BUILD/${DESIGN}_gate.png"
fi

############################################################
# Gate-Level Simulation
############################################################

echo
echo "[4/6] Gate-Level Simulation"

rm -rf "$BUILD/obj_dir"

verilator --binary \
    --Mdir "$BUILD/obj_dir" \
    --trace \
    --coverage \
    -Wno-fatal \
    -Wno-TIMESCALEMOD \
    -Wno-WIDTHTRUNC \
    -Wno-CASEOVERLAP \
    --top-module "$TB" \
    "$BUILD/$SYNTH" "$TBFILE"

./"$BUILD"/obj_dir/V"$TB" | tee "$BUILD/gate_output.log"

[[ -f waveform.vcd ]] && mv waveform.vcd "$BUILD/gate_waveform.vcd"

if [[ -f coverage.dat ]]; then

    mv coverage.dat "$BUILD/coverage_gate.dat"

    verilator_coverage \
        --annotate "$BUILD/coverage_gate" \
        "$BUILD/coverage_gate.dat"
fi

############################################################
# Compare Outputs
############################################################

echo
echo "[5/6] RTL vs Gate Comparison"

if diff -q \
    "$BUILD/rtl_output.log" \
    "$BUILD/gate_output.log" > /dev/null
then
    echo
    echo "PASS : RTL and Gate-Level simulations MATCH."
else
    echo
    echo "FAIL : RTL and Gate-Level simulations DIFFER."
    echo
    diff \
        "$BUILD/rtl_output.log" \
        "$BUILD/gate_output.log"
fi

############################################################
# Summary
############################################################

echo
echo "[6/6] Build Summary"

echo
echo "Generated Files:"
echo "---------------------------------------------"

find "$BUILD" -maxdepth 2 -type f | sort

echo
echo "============================================="
echo "           BUILD COMPLETED"
echo "============================================="