#!/bin/bash

echo "======================================"
echo "Running Yosys Synthesis"
echo "======================================"

mkdir -p synth
mkdir -p images
mkdir -p reports

yosys -s scripts/yosys_synth.tcl | tee reports/synthesis_report.rpt

echo
echo "======================================"
echo "Synthesis Complete"
echo "======================================"