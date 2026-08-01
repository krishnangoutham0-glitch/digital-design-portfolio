#!/bin/bash

echo "======================================"
echo "Running OpenROAD Flow"
echo "======================================"

cd ~/OpenROAD-flow-scripts/flow || exit

make DESIGN_CONFIG=./designs/nangate45/counter/config.mk

echo "OpenROAD Flow Complete."