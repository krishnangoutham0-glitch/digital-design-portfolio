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