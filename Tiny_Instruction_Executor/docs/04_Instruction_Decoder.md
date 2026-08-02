# Instruction Decoder

## Purpose

The Instruction Decoder extracts individual fields from the fetched instruction and forwards them to the remaining processor modules.

The decoder performs no arithmetic or logical operations. It simply separates the instruction into meaningful fields.

---

## Inputs

| Signal | Width | Description |
|---------|------:|-------------|
| instruction | 16 | Instruction fetched from Instruction Memory |

---

## Outputs

| Signal | Width | Description |
|---------|------:|-------------|
| opcode | 4 | Operation code |
| dest | 4 | Destination register |
| src1 | 4 | Source register 1 |
| src2 | 4 | Source register 2 |

---

## Instruction Format

---

## Operation

The decoder extracts the instruction fields using continuous assignments.

Example:

Instruction:0011_0010_0000_0001

Decoded fields:
Opcode = 0011
Dest = 0010
Src1 = 0000
Src2 = 0001
---

## Verification

Verified using:

- Icarus Verilog
- GTKWave

Tested Instructions:

- LOADI
- ADD
- HALT

---

## Status

- [x] Architecture Complete
- [x] RTL Complete
- [x] Testbench Complete
- [x] Functional Simulation
- [x] GTKWave Verification