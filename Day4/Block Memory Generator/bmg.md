# Block Memory Generator (BMG) using Verilog

## Overview

This project implements a Block Memory Generator (BMG) using Verilog HDL. The memory supports storing and retrieving 8-bit data values through separate read and write addresses.

The design demonstrates basic RAM operations including data writing, data reading, and address-based memory access.

---

## Features

- 8-bit data width
- 3-bit address width
- Synchronous write operation
- Address-based read operation
- Reset functionality
- Verilog testbench for simulation

---

## Inputs

| Signal | Description |
|---------|------------|
| clk | System clock |
| rst | Reset signal |
| wr_en_sim | Write enable |
| addr_wr_tb[2:0] | Write address |
| addr_rd_tb[2:0] | Read address |
| din_sim[7:0] | Data input |

---

## Outputs

| Signal | Description |
|---------|------------|
| dout_sim[7:0] | Data output |

---

## Working Principle

### Write Operation

When `wr_en = 1`:

- Data present at `din_sim` is written into the memory location specified by `addr_wr_tb`.


### Read Operation

When a read address is applied through `addr_rd_tb`, the data stored at that memory location appears on `dout_sim`.

---

## Simulation Sequence

### Data Written

| Address | Data |
|----------|------|
| 0 | 00 |
| 7 | 4A |
| 2 | F2 |
| 0 | 8C |

### Data Read

| Read Address | Output Data |
|-------------|-------------|
| 0 | 8C |
| 5 | Stored Value |
| 7 | 4A |


The waveform confirms that the value written at address `7` is successfully retrieved during the read operation.

---

## Simulation Waveform
<img width="1522" height="765" alt="bmg" src="https://github.com/user-attachments/assets/fcf18e19-c185-42a4-8735-a97b2b86b443" />

The waveform verifies:

- Proper clock operation
- Successful memory write cycles
- Correct address selection
- Accurate data retrieval
- Correct output generation

Observed values:

```text
Write Data : 00 → 4A → F2 → 8C
Read Data  : 4A
```

---

## Applications

- FPGA-based RAM implementation
- Data buffering
- Embedded systems
- Lookup tables
- Communication systems
- Digital signal processing

---

## Result

The Block Memory Generator was successfully implemented and simulated using Verilog HDL. Data was correctly written to memory locations and retrieved using the specified read addresses, confirming proper memory functionality.
