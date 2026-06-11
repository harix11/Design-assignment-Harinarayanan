
# Block Memory Generator (BMG) using Verilog

## Overview

This project demonstrates the implementation and simulation of a Block Memory Generator (BMG) using Verilog HDL. The memory stores 8-bit data values and allows read/write operations through address lines.

The design is commonly used to implement RAM in FPGA-based systems.

---

## Features

- 8-bit data width
- 3-bit address bus
- Read and write operations
- FPGA Block RAM implementation
- Verilog testbench for verification
- Simulation waveform included

---

## Inputs

| Signal | Description |
|----------|-------------|
| wr_en | Write enable signal |
| addr_wr_tb[2:0] | Write address |
| addr_rd_tb[2:0] | Read address |
| din_sim[7:0] | Data input |

---

## Outputs

| Signal | Description |
|----------|-------------|
| dout_sim[7:0] | Data output |

---

## Memory Operation

### Write Operation

When `wr_en = 1`:

- Data present at `din_sim` is written into the memory location specified by `addr_wr_tb`.

Example:

| Address | Data Written |
|----------|-------------|
| 0 | 00 |
| 7 | 4A |
| 2 | F2 |
| 0 | 8C |

---

### Read Operation

When a read address is applied through `addr_rd_tb`, the data stored at that memory location appears on `dout_sim`.

Example:

| Read Address | Output Data |
|-------------|-------------|
| 0 | 8C |
| 5 | Stored Value |
| 7 | 4A |

---

## Simulation Waveform

The waveform verifies:

1. Data is successfully written into memory locations.
2. Different addresses are accessed during simulation.
3. Stored data is correctly retrieved from memory.
4. The output matches the value stored at the selected read address.

Observed values:

```text
Written Data:
00 → 4A → F2 → 8C

Read Data:
4A (from Address 7)
```

The simulation confirms correct memory read and write functionality.

---

## Applications

- FPGA memory systems
- Data buffering
- Lookup tables (LUTs)
- Embedded processors
- Digital signal processing
- Communication systems

---

## Result

The Block Memory Generator was successfully implemented and verified using Verilog HDL. Simulation results confirm that data can be written to and read from memory locations correctly using the address inputs.
<img width="1582" height="762" alt="bmg" src="https://github.com/user-attachments/assets/f3015252-86b3-438a-92a0-5bf781398b69" />
