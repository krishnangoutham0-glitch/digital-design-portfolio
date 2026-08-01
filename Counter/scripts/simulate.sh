#!/bin/bash

echo "======================================"
echo "Running Icarus Verilog Simulation"
echo "======================================"

iverilog -o sim rtl/counter.v tb/counter_tb.v

if [ $? -eq 0 ]; then
    echo "Compilation Successful!"
    vvp sim
    echo "Simulation Complete."
else
    echo "Compilation Failed."
fi