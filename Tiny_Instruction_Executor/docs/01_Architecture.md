# Tiny Instruction Executor

## Project Objective

Design a simple programmable processor capable of executing a small custom instruction set.

The processor will be designed from scratch using Verilog HDL and implemented through a complete RTL-to-GDSII flow.

---

## Design Goals

- Learn computer architecture fundamentals.
- Build reusable RTL modules.
- Perform functional verification.
- Complete synthesis, STA and physical design.

---

## Processor Specifications

| Parameter | Value |
|-----------|-------|
| Data Width | 8-bit |
| Address Width | 8-bit |
| Registers | 4 |
| Architecture | Single Cycle |
| Instruction Width | 16-bit (Tentative) |

---

## Module Hierarchy

Top
├── Program Counter
├── Instruction Memory
├── Instruction Decoder
├── Control Unit
├── Register File
└── ALU

---

## Execution Flow

Program Counter

↓

Instruction Memory

↓

Instruction Decoder

↓

Control Unit

↓

Register File

↓

ALU

↓

Write Back

↓

Next Instruction

---

## Development Progress

- [x] Architecture Planning
- [ ] Program Counter
- [ ] Instruction Memory
- [ ] Instruction Decoder
- [ ] Register File
- [ ] ALU
- [ ] Control Unit
- [ ] Top Module
- [ ] Simulation
- [ ] Synthesis
- [ ] STA
- [ ] Physical Design