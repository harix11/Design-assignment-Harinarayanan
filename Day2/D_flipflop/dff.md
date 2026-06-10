# D Flip-Flop using Verilog

## Overview
This project implements a D (Data) Flip-Flop in Verilog HDL with a reset input. A D Flip-Flop stores the value present at the data input (`D`) on the active clock edge and outputs it through `Q`.

## Features
- Edge-triggered D Flip-Flop
- Reset functionality
- Complementary outputs (`Q` and `Q̅`)
- Includes a testbench for simulation and verification

## Inputs

| Signal | Description |
|----------|-------------|
| D | Data input |
| CLK | Clock input |
| RST | Reset input |

## Outputs

| Signal | Description |
|----------|-------------|
| Q | Stored output |
| QB | Complement of Q |

## Test Sequence

| Time (ns) | RST | D | Operation |
|-----------|-----|---|-----------|
| 0 | 1 | 0 | Reset active |
| 10 | 0 | 0 | Reset released |
| 20 | 0 | 1 | Load 1 |
| 30 | 0 | 0 | Load 0 |
| 40 | 0 | 1 | Load 1 |
| 50 | 1 | 1 | Reset active |
| 60 | 0 | 1 | Reset released |
| 70 | 0 | 0 | Load 0 |

## Working Principle
A D Flip-Flop samples the input `D` at the active edge of the clock and transfers it to the output `Q`. The output remains unchanged until the next active clock edge. When the reset signal is asserted, the output is cleared regardless of the input.

## Result
The D Flip-Flop successfully stores the input data on the clock edge and responds correctly to the reset signal, producing the expected outputs `Q` and `QB`.
<img width="842" height="452" alt="D_ff" src="https://github.com/user-attachments/assets/b62fa76c-2b14-4fbc-9e06-eab3acd80cb2" />
