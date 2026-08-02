#!/bin/bash

echo "======================================"
echo "Running Static Timing Analysis"
echo "======================================"

mkdir -p reports

sta <<EOF | tee reports/sta_report.rpt

read_liberty \
/Users/gouthamkrishnan/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_verilog synth/lfsr_4bit_synth.v

link_design lfsr_4bit

read_sdc constraints/constraints.sdc

report_checks

report_tns

report_wns

report_checks -path_delay min_max

exit

EOF

echo
echo "======================================"
echo "STA Complete"
echo "======================================"