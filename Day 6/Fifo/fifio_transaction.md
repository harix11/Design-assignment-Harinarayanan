
# FIFO (First-In First-Out) Memory using Verilog

## Overview

This project implements a synchronous FIFO (First-In First-Out) memory using Verilog HDL. The FIFO temporarily stores data and ensures that data is read in the same order in which it was written.

The design includes write and read control signals along with status flags to indicate FIFO Full and FIFO Empty conditions.

---

## Features

- 8-bit data width
- Synchronous read and write operations
- FIFO Full flag
- FIFO Empty flag
- Ordered data transfer
- Verilog testbench for verification

---

## Inputs

| Signal | Description |
|----------|-------------|
| clk | System clock |
| rst | Reset signal |
| w_en | Write enable |
| r_en | Read enable |
| data_in[7:0] | Input data |

---

## Outputs

| Signal | Description |
|----------|-------------|
| data_out[7:0] | Output data |
| full | FIFO full indicator |
| empty | FIFO empty indicator |

---

## Working Principle

### Write Operation

When `w_en = 1` and FIFO is not full:

- Data is written into the FIFO.
- The write pointer advances to the next memory location.

### Read Operation

When `r_en = 1` and FIFO is not empty:

- Data is read from the FIFO.
- The read pointer advances to the next memory location.

### FIFO Property

```text
First Written Data  → First Read Data
Second Written Data → Second Read Data
Third Written Data  → Third Read Data
```

This guarantees data integrity and ordering.

---

## Simulation Sequence

### Data Written

```text
55
AA
FF
55
AA
FF
55
FF
```

### Data Read

```text
00
FF
```

The waveform demonstrates successful write and read operations while maintaining FIFO behavior.

---

## Status Flags

### Empty Flag

- Asserted when no valid data is available.
- Prevents invalid read operations.

### Full Flag

- Asserted when the FIFO reaches maximum capacity.
- Prevents additional write operations.

---

## Simulation Waveform
<img width="1560" height="856" alt="image" src="https://github.com/user-attachments/assets/bc842292-fe6c-4d23-a212-26b747b9dad7" />

The waveform verifies:

- Clock-driven FIFO operation
- Successful data writes
- Successful data reads
- FIFO Empty indication
- FIFO Full indication
- Proper synchronization between write and read operations

Observed signals:

```text
Input Data  : 55 → AA → FF → 55 → AA → FF → 55 → FF
Output Data : 00 → FF
```

---

## Applications

- Producer-Consumer Systems
- Data Buffers
- UART Communication
- Network Packet Queues
- FPGA Data Transfer
- Clock Domain Synchronization

---

## Result

The FIFO memory was successfully implemented and verified using Verilog HDL. Simulation results confirm correct storage, retrieval, and management of data using FIFO principles along with proper Full and Empty flag generation.
