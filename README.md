 This repository serves as a structured documentation of my daily work, progress, and implementations in RTL design, combinational logic, and sequential circuits. Each day contains HDL design files, testbenches, and verified simulation waveforms.

🔹 Day 1: RTL Design Foundations & Adders
Focus: Understanding the RTL design flow and implementing basic arithmetic combinational circuits.

Key Tasks:

Designed fundamental building blocks: Half Adder and Full Adder.

Implemented a structural Ripple Carry Adder (RCA) using the full adder components.

Developed a BCD Adder leveraging the structural Ripple Carry Adder logic.

Verified functional correctness using custom testbenches and documented the simulated output waveforms.


🔹 Day 2: Combinational & Sequential Building Blocks
Focus: Distinguishing between combinational and sequential circuit design methodologies and timing behavior.

Key Tasks:

Implemented combinational routing logic with a 2x4 Decoder.

Designed basic storage elements including memory-based SR Flip-Flop and edge-triggered D Flip-Flop.

Built a Universal Shift Register (USR) to explore parallel/serial data manipulation.

Segregated all designs into dedicated rtl/ and testbench/ directories, compiling simulation waveforms in corresponding .md documentation logs.

🔹 Day 3: Memory Buffers & Finite State Machines (FSM)
Focus: Exploring hardware memory queues and tracking sequential input patterns using complex control logic.

Key Tasks:

Designed a FIFO (First In, First Out) memory buffer, implementing read/write pointer management along with accurate generation of full and empty status flags.

Implemented an Overlapping 1110 Sequence Detector utilizing a Finite State Machine (FSM) architecture, ensuring the state logic resets correctly to catch overlapping pattern streams.

Extensively tested both modules with edge-case scenarios in testbenches and attached the verified simulation waveforms.

🔹 Day 4: Custom Hardware Memory Array Design
Focus: Understanding synchronous memory architectures, array addressing, and storage blocks in RTL hardware.

Key Tasks:

Designed an 8x8 Block RAM configuration (8 words, 8 bits wide), establishing synchronous write and read behavior.

Implemented proper write-enable control logic and addressing schemas to ensure stable data retention.

Built a tailored testbench to simulate rigorous read/write sequencing across multiple memory addresses, capturing and saving the validated output waveforms.

---

## 📂 Repository Directory Structure

To keep the repository clean and scalable for upcoming updates, the project is organized as follows:

```text
.
├── Day01
│   ├── bcd_adder/
│   │   ├── Design/
│   │   │   └── bcd_adder.v
|   |   |   └── rca.v        # Design code for BCD Adder
│   │   ├── testbench/
│   │   │   └── bcd_adder_tb.v      # Testbench for BCD Adder
│   │   └── bcd_adder.md            # Waveforms and detailed documentation
│   └── ripple_carry_adder/
│       ├── Design/
│       │   ├── half_adder.v        # Supporting Half Adder component
│       │   ├── full_adder.v        # Supporting Full Adder component
│       │   └── rca.v               # Top-level Ripple Carry Adder
│       ├── testbench/
│       │   └── rca_tb.v            # Testbench for RCA
│       └── rca.md                  # Waveforms and detailed documentation
│
├── Day02
│   ├── sr_flipflop/
│   │   ├── Design/sr_ff.v
│   │   ├── testbench/sr_ff_tb.v
│   │   └── sr_flipflop.md
│   ├── d_flipflop/
│   │   ├── Design/d_ff.v
│   │   ├── testbench/d_ff_tb.v
│   │   └── d_flipflop.md
│   ├── universal_shift_register/
│   │   ├── Design/usr.v
│   │   ├── testbench/usr_tb.v
│   │   └── usr.md
│   └── decoder_2x4/
│       ├── Design/decoder_2by4.v
│       ├── testbench/decoder_2by4_tb.v
│       └── decoder_2x4.md
├── Day03
│   ├── fifo/
│   │   ├── Design/
|   |   |   ├──top_mod.v
|   |   |   ├──machine1.v
|   |   |   ├──machine2.v
|   |   |   └──fifo.v
│   │   ├── testbench/fifo_tb.v 
│   │   └── fifo.md                
│   └── sequence_detector_1110/
│       ├── Design/seq_det_1110.v
│       ├── testbench/seq_det_1110_tb.v 
│       └── seq_det_1110.md
│
├── Day04/
│   └── block memory generator/
│       ├── Design/
│       │   └── bmg.v   
│       ├── testbench/
│       │   └── bmg_tb.v 
│       └── bmg.md            
└── README.md                       
