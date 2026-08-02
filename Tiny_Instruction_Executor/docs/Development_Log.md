## Day 1

### Project Initialization

- Created project directory structure.
- Defined documentation framework.
- Added simulation, synthesis, and physical design folders.
- Created reusable scripts and Makefile.

### Program Counter

- Defined architecture.
- Implemented RTL.
- Developed testbench.
- Completed functional simulation using Icarus Verilog.
- Verified functionality using GTKWave.
- Decided that module development will stop at functional verification.

### Project Workflow Decision

- Each RTL module will be verified independently using Icarus Verilog and GTKWave.
- RTL-to-GDSII implementation (Yosys, OpenSTA, OpenROAD) will be performed only after integrating the complete processor.
## Day 2

### Instruction Memory

- Designed Instruction Memory architecture.
- Implemented parameterized memory array.
- Initialized ROM with example instructions.
- Developed Instruction Memory testbench.
- Verified instruction fetch functionality using Icarus Verilog.
- Validated waveform using GTKWave.
- Updated project documentation.

### Lessons Learned

- Understood Verilog memory declaration syntax.
- Learned the difference between memory width and memory depth.
- Learned why Instruction Memory is implemented as ROM.
- Learned how a combinational memory read is modeled using a continuous assignment.

## Day 3

### Instruction Decoder

- Designed Instruction Decoder architecture.
- Implemented combinational instruction decoding.
- Extracted opcode, destination, source1 and source2 fields.
- Developed Instruction Decoder testbench.
- Verified instruction decoding using Icarus Verilog.
- Validated decoding using GTKWave.
- Updated project documentation.

### Lessons Learned

- Learned Verilog bit slicing.
- Understood continuous assignments (`assign`).
- Learned the difference between `wire` and `reg`.
- Understood that the decoder interprets instruction fields but does not execute them.