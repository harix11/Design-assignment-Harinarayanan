# SR Flip-Flop using Verilog

## Overview

This project implements a clocked SR (Set-Reset) Flip-Flop using Verilog HDL. The SR Flip-Flop is a fundamental sequential logic circuit used for storing one bit of data.

The output state depends on the values of the Set (`S`) and Reset (`R`) inputs at the active clock edge.

---

## Features

- Clock-controlled SR Flip-Flop
- Set and Reset operations
- Complementary outputs (`Q` and `QB`)
- Verilog testbench for verification
- Simulation waveform included

---

## Inputs

| Signal | Description |
|----------|-------------|
| S | Set input |
| R | Reset input |
| CLK | Clock input |

---

## Outputs

| Signal | Description |
|----------|-------------|
| Q | Main output |
| QB | Complement of Q |

---

## Truth Table

| S | R | Q(next) | Operation |
|---|---|----------|-----------|
| 0 | 0 | Q(previous) | Hold State |
| 0 | 1 | 0 | Reset |
| 1 | 0 | 1 | Set |
| 1 | 1 | Invalid | Undefined State |

---

## Working Principle

The SR Flip-Flop stores one bit of information.

- **Set (S = 1, R = 0):** Output `Q` becomes HIGH.
- **Reset (S = 0, R = 1):** Output `Q` becomes LOW.
- **Hold (S = 0, R = 0):** Previous state is retained.
- **Invalid (S = 1, R = 1):** Both outputs attempt to become the same value, resulting in an undefined condition.

---

## Test Cases

| S | R | Expected Q |
|---|---|------------|
| 0 | 1 | 0 |
| 1 | 0 | 1 |
| 0 | 0 | Hold |
| 1 | 1 | Invalid |

---

## Simulation Waveform

The waveform verifies the operation of the SR Flip-Flop:

- When `S` is asserted, `Q` changes to HIGH.
- When `R` is asserted, `Q` changes to LOW.
- During the hold condition (`S=0`, `R=0`), the previous state is maintained.
- `QB` always remains the complement of `Q` except during the invalid state.

The simulation confirms correct Set, Reset, and Hold operations.

---

## Applications

- Memory elements
- Registers
- Counters
- Finite State Machines (FSMs)
- Digital storage circuits
- Control systems

---

## Result

The SR Flip-Flop was successfully implemented and verified using Verilog HDL. Simulation results confirm correct Set, Reset, and Hold functionality with complementary outputs `Q` and `QB`.
<img width="847" height="477" alt="sr_ff" src="https://github.com/user-attachments/assets/202439db-8824-4b5c-b75c-f74aa34f2e51" />

