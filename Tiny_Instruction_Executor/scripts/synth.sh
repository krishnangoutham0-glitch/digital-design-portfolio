#!/bin/bash

echo "=========================================="
echo " Tiny Instruction Executor - Yosys Synthesis"
echo "=========================================="

mkdir -p netlist
mkdir -p reports/synthesis

yosys -s scripts/yosys_synth.tcl | tee reports/synthesis/yosys_synthesis.rpt

echo ""
echo "=========================================="
echo " Synthesis Finished"
echo "=========================================="

echo "Synthesized Netlist : netlist/top_synth.v"
echo "Synthesis Report    : reports/synthesis/yosys_synthesis.rpt"