# Design Decisions

## Decision 1

### Why use a Program Counter?

Instead of storing the current instruction address inside the Control Unit, a dedicated Program Counter module is used.

Reasons:

- Better modularity
- Easier scalability
- Cleaner architecture
- Matches commercial processor design

---

## Decision 2

### Why separate Program Counter and Next PC Logic?

The Program Counter is responsible only for storing the current address.

The Control Unit (or Next PC Logic) determines the next address.

This allows future support for:

- JMP
- JZ
- CALL
- RET
- Interrupts
- Exceptions

without modifying the Program Counter.

---

## Decision 3

### Why use named port mapping?

Named port mapping improves readability and prevents errors when module ports are reordered.

Example:

program_counter DUT (
    .clk(clk),
    .reset(reset),
    .pc_next(pc_next),
    .pc_write(pc_write),
    .pc(pc)
);

instead of positional mapping.
## Decision 4

### Module Verification Strategy

Each RTL module will undergo functional verification using:

- Icarus Verilog
- GTKWave

The complete RTL-to-GDSII flow will **not** be executed for individual modules.

Instead, synthesis, static timing analysis, and physical design will be performed only on the integrated top-level processor.

#### Reasons

- Reflects common ASIC development practice.
- Avoids generating implementation results for incomplete designs.
- Keeps the repository organized and focused.
- Makes timing, area, and power reports meaningful by evaluating the complete processor rather than isolated modules.
## Decision 5

### Why implement the Instruction Memory as ROM?

The processor executes a fixed program during simulation.

Since instructions are only fetched and never modified, a Read-Only Memory (ROM) is sufficient.

Future versions of the processor may replace the hardcoded instruction initialization with an external memory file using `$readmemb` or `$readmemh`.

---

## Decision 6

### Why use a parameterized memory declaration?

The Instruction Memory is declared as:

```verilog
reg [INSTR_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];
```

This allows the same RTL to support different instruction widths and memory sizes by modifying only the parameters.

This improves scalability and code reusability.

## Decision 7

### Why is the Instruction Decoder purely combinational?

The Instruction Decoder only extracts fields from the instruction.

No state is stored and no sequential behavior is required.

Therefore, the decoder is implemented using continuous assignments instead of clocked logic.

---

## Decision 8

### Why are decoder outputs 4 bits wide?

The current processor instruction format divides the 16-bit instruction into four equal fields:

- Opcode
- Destination Register
- Source Register 1
- Source Register 2

Each field occupies four bits, simplifying the decoder implementation.

This instruction format may evolve in future versions to support immediate operands and additional instruction types.
## Decision 9

### Why use sixteen registers?

The instruction format allocates four bits for register addressing.

Four address bits naturally support sixteen registers (R0–R15).

Using sixteen registers avoids wasting instruction bits and keeps the ISA consistent.

---

## Decision 10

### Why use combinational read and synchronous write?

The Register File continuously supplies operands to the ALU without waiting for a clock edge.

Register updates occur only on the rising edge of the clock to ensure deterministic state changes.