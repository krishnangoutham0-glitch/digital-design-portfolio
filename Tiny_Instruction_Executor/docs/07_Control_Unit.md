# Control Unit

## Purpose

The Control Unit is the brain of the Tiny Instruction Executor. It receives the decoded instruction opcode and generates the required control signals for all datapath modules.

The Control Unit does not perform arithmetic or store data. It only determines how the processor executes each instruction.

---

## Position in Processor

```
                  +------------------+
                  | Program Counter  |
                  +------------------+
                           |
                           v
                 +----------------------+
                 | Instruction Memory   |
                 +----------------------+
                           |
                           v
                 +----------------------+
                 | Instruction Decoder  |
                 +----------------------+
                           |
                    Opcode, Dest,
                    Src1, Src2
                           |
                           v
                  +----------------+
                  | Control Unit   |
                  +----------------+
                   |   |    |    |
                   |   |    |    |
                   |   |    |    +-------> Program Counter
                   |   |    |
                   |   |    +------------> ALU
                   |   |
                   |   +-----------------> Register File
                   |
                   +---------------------> Halt Signal
```

---

## Parameters

No configurable parameters.

---

## Inputs

| Signal | Width | Description |
|---------|------:|-------------|
| opcode | 4 | Opcode from Instruction Decoder |
| pc | 8 | Current Program Counter value |

---

## Outputs

| Signal | Width | Description |
|---------|------:|-------------|
| reg_write | 1 | Enables Register File write operation |
| pc_write | 1 | Enables Program Counter update |
| halt | 1 | Stops processor execution |
| alu_op | 4 | ALU operation select |
| pc_next | 8 | Next Program Counter value |

---

## Supported Instructions

| Instruction | Opcode | ALU Operation | Register Write | PC Write | Halt |
|-------------|:------:|:-------------:|:--------------:|:--------:|:----:|
| ADD | 0000 | ADD | ✓ | ✓ | ✗ |
| SUB | 0001 | SUB | ✓ | ✓ | ✗ |
| AND | 0010 | AND | ✓ | ✓ | ✗ |
| OR | 0011 | OR | ✓ | ✓ | ✗ |
| XOR | 0100 | XOR | ✓ | ✓ | ✗ |
| NOT | 0101 | NOT | ✓ | ✓ | ✗ |
| SHL | 0110 | SHL | ✓ | ✓ | ✗ |
| SHR | 0111 | SHR | ✓ | ✓ | ✗ |
| LOADI | 1000 | PASS B | ✓ | ✓ | ✗ |
| HALT | 1001 | N/A | ✗ | ✗ | ✓ |

---

## Control Signal Description

### reg_write

Controls whether the Register File stores the ALU result.

```
1 → Write ALU result into destination register

0 → Do not modify registers
```

---

### pc_write

Controls Program Counter update.

```
1 → Load pc_next

0 → Hold current PC
```

---

### halt

Stops processor execution.

```
0 → Continue execution

1 → Halt processor
```

---

### alu_op

Selects the ALU operation.

| ALU Opcode | Operation |
|:----------:|-----------|
|0000|ADD|
|0001|SUB|
|0010|AND|
|0011|OR|
|0100|XOR|
|0101|NOT|
|0110|SHL|
|0111|SHR|
|1000|PASS A|
|1001|PASS B|

---

### pc_next

Specifies the next address that will be loaded into the Program Counter.

For Version 1 of the processor,

```
pc_next = pc + 1
```

For HALT,

```
pc_next = pc
```

since the Program Counter is disabled.

---

## Operation

The Control Unit is a purely combinational block.

It continuously monitors the instruction opcode and current Program Counter value.

Based on the opcode, it generates:

- Register File control signals
- Program Counter control signals
- ALU operation selection
- Halt signal

---

## Execution Example

Instruction:

```
ADD R2, R0, R1
```

Current Program Counter:

```
PC = 3
```

Control Unit Output:

| Signal | Value |
|---------|------:|
| reg_write | 1 |
| pc_write | 1 |
| halt | 0 |
| alu_op | ADD |
| pc_next | 4 |

The Register File writes the ALU result into R2, and the Program Counter advances to the next instruction.

---

## Hardware Implementation

- Combinational Logic
- `always @(*)`
- Case Statement based Instruction Decoder
- Local Parameters for Instruction and ALU Opcodes

---

## Verification

Verified using:

- Icarus Verilog
- GTKWave

The following instructions were functionally verified:

- ADD
- SUB
- AND
- OR
- XOR
- NOT
- SHL
- SHR
- LOADI
- HALT
- Invalid Opcode

---

## Files

### RTL

```
rtl/control_unit.v
```

### Testbench

```
tb/control_unit_tb.v
```

### Simulation Report

```
reports/simulation/control_unit_simulation.rpt
```

### Waveform

```
waveforms/control_unit.vcd
```

---

## Status

- [x] Architecture Complete
- [x] RTL Complete
- [x] Testbench Complete
- [x] Functional Simulation
- [x] GTKWave Verification