# Tiny Instruction Executor

## Project Objective

Design a simple programmable processor capable of executing a custom instruction set.

The processor will be developed from scratch using **Verilog HDL** and will follow a complete **RTL-to-GDSII** digital ASIC design flow. The project focuses on understanding processor architecture, digital design, functional verification, synthesis, timing analysis, and physical implementation.

---

# Design Goals

- Learn processor architecture fundamentals.
- Design reusable RTL modules.
- Perform functional verification for every module.
- Integrate individual modules into a complete processor.
- Complete the RTL-to-GDSII implementation flow.
- Document every stage of development.

---

# Processor Specifications

| Parameter | Value |
|-----------|-------|
| Data Width | 8-bit |
| Address Width | 8-bit |
| Register Count | 4 |
| Architecture | Single Cycle |
| Instruction Width | 16-bit (Tentative) |

---

# Module Hierarchy

```
Top
├── Program Counter
├── Instruction Memory
├── Instruction Decoder
├── Register File
├── ALU
└── Control Unit
```

---

# Processor Execution Flow

```
Program Counter
        │
        ▼
Instruction Memory
        │
        ▼
Instruction Decoder
        │
        ▼
Control Unit
        │
        ▼
Register File
        │
        ▼
ALU
        │
        ▼
Write Back
        │
        ▼
Next Instruction
```

---

# Development Methodology

This project follows a hierarchical hardware development methodology similar to that used in digital IC design.

Each RTL module is developed and verified independently before system integration.

## Module Development Flow

```
Architecture
      │
      ▼
RTL Design
      │
      ▼
Testbench Development
      │
      ▼
Functional Simulation (Icarus Verilog)
      │
      ▼
Waveform Verification (GTKWave)
      │
      ▼
Documentation
      │
      ▼
Git Commit
```

The following modules are verified individually:

- Program Counter
- Instruction Memory
- Instruction Decoder
- Register File
- ALU
- Control Unit

Once every module has been functionally verified, they are integrated into the top-level processor.

---

# RTL-to-GDSII Flow

Only the integrated processor (`top.v`) proceeds through the complete implementation flow.

```
RTL (Top Module)
        │
        ▼
Yosys Synthesis
        │
        ▼
Gate-Level Netlist
        │
        ▼
Static Timing Analysis (OpenSTA)
        │
        ▼
Physical Design (OpenROAD)
        │
        ▼
Floorplanning
        │
        ▼
Placement
        │
        ▼
Clock Tree Synthesis
        │
        ▼
Routing
        │
        ▼
Design Rule Check (DRC)
        │
        ▼
GDSII Generation
```

This methodology reflects a structured ASIC design workflow where IP blocks are functionally verified before full-chip synthesis and implementation.

---

# Development Progress

## Module Development
| Module | Architecture | RTL | Testbench | Simulation | Status |
|---------|:------------:|:---:|:---------:|:----------:|:------:|
| Program Counter | ✅ | ✅ | ✅ | ✅ | Complete |
| Instruction Memory | ✅ | ✅ | ✅ | ✅ | Complete |
| Instruction Decoder | ✅ | ✅ | ✅ | ✅ | Complete |
| Register File | ⬜ | ⬜ | ⬜ | ⬜ | Pending |
| ALU | ⬜ | ⬜ | ⬜ | ⬜ | Pending |
| Control Unit | ⬜ | ⬜ | ⬜ | ⬜ | Pending |

---

## System Integration

| Task | Status |
|------|:------:|
| Top Module Design | ⬜ |
| Processor Functional Verification | ⬜ |

---

## RTL-to-GDSII Flow

| Stage | Status |
|--------|:------:|
| RTL Synthesis (Yosys) | ⬜ |
| Static Timing Analysis (OpenSTA) | ⬜ |
| Physical Design (OpenROAD) | ⬜ |
| GDSII Generation | ⬜ |

---

# Current Status

**Current Module:** Instruction Decoder ✅

The Instruction Decoder has been successfully:

- Architected
- Implemented in Verilog HDL
- Functionally verified using Icarus Verilog
- Validated using GTKWave
- Documented

The next stage of development is the **Register File** module.