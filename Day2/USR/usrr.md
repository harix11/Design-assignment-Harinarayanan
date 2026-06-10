# 4-Bit Universal Shift Register using Verilog

## Overview

This project implements a 4-bit Universal Shift Register capable of operating in four different modes:

- SISO (Serial In Serial Out)
- SIPO (Serial In Parallel Out)
- PISO (Parallel In Serial Out)
- PIPO (Parallel In Parallel Out)

The operating mode is selected using a 2-bit control signal `sel[1:0]`.

---

## Inputs

| Signal | Description |
|----------|-------------|
| clk | Clock signal |
| rst | Reset signal |
| sel[1:0] | Mode select |
| sin | Serial input |
| pin[3:0] | Parallel input |

---

## Outputs

| Signal | Description |
|----------|-------------|
| pout[3:0] | Parallel output |
| sout | Serial output |

---

## Mode Selection

| sel | Mode |
|------|------|
| 00 | SISO |
| 01 | SIPO |
| 10 | PISO |
| 11 | PIPO |

---

## Working Principle

### SISO (Serial In Serial Out)
Data enters serially one bit at a time and exits serially after successive clock pulses.

### SIPO (Serial In Parallel Out)
Data enters serially and becomes available simultaneously at the parallel outputs after shifting.

### PISO (Parallel In Serial Out)
Parallel data is loaded into the register and shifted out serially one bit per clock cycle.

### PIPO (Parallel In Parallel Out)
Parallel data is loaded and retrieved simultaneously.

---

## Simulation

The waveform verifies all four modes of operation:
- Serial loading
- Serial shifting
- Parallel loading
- Parallel output retrieval

The register correctly performs data transfer according to the selected mode.

---

## Applications

- Data conversion
- Communication systems
- Data buffering
- Digital signal processing
- Computer registers

---

## Result

The 4-bit Universal Shift Register was successfully implemented and verified in Verilog HDL. Simulation results confirm correct operation in SISO, SIPO, PISO, and PIPO modes.
<img width="1280" height="643" alt="usr" src="https://github.com/user-attachments/assets/68dac370-c4ce-4fea-80f5-5bca63621089" />

