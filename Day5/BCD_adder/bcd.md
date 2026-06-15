
# BCD Adder using Verilog

## Overview

This project implements a BCD (Binary Coded Decimal) Adder using Verilog HDL. The adder performs the addition of two BCD digits along with an optional carry input and generates a valid BCD output.

Whenever the binary sum exceeds 9, a correction factor of 6 (0110) is added to produce a valid BCD result.

---

## Features

- Addition of two 4-bit BCD numbers
- Carry input support
- Automatic BCD correction
- Valid BCD sum generation
- Carry output generation
- Verilog testbench for verification

---

## Inputs

| Signal | Description |
|----------|-------------|
| a[3:0] | First BCD digit |
| b[3:0] | Second BCD digit |
| cin | Carry input |

---

## Outputs

| Signal | Description |
|----------|-------------|
| s[3:0] | BCD Sum |
| cout | Carry output |

---

## Working Principle

1. Add the two BCD digits and carry input.
2. Check whether the result exceeds decimal 9.
3. If the sum is greater than 9, add binary 0110 (decimal 6).
4. Generate the corrected BCD output and carry.

---

## Test Cases

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 | 0 | 0 | 0 |
| 4 | 5 | 0 | 9 | 0 |
| 7 | 6 | 0 | 3 | 1 |
| 9 | 9 | 0 | 8 | 1 |
| 3 | 5 | 1 | 9 | 0 |

---

## Simulation Waveform
<img width="1556" height="787" alt="bcd_interface_out" src="https://github.com/user-attachments/assets/2f7961a3-1871-4063-9087-1ebe0d43865c" />

The waveform verifies correct BCD addition and correction.

Observed results:

```text
4 + 5 + 0 = 9
7 + 6 + 0 = 13 → Sum = 3, Carry = 1
9 + 9 + 0 = 18 → Sum = 8, Carry = 1
3 + 5 + 1 = 9
```

The output remains a valid BCD digit for all input combinations.

---

## Applications

- Digital calculators
- Decimal arithmetic circuits
- Financial and accounting systems
- Digital clocks
- Embedded systems requiring decimal calculations

---

## Result

The BCD Adder was successfully implemented and verified using Verilog HDL. Simulation results confirm correct decimal addition, BCD correction, and carry generation for all test cases.
