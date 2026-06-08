# 02 — Combinational Circuits in Verilog

> **VLSI Design Portfolio · Step 2 of 8**
> Verilog HDL implementation of all fundamental combinational logic circuits — with individual testbenches, GTKWave simulation waveforms, and terminal output verification for every circuit.

---

## Table of Contents
- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Circuits Implemented](#circuits-implemented)
- [Block Diagram](#block-diagram)
- [Simulation Instructions](#simulation-instructions)
- [Waveforms](#waveforms)
- [Concepts Covered](#concepts-covered)
- [Tools Used](#tools-used)
- [What's Next](#whats-next)

---

## Overview

This is the **second repository** in my journey of building a **16-bit pipelined RISC processor from scratch** using Verilog HDL.

Every processor datapath is built using combinational circuits. This repository implements all essential combinational blocks — adders, subtractors, multiplexers, decoders, encoders, priority encoders, comparators, ripple carry adders, adder-subtractors, and a complete 16-bit ALU.

Each circuit is implemented using **continuous assignment (`assign`)** and structural modeling, with its own dedicated Verilog module, testbench, terminal output, and GTKWave waveform for complete verification.

---

## Repository Structure

```
02-combinational-circuits/
│
├── src/                        # Verilog HDL source files
│   ├── addsub_16bit.v
│   ├── addsub_4bit.v
│   ├── alu_16bit.v
│   ├── comparator_16bit.v
│   ├── decoder3to8.v
│   ├── encoder8to3.v
│   ├── full_adder.v
│   ├── full_sub.v
│   ├── half_adder.v
│   ├── half_sub.v
│   ├── mux2to1.v
│   ├── mux4to1.v
│   ├── pr_encoder4to2.v
│   ├── pr_encoder8to3.v
│   ├── rca_16bit.v
│   ├── rca_2bit.v
│   └── rca_4bit.v
│
├── tb/                         # Testbench files
│   ├── addsub_16bit_tb.v
│   ├── addsub_4bit_tb.v
│   ├── alu_16bit_tb.v
│   ├── comparator_16bit_tb.v
│   ├── decoder3to8_tb.v
│   ├── encoder8to3_tb.v
│   ├── full_adder_tb.v
│   ├── full_sub_tb.v
│   ├── half_adder_tb.v
│   ├── half_sub_tb.v
│   ├── mux2to1_tb.v
│   ├── mux4to1_tb.v
│   ├── pr_encoder4to2_tb.v
│   ├── pr_encoder8to3_tb.v
│   ├── rca_16bit_tb.v
│   ├── rca_2bit_tb.v
│   └── rca_4bit_tb.v
│
├── sim/                        # Simulation waveforms and terminal outputs
│   ├── addsub_16bit_terminal.png
│   ├── addsub_16bit_waveform.png
│   ├── addsub_4bit_terminal.png
│   ├── addsub_4bit_waveform.png
│   ├── alu_16bit_terminal.png
│   ├── alu_16bit_waveform.png
│   ├── comparator_16bit_terminal.png
│   ├── comparator_16bit_waveform.png
│   ├── decoder3to8_terminal.png
│   ├── decoder3to8_waveform.png
│   ├── encoder8to3_terminal.png
│   ├── encoder8to3_waveform.png
│   ├── full_adder_terminal.png
│   ├── full_adder_waveform.png
│   ├── full_sub_terminal.png
│   ├── full_sub_waveform.png
│   ├── half_adder_terminal.png
│   ├── half_adder_waveform.png
│   ├── half_sub_terminal.png
│   ├── half_sub_waveform.png
│   ├── mux2to1_terminal.png
│   ├── mux2to1_waveform.png
│   ├── mux4to1_terminal.png
│   ├── mux4to1_waveform.png
│   ├── pr_encoder4to2_terminal.png
│   ├── pr_encoder4to2_waveform.png
│   ├── pr_encoder8to3_terminal.png
│   ├── pr_encoder8to3_waveform.png
│   ├── rca_16bit_terminal.png
│   ├── rca_16bit_waveform.png
│   ├── rca_2bit_terminal.png
│   ├── rca_2bit_waveform.png
│   ├── rca_4bit_terminal.png
│   └── rca_4bit_waveform.png
│
└── README.md
```

---

## Circuits Implemented

| #  | Circuit                    | Description                                      | Key Application                          |
|----|----------------------------|--------------------------------------------------|------------------------------------------|
| 1  | Half Adder                 | 1-bit addition (Sum + Carry)                     | Building block for adders                |
| 2  | Half Subtractor            | 1-bit subtraction (Diff + Borrow)                | Building block for subtractors           |
| 3  | Full Adder                 | 3-input addition (A, B, Cin)                     | Core of multi-bit adders                 |
| 4  | Full Subtractor            | 3-input subtraction (A, B, Bin)                  | Core of multi-bit subtractors            |
| 5  | 2:1 MUX                    | 2-to-1 Multiplexer                               | Data selection                           |
| 6  | 4:1 MUX                    | 4-to-1 Multiplexer                               | Data selection                           |
| 7  | 2-bit RCA                  | 2-bit Ripple Carry Adder                         | Small multi-bit addition                 |
| 8  | 4-bit RCA                  | 4-bit Ripple Carry Adder                         | Standard building block                  |
| 9  | 16-bit RCA                 | 16-bit Ripple Carry Adder                        | Processor datapath                       |
| 10 | 4-bit Adder-Subtractor     | 4-bit Add/Subtract with mode control             | ALU component                            |
| 11 | 16-bit Adder-Subtractor    | 16-bit Add/Subtract with mode control            | ALU component                            |
| 12 | 16-bit ALU                 | 16-bit Arithmetic Logic Unit                     | Execute stage of processor               |
| 13 | 16-bit Comparator          | 16-bit Magnitude Comparator                      | Branch condition evaluation              |
| 14 | 3:8 Decoder                | 3-to-8 Line Decoder                              | Address decoding                         |
| 15 | 8:3 Encoder                | 8-to-3 Line Encoder                              | Encoding logic                           |
| 16 | 4:2 Priority Encoder       | 4-to-2 Priority Encoder                          | Priority handling                        |
| 17 | 8:3 Priority Encoder       | 8-to-3 Priority Encoder                          | Priority handling                        |

---

## Simulation Instructions

### Requirements
- [Icarus Verilog](http://iverilog.icarus.com/) — open-source Verilog simulator
- [GTKWave](http://gtkwave.sourceforge.net/) — waveform viewer

### How to simulate any circuit

Replace `addsub_16bit` with the circuit name you want to simulate.

**Step 1 — Compile**
```bash
iverilog -o addsub_16bit_sim src/addsub_16bit.v tb/addsub_16bit_tb.v
```

**Step 2 — Run simulation**
```bash
vvp addsub_16bit_sim
```

**Step 3 — View waveform**
```bash
gtkwave addsub_16bit.vcd
```

### Quick reference — all circuits

```bash
# Half Adder
iverilog -o half_adder_sim src/half_adder.v tb/half_adder_tb.v && vvp half_adder_sim

# Full Adder
iverilog -o full_adder_sim src/full_adder.v tb/full_adder_tb.v && vvp full_adder_sim

# 16-bit Adder-Subtractor
iverilog -o addsub_16bit_sim src/addsub_16bit.v tb/addsub_16bit_tb.v && vvp addsub_16bit_sim

# 16-bit ALU
iverilog -o alu_16bit_sim src/alu_16bit.v tb/alu_16bit_tb.v && vvp alu_16bit_sim

# 16-bit Comparator
iverilog -o comparator_16bit_sim src/comparator_16bit.v tb/comparator_16bit_tb.v && vvp comparator_16bit_sim
```

(And similarly for all other circuits...)

### Expected simulation output

Each testbench applies all relevant input combinations (including edge cases like overflow, underflow, maximum values) and displays results on the terminal.

**Example (16-bit Adder-Subtractor):**
```
Time=0,m=0,a=7,b=3,result=10
Time=10000,m=1,a=2,b=1,result=1
...
Time=50000,m=0,a=65535,b=1,result=65536
```

---

## Waveforms

### Half Adder
![Half Adder Waveform](sim/half_adder_waveform.png)
![Half Adder Terminal](sim/half_adder_terminal.png)

### Half Subtractor
![Half Subtractor Waveform](sim/half_sub_waveform.png)
![Half Subtractor Terminal](sim/half_sub_terminal.png)

### Full Adder
![Full Adder Waveform](sim/full_adder_waveform.png)
![Full Adder Terminal](sim/full_adder_terminal.png)

### Full Subtractor
![Full Subtractor Waveform](sim/full_sub_waveform.png)
![Full Subtractor Terminal](sim/full_sub_terminal.png)

### 2:1 MUX
![2:1 MUX Waveform](sim/mux2to1_waveform.png)
![2:1 MUX Terminal](sim/mux2to1_terminal.png)

### 4:1 MUX
![4:1 MUX Waveform](sim/mux4to1_waveform.png)
![4:1 MUX Terminal](sim/mux4to1_terminal.png)

### 2-bit RCA
![2-bit RCA Waveform](sim/rca_2bit_waveform.png)
![2-bit RCA Terminal](sim/rca_2bit_terminal.png)

### 4-bit RCA
![4-bit RCA Waveform](sim/rca_4bit_waveform.png)
![4-bit RCA Terminal](sim/rca_4bit_terminal.png)

### 16-bit RCA
![16-bit RCA Waveform](sim/rca_16bit_waveform.png)
![16-bit RCA Terminal](sim/rca_16bit_terminal.png)

### 4-bit Adder-Subtractor
![4-bit Adder-Subtractor Waveform](sim/addsub_4bit_waveform.png)
![4-bit Adder-Subtractor Terminal](sim/addsub_4bit_terminal.png)

### 16-bit Adder-Subtractor
![16-bit Adder-Subtractor Waveform](sim/addsub_16bit_waveform.png)
![16-bit Adder-Subtractor Terminal](sim/addsub_16bit_terminal.png)

### 16-bit ALU
![16-bit ALU Waveform](sim/alu_16bit_waveform.png)
![16-bit ALU Terminal](sim/alu_16bit_terminal.png)

### 16-bit Comparator
![16-bit Comparator Waveform](sim/comparator_16bit_waveform.png)
![16-bit Comparator Terminal](sim/comparator_16bit_terminal.png)

### 3:8 Decoder
![3:8 Decoder Waveform](sim/decoder3to8_waveform.png)
![3:8 Decoder Terminal](sim/decoder3to8_terminal.png)

### 8:3 Encoder
![8:3 Encoder Waveform](sim/encoder8to3_waveform.png)
![8:3 Encoder Terminal](sim/encoder8to3_terminal.png)

### 4:2 Priority Encoder
![4:2 Priority Encoder Waveform](sim/pr_encoder4to2_waveform.png)
![4:2 Priority Encoder Terminal](sim/pr_encoder4to2_terminal.png)

### 8:3 Priority Encoder
![8:3 Priority Encoder Waveform](sim/pr_encoder8to3_waveform.png)
![8:3 Priority Encoder Terminal](sim/pr_encoder8to3_terminal.png)

---

## Concepts Covered

### Verilog
- `module` and `endmodule`
- `input` / `output` port declarations
- Continuous assignment (`assign`)
- Structural modeling using module instantiation
- Multi-bit vectors and bus handling
- Testbench structure (`$display`, `$monitor`, `$dumpfile`, `$dumpvars`, `$finish`)

### Digital Design
- Arithmetic circuits and ripple carry propagation
- Data routing using multiplexers
- Encoding and decoding logic
- Priority encoding
- Magnitude comparison
- Complete 16-bit ALU design
- Overflow / underflow handling

### Processor Relevance
- These blocks form the foundation of the **ALU** and datapath in the final RISC processor.

---

## Tools Used

| Tool            | Version     | Purpose                          |
|-----------------|-------------|----------------------------------|
| Icarus Verilog  | 0.9.7 / 1.1 | Compilation and simulation       |
| GTKWave         | 3.3.x       | Waveform viewing and verification|
| VS Code         | Latest      | Code editor                      |
| Git             | Latest      | Version control                  |

---

## What's Next

This repository is **Step 2** in an 8-step roadmap building up to a complete 16-bit pipelined RISC processor.

| Step | Repository                        | Status     |
|------|-----------------------------------|------------|
| 1    | `01-basic-logic-gates`            | ✅ Complete |
| 2    | `02-combinational-circuits`       | ✅ Complete |
| 3    | `03-sequential-circuits`          | ⏳ Upcoming |
| 4    | `04-finite-state-machines`        | ⏳ Upcoming |
| 5    | `05-alu-16bit`                    | ⏳ Upcoming |
| 6    | `06-processor-components`         | ⏳ Upcoming |
| 7    | `07-risc16-pipelined-processor`   | ⏳ Upcoming |
| 8    | `08-protocols-and-interfaces`     | ⏳ Upcoming |

---

## Author

**Abhi** — B.Tech ECE, 3rd Year  
Building a complete VLSI design portfolio from logic gates to a pipelined processor.

[![GitHub](https://img.shields.io/badge/GitHub-abhichandra586-181717?style=flat&logo=github)](https://github.com/abhichandra586)

---

*Part of an 8-repository VLSI learning roadmap — from AND gate to 16-bit pipelined RISC processor.*
