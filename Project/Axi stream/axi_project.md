# Dynamic Bandwidth Throttler using AXI-Stream

## Overview

This project implements a Dynamic Bandwidth Throttler for AXI-Stream data paths using Verilog HDL.

The design monitors the outgoing traffic rate and dynamically adjusts the transmission bandwidth using a closed-loop feedback mechanism. This prevents excessive traffic bursts and maintains data flow within configurable limits.

---

## System Architecture

The design consists of four major blocks:

```text
AXI-Stream Input
        │
        ▼
 ┌───────────────┐
 │ AXIS Reg Slice│
 └───────────────┘
        │
        ▼
 ┌───────────────┐
 │   AXIS FIFO   │
 └───────────────┘
        │
        ▼
 ┌───────────────┐
 │ Rate Limiter  │
 └───────────────┘
        │
        ▼
 ┌───────────────┐
 │ Byte Counter  │
 └───────────────┘
        │
        ▼
 AXI-Stream Output
```

A control FSM continuously monitors traffic statistics and updates the rate limiter.
<img width="1400" height="720" alt="image" src="https://github.com/user-attachments/assets/8857170a-61d1-4c2c-ad6f-783bd5b45b2b" />

---

## Features

- AXI-Stream compliant interface
- Dynamic bandwidth control
- FIFO-based buffering
- Byte-count monitoring
- Closed-loop feedback control
- Programmable thresholds
- FSM-based throttling logic
- Overflow prevention

---

## Major Modules

### 1. AXIS Register Slice

- Pipeline stage for timing improvement.
- Registers incoming AXI-Stream transactions.

### 2. AXIS FIFO

- Temporary storage for incoming packets.
- Handles traffic bursts.
- Provides backpressure support.

### 3. AXIS Rate Limiter

- Controls transmission bandwidth.
- Allows only a configurable fraction of packets to pass.

### 4. AXIS Statistics Counter

- Monitors transferred bytes.
- Generates bandwidth usage statistics.

### 5. Rate Control FSM

- Reads traffic statistics.
- Compares traffic against thresholds.
- Dynamically adjusts throttle ratio.

---

## Configuration Parameters

| Parameter | Description |
|------------|------------|
| cfg_high_threshold_bytes | Upper bandwidth threshold |
| cfg_low_threshold_bytes | Lower bandwidth threshold |
| rate_limit_num | Numerator of throttle ratio |
| rate_limit_denom | Denominator of throttle ratio |

Example:

```text
rate_limit_num   = 1
rate_limit_denom = 1
```

---

## FSM States

### STATE_IDLE

- Normal operation.
- Traffic below threshold.

### STATE_THROTTLE

- Activated when traffic exceeds the high threshold.
- Reduces output bandwidth.

### STATE_RECOVERY

- Activated when traffic falls below the low threshold.
- Gradually restores bandwidth.

---

## AXI-Stream Signals

### Input Interface

| Signal | Description |
|----------|-------------|
| s_axis_tdata | Input data |
| s_axis_tkeep | Byte enable |
| s_axis_tvalid | Input valid |
| s_axis_tready | Input ready |
| s_axis_tlast | End of packet |

### Output Interface

| Signal | Description |
|----------|-------------|
| m_axis_tdata | Output data |
| m_axis_tkeep | Byte enable |
| m_axis_tvalid | Output valid |
| m_axis_tready | Output ready |
| m_axis_tlast | End of packet |

---

## Simulation Observations
<img width="1337" height="565" alt="image" src="https://github.com/user-attachments/assets/9bc44b45-232c-4023-ae5a-5bc1f25b8d4c" />

<img width="1339" height="538" alt="image" src="https://github.com/user-attachments/assets/e11fc421-47fd-41f8-a63d-9ab21748bb79" />

The waveform verifies:

- Successful AXI-Stream transfers.
- FIFO buffering operation.
- Dynamic rate limiting.
- FSM state transitions.
- Byte counter monitoring.
- Controlled packet forwarding.

Observed state transitions:

```text
IDLE → THROTTLE → RECOVERY → IDLE
```

Observed configuration:

```text
High Threshold : 0x28 bytes
Low Threshold  : 0x0C bytes
```

The output stream is throttled whenever traffic exceeds the configured limit and automatically recovers when traffic reduces.

---

## Applications

- Network traffic shaping
- Ethernet packet control
- FPGA-based routers
- Data center accelerators
- Video streaming systems
- High-speed communication systems
- QoS (Quality of Service) management

---

## Result

The Dynamic Bandwidth Throttler was successfully implemented and verified using Verilog HDL. Simulation results confirm correct operation of FIFO buffering, AXI-Stream rate limiting, bandwidth monitoring, and FSM-based closed-loop traffic control.
