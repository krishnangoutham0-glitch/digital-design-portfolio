#!/bin/bash

echo "======================================"
echo "Compiling 4-bit LFSR"
echo "======================================"

mkdir -p sim

iverilog \
-o sim/lfsr_4bit.vvp \
rtl/lfsr_4bit.v \
tb/lfsr_4bit_tb.v

echo
echo "======================================"
echo "Running Simulation"
echo "======================================"

vvp sim/lfsr_4bit.vvp

echo
echo "======================================"
echo "Opening GTKWave"
echo "======================================"

gtkwave sim/lfsr_4bit.vcd