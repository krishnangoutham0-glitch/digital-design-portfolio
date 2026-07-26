#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

PROJECT=$1
BASE="projects/$PROJECT"

if [ -d "$BASE" ]; then
    echo "Project '$PROJECT' already exists!"
    exit 1
fi

mkdir -p "$BASE"/{rtl,tb,yosys,synth,coverage,waveforms,images,logs}

cat > "$BASE/rtl/${PROJECT}.v" << EOF
module ${PROJECT} (

);



endmodule
EOF

cat > "$BASE/tb/${PROJECT}_tb.v" << EOF
\`timescale 1ns/1ps

module ${PROJECT}_tb;

    // Inputs

    // Outputs

    // DUT

    initial begin

        \$finish;

    end

endmodule
EOF

cat > "$BASE/yosys/synth.ys" << EOF
read_verilog ../rtl/${PROJECT}.v

hierarchy -check -top ${PROJECT}

proc
opt

check
stat

write_verilog ../synth/${PROJECT}_synth.v
EOF

cat > "$BASE/README.md" << EOF
# ${PROJECT}

## Objective

Describe the design objective.

## Directory Structure

- rtl/
- tb/
- yosys/
- synth/
- coverage/
- waveforms/
- images/
- logs/

## Results

To be updated.
EOF

echo "======================================"
echo "Project '${PROJECT}' created!"
echo "======================================"#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

PROJECT=$1
BASE="projects/$PROJECT"

mkdir -p "$BASE"/{rtl,tb,yosys,synth,coverage,waveforms,images}

touch "$BASE/README.md"
touch "$BASE/rtl/${PROJECT}.v"
touch "$BASE/tb/${PROJECT}_tb.v"
touch "$BASE/yosys/synth.ys"

echo "Project '$PROJECT' created successfully!"
