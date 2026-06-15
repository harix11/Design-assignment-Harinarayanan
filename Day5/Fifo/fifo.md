
# FIFO (First-In First-Out) Buffer using Verilog

## Overview

This project implements an 8-bit FIFO (First-In First-Out) buffer using Verilog HDL. A FIFO is a memory structure where data is read in the same order in which it was written.

The design supports independent read and write operations and provides status flags to indicate whether the FIFO is full or empty.

---

## Features

- 8-bit data width
- Separate read and write enable signals
- FIFO Full indication
- FIFO Empty indication
- Sequential data storage and retrieval
- Verilog testbench for verification

---

## Inputs

| Signal | Description |
|----------|-------------|
| clock | System clock |
| reset | Reset signal |
| write_en | Write enable |
| read_en | Read enable |
| d_in[7:0] | Data input |

---

## Outputs

| Signal | Description |
|----------|-------------|
| d_out[7:0] | Data output |
| fifo_full | FIFO full flag |
| fifo_empty | FIFO empty flag |

---

## Working Principle

### Write Operation

When `write_en` is asserted and the FIFO is not full:

- Input data (`d_in`) is written into the FIFO.
- The write pointer advances to the next location.

### Read Operation

When `read_en` is asserted and the FIFO is not empty:

- Data is read from the FIFO in the same order it was written.
- The read pointer advances to the next location.

### FIFO Property

```text
First Data Written  → First Data Read
Second Data Written → Second Data Read
Third Data Written  → Third Data Read
```

This guarantees ordered data transfer.

---

## Simulation Sequence

### Data Written

| Order | Data |
|---------|------|
| 1 | AA |
| 2 | BB |
| 3 | CC |
| 4 | 01 |
| 5 | 02 |
| 6 | 03 |
| 7 | 04 |
| 8 | 05 |
| 9 | 06 |
| 10 | 07 |

### Data Read

| Order | Data |
|---------|------|
| 1 | AA |
| 2 | BB |
| 3 | CC |
| 4 | 01 |
| 5 | 02 |
| 6 | 03 |
| 7 | 04 |
| 8 | 05 |
| 9 | 06 |

The output sequence matches the input sequence, confirming correct FIFO operation.

---

## Status Flags

### FIFO Empty

- Asserted when no data is available for reading.
- Prevents invalid read operations.

### FIFO Full

- Asserted when all FIFO locations are occupied.
- Prevents additional write operations.

---

## Simulation Waveform
<img width="1557" height="772" alt="fifo_interface" src="https://github.com/user-attachments/assets/927ea45e-169b-4648-ac94-f5a618e5322b" />

The waveform verifies:

- Successful write operations
- Correct read operations
- FIFO order preservation
- Proper FIFO Full indication
- Proper FIFO Empty indication

Observed transfer:

```text
Input  : AA → BB → CC → 01 → 02 → 03 → 04 → 05 → 06 → 07

Output : AA → BB → CC → 01 → 02 → 03 → 04 → 05 → 06
```

This confirms that data exits the FIFO in exactly the same order in which it entered.

---

## Applications

- Producer-Consumer Systems
- Data Synchronization
- Communication Interfaces
- UART Buffers
- Network Packet Buffering
- FPGA and ASIC Designs
- Clock Domain Crossing

---

## Result

The FIFO buffer was successfully implemented and verified using Verilog HDL. Simulation results confirm correct data storage, retrieval, Full/Empty flag generation, and preservation of data order according to the FIFO principle.
