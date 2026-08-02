# Register File

## Purpose

The Register File stores processor data and provides operands to the ALU.

It contains sixteen 8-bit registers.

Two registers can be read simultaneously, while one register can be written on each clock cycle.

---

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| DATA_WIDTH | Width of each register | 8 |
| REG_COUNT | Number of registers | 16 |

---

## Inputs

| Signal | Width | Description |
|---------|------:|-------------|
| clk | 1 | System clock |
| reset | 1 | Asynchronous reset |
| write_enable | 1 | Enables register write |
| read_addr1 | 4 | Read address for port 1 |
| read_addr2 | 4 | Read address for port 2 |
| write_addr | 4 | Register write address |
| write_data | 8 | Data to be written |

---

## Outputs

| Signal | Width | Description |
|---------|------:|-------------|
| read_data1 | 8 | Data from read port 1 |
| read_data2 | 8 | Data from read port 2 |

---

## Internal Storage

```verilog
reg [DATA_WIDTH-1:0] reg_file [0:REG_COUNT-1];
```

Default configuration:

- 16 registers
- 8-bit data width

---

## Operation

### Write

Writes occur on the rising edge of the clock when `write_enable` is asserted.

### Read

Both read ports are combinational.

The selected register contents are continuously available at the outputs.

---

## Verification

The following functionality was verified:

- Register reset
- Write operation
- Read Port 1
- Read Port 2
- Multiple register writes
- Simultaneous dual-port read

Simulation tools:

- Icarus Verilog
- GTKWave

---

## Status

- [x] Architecture Complete
- [x] RTL Complete
- [x] Testbench Complete
- [x] Functional Simulation
- [x] GTKWave Verification