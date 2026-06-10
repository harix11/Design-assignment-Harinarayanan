# D Flip-Flop using Verilog

## Overview

This project implements a D (Data) Flip-Flop with reset functionality using Verilog HDL. The flip-flop stores the value present at the input `D` on the active clock edge and provides the stored value at output `Q` along with its complement `QB`.

---

## Features

- Edge-triggered D Flip-Flop
- Reset support
- Complementary outputs (`Q` and `QB`)
- Verilog testbench for verification
- Simulation waveform included

---

## Inputs

| Signal | Description |
|----------|-------------|
| D | Data input |
| CLK | Clock input |
| RST | Reset signal |

---

## Outputs

| Signal | Description |
|----------|-------------|
| Q | Stored output |
| QB | Complement of Q |

---

## Working Principle

The D Flip-Flop captures the value of `D` at the active edge of the clock.

- If `D = 1`, the output `Q` becomes `1`.
- If `D = 0`, the output `Q` becomes `0`.
- `QB` always remains the complement of `Q`.
- When reset is asserted, the flip-flop returns to its initial state.

---

## Testbench Operation

The testbench performs the following actions:

1. Generates a clock signal with a 10 ns period.
2. Applies reset at the beginning of the simulation.
3. Changes the value of `D` at different time intervals.
4. Observes the corresponding outputs `Q` and `QB`.
5. Displays signal values using `$monitor`.

---

## Simulation Waveform

Observed signals:

- `clk` : Clock signal
- `rst` : Reset signal
- `d` : Data input
- `q` : Flip-flop output
- `qb` : Complementary output

### Waveform Analysis

- During reset, the flip-flop initializes to a known state.
- On each active clock edge, `Q` follows the value of `D`.
- `QB` remains the inverse of `Q`.
- Output changes occur only at clock edges, confirming edge-triggered operation.

Example behavior:

| Clock Edge | D | Q |
|------------|---|---|
| 1 | 0 | 0 |
| 2 | 1 | 1 |
| 3 | 0 | 0 |
| 4 | 1 | 1 |

---

## Applications

- Data storage elements
- Registers
- Shift registers
- Counters
- Finite State Machines (FSMs)
- Digital communication systems

---

## Result

The D Flip-Flop was successfully implemented and verified using Verilog HDL. Simulation results confirm that the output `Q` correctly captures the input `D` at each clock edge while `QB` remains its complement.
<img width="842" height="452" alt="D_ff" src="https://github.com/user-attachments/assets/b62fa76c-2b14-4fbc-9e06-eab3acd80cb2" />
