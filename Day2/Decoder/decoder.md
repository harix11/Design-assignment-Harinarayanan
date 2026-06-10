# 2-to-4 Decoder using Verilog

## Overview

This project implements a 2-to-4 Decoder using Verilog HDL. A decoder is a combinational logic circuit that converts a binary input into one of several unique output lines.

For a 2-bit input, exactly one of the four outputs is asserted HIGH at any given time.

---

## Features

- 2-bit binary input
- 4-bit decoded output
- Combinational logic design
- Verilog testbench for verification
- Simulation waveform included

---

## Inputs

| Signal | Description |
|----------|-------------|
| A[1:0] | 2-bit input |

---

## Outputs

| Signal | Description |
|----------|-------------|
| D[3:0] | 4-bit decoded output |

---

## Truth Table

| A1 | A0 | D3 D2 D1 D0 |
|----|----|-------------|
| 0 | 0 | 0001 |
| 0 | 1 | 0010 |
| 1 | 0 | 0100 |
| 1 | 1 | 1000 |

---

## Working Principle

The decoder activates one output line corresponding to the binary value present at the input.

- Input `00` activates `D0`
- Input `01` activates `D1`
- Input `10` activates `D2`
- Input `11` activates `D3`

Only one output remains HIGH at a time.

---

## Test Cases

| Input A | Output D |
|----------|----------|
| 00 | 0001 |
| 01 | 0010 |
| 10 | 0100 |
| 11 | 1000 |

---

## Simulation Waveform

The waveform verifies the decoder operation:

| Input A | Output D |
|----------|----------|
| 0 | 1 |
| 1 | 2 |
| 2 | 4 |
| 3 | 8 |

The output changes according to the applied input combination, confirming correct decoding functionality.

---

## Applications

- Memory address decoding
- Data routing
- Instruction decoding in processors
- Digital communication systems
- Multiplexer and demultiplexer circuits

---

## Result

The 2-to-4 Decoder was successfully implemented and verified using Verilog HDL. Simulation results confirm that each input combination activates the correct output line while keeping all other outputs LOW.
<img width="835" height="477" alt="decoder 2x4" src="https://github.com/user-attachments/assets/bd81bb24-d5f4-4193-8d44-9806986426aa" />
