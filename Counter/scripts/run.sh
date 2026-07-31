#!/bin/bash

ORFS=~/OpenROAD-flow-scripts/flow

make -C "$ORFS" \
OPENROAD_EXE=$HOME/OpenROAD/build/bin/openroad \
YOSYS_EXE=/opt/homebrew/bin/yosys \
KLAYOUT_CMD=/Applications/KLayout/klayout.app/Contents/MacOS/klayout \
DESIGN_CONFIG=$PWD/config.mk