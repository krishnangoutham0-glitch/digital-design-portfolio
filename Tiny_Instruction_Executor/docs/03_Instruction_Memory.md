# Instruction Memory

## Purpose

Stores the program instructions that are executed by the processor.

The Instruction Memory behaves as a Read-Only Memory (ROM). During processor execution, instructions are only read and are never modified.

---

## Inputs

| Signal | Width | Description |
|---------|-------|-------------|
| address | ADDR_WIDTH | Address supplied by the Program Counter |

---

## Outputs

| Signal | Width | Description |
|---------|-------|-------------|
| instruction | INSTR_WIDTH | Instruction stored at the specified address |

---

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| ADDR_WIDTH | Address bus width | 8 |
| INSTR_WIDTH | Instruction width | 16 |

---

## Internal Memory

```verilog
reg [INSTR_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];
```

Default configuration:

- Address Width : 8 bits
- Memory Depth : 256 instructions
- Instruction Width : 16 bits

---

## Operation

1. The Program Counter provides an address.
2. The Instruction Memory reads the corresponding memory location.
3. The instruction is immediately available at the output.

This module performs a combinational read using a continuous assignment.

---

## Verification

The following test cases were verified:

- Read instruction at Address 0
- Read instruction at Address 1
- Read instruction at Address 2
- Read instruction at Address 3

Simulation completed successfully using:

- Icarus Verilog
- GTKWave

---

## Status

- [x] Architecture Complete
- [x] RTL Complete
- [x] Testbench Complete
- [x] Functional Simulation
- [x] GTKWave Verification