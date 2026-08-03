#!/bin/bash

echo "=========================================="
echo " Tiny Instruction Executor - OpenSTA"
echo "=========================================="

mkdir -p reports/sta

/Users/gouthamkrishnan/OpenSTA/build/sta <<EOF | tee reports/sta/sta_report.rpt
source scripts/sta.tcl
EOF

echo
echo "=========================================="
echo " Static Timing Analysis Finished"
echo "=========================================="

echo "STA Report : reports/sta/sta_report.rpt"