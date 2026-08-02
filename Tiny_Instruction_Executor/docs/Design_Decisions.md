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