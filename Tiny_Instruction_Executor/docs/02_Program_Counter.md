# Program Counter

## Purpose

Stores the address of the instruction currently being executed.

The Program Counter does not calculate the next address.
It only stores the value supplied by the control logic.

---

## Inputs

| Signal | Width | Description |
|---------|-------|-------------|
| clk | 1 | System Clock |
| reset | 1 | Asynchronous Reset |
| pc_write | 1 | Program Counter Write Enable |
| pc_next | ADDR_WIDTH | Next Program Address |

---

## Outputs

| Signal | Width | Description |
|---------|-------|-------------|
| pc | ADDR_WIDTH | Current Program Address |

---

## Internal Registers

- pc

---

## Internal Wires

None

---

## Operation

### Reset

PC ← 0

### Normal Operation

If pc_write = 1

PC ← pc_next

Else

PC retains its previous value.

---

## Verification Plan

- Verify Reset
- Verify Hold Condition
- Verify Address Update
- Verify Multiple Sequential Updates

---

## Status

- [x] Architecture Complete
- [x] RTL Complete
- [x] Testbench Complete
- [ ] Simulation
- [ ] GTKWave Verification