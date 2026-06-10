# BCD Adder using Verilog

## Overview
This project implements a Binary Coded Decimal (BCD) Adder in Verilog HDL. The adder performs decimal digit addition and automatically corrects invalid BCD results by adding 6 whenever the binary sum exceeds 9 or generates a carry.

## Features
- Adds two 4-bit BCD numbers
- Supports carry input (Cin)
- Generates BCD-corrected sum
- Produces carry output (Cout)
- Includes a testbench for simulation

## Inputs
| Signal | Description |
|----------|-------------|
| A[3:0] | First BCD digit |
| B[3:0] | Second BCD digit |
| Cin | Carry input |

## Outputs
| Signal | Description |
|----------|-------------|
| Sum[3:0] | BCD sum |
| Cout | Carry output |

## Test Cases

| A | B | Cin |
|---|---|-----|
| 0 | 0 | 0 |
| 4 | 3 | 0 |
| 8 | 1 | 0 |
| 7 | 5 | 0 |
| 9 | 9 | 1 |
| 8 | 8 | 0 |


## Result
The design successfully performs BCD addition and generates correct decimal results with appropriate carry handling.
<img width="851" height="477" alt="bcd_adder" src="https://github.com/user-attachments/assets/9ee0b976-6358-48ca-ba03-f20cc90cc676" />
