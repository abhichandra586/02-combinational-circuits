# 02 — Combinational Circuits in Verilog

> **VLSI Design Portfolio · Step 2 of 8**
> Verilog HDL implementation of all essential combinational circuits — from Half Adder to 16-bit Ripple Carry Adder — with individual testbenches, GTKWave simulation waveforms, and terminal output verification for every circuit.

---

## Table of Contents
- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Circuits Implemented](#circuits-implemented)
- [Truth Tables](#truth-tables)
- [Simulation Instructions](#simulation-instructions)
- [Waveforms and Simulation Results](#waveforms-and-simulation-results)
- [Concepts Covered](#concepts-covered)
- [Tools Used](#tools-used)
- [What's Next](#whats-next)

---

## Overview

This is the **second repository** in my journey of building a **16-bit pipelined RISC processor from scratch** using Verilog HDL.

Combinational circuits produce outputs that depend only on current inputs — no memory element involved. This repository implements all essential combinational arithmetic circuits, starting from a Half Adder and building progressively to a 16-bit Ripple Carry Adder.

Every circuit is:
- Implemented using structural and behavioural Verilog
- Verified against its complete truth table
- Simulated using Icarus Verilog
- Waveforms viewed and captured in GTKWave

> **Design philosophy:** Each circuit builds directly on the previous one. The Half Adder uses XOR and AND gates from Repo 1. The Full Adder uses two Half Adders. The RCA chains Full Adders. This bottom-up approach mirrors how real digital systems are designed.

---

## Repository Structure

```
02-combinational-circuits/
│
├── src/                            # Verilog HDL source files
│   ├── half_adder.v                # 1-bit Half Adder
│   ├── full_adder.v                # 1-bit Full Adder
│   ├── half_sub.v                  # 1-bit Half Subtractor
│   ├── full_sub.v                  # 1-bit Full Subtractor
│   ├── rca_2bit.v                  # 2-bit Ripple Carry Adder
│   ├── rca_4bit.v                  # 4-bit Ripple Carry Adder
│   └── rca_16bit.v                 # 16-bit Ripple Carry Adder
│
├── tb/                             # Testbench files
│   ├── half_adder_tb.v             # Half Adder testbench
│   ├── full_adder_tb.v             # Full Adder testbench
│   ├── half_sub_tb.v               # Half Subtractor testbench
│   ├── full_sub_tb.v               # Full Subtractor testbench
│   ├── rca_2bit_tb.v               # 2-bit RCA testbench
│   ├── rca_4bit_tb.v               # 4-bit RCA testbench
│   └── rca_16bit_tb.v              # 16-bit RCA testbench
│
├── sim/                            # Simulation waveforms and outputs
│   ├── half_adder_waveform.png     # GTKWave screenshot
│   ├── half_adder_terminal.png     # Terminal output screenshot
│   ├── full_adder_waveform.png     # GTKWave screenshot
│   ├── full_adder_terminal.png     # Terminal output screenshot
│   ├── half_sub_waveform.png       # GTKWave screenshot
│   ├── half_sub_terminal.png       # Terminal output screenshot
│   ├── full_sub_waveform.png       # GTKWave screenshot
│   ├── full_sub_terminal.png       # Terminal output screenshot
│   ├── rca_2bit_waveform.png       # GTKWave screenshot
│   ├── rca_2bit_terminal.png       # Terminal output screenshot
│   ├── rca_4bit_waveform.png       # GTKWave screenshot
│   ├── rca_4bit_terminal.png       # Terminal output screenshot
│   ├── rca_16bit_waveform.png      # GTKWave screenshot
│   └── rca_16bit_terminal.png      # Terminal output screenshot
│
└── README.md
```

---

## Circuits Implemented

| # | Circuit | File | Inputs | Outputs | Key Concept |
|---|---------|------|--------|---------|-------------|
| 1 | Half Adder | `half_adder.v` | A, B | Sum, Carry | XOR for sum, AND for carry |
| 2 | Full Adder | `full_adder.v` | A, B, Cin | Sum, Cout | Two half adders chained |
| 3 | Half Subtractor | `half_sub.v` | A, B | Diff, Borrow | XOR for diff, NOT+AND for borrow |
| 4 | Full Subtractor | `full_sub.v` | A, B, Bin | Diff, Bout | Two half subtractors chained |
| 5 | 2-bit RCA | `rca_2bit.v` | A[1:0], B[1:0], Cin | Sum[1:0], Cout | 2 full adders chained |
| 6 | 4-bit RCA | `rca_4bit.v` | A[3:0], B[3:0], Cin | Sum[3:0], Cout | 4 full adders chained |
| 7 | 16-bit RCA | `rca_16bit.v` | A[15:0], B[15:0], Cin | Sum[15:0], Cout | 16 full adders chained |

> **Note:** The 16-bit RCA directly feeds into the 16-bit ALU in Repo 5, which becomes the Execute (EX) stage of the pipelined RISC processor.

---

## Truth Tables

### Half Adder — Sum = A ⊕ B, Carry = A · B

| A | B | Sum | Carry |
|---|---|-----|-------|
| 0 | 0 |  0  |   0   |
| 0 | 1 |  1  |   0   |
| 1 | 0 |  1  |   0   |
| 1 | 1 |  0  |   1   |

### Full Adder — Sum = A ⊕ B ⊕ Cin

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 |  0  |  0  |  0   |
| 0 | 0 |  1  |  1  |  0   |
| 0 | 1 |  0  |  1  |  0   |
| 0 | 1 |  1  |  0  |  1   |
| 1 | 0 |  0  |  1  |  0   |
| 1 | 0 |  1  |  0  |  1   |
| 1 | 1 |  0  |  0  |  1   |
| 1 | 1 |  1  |  1  |  1   |

### Half Subtractor — Diff = A ⊕ B, Borrow = Ā · B

| A | B | Diff | Borrow |
|---|---|------|--------|
| 0 | 0 |  0   |   0    |
| 0 | 1 |  1   |   1    |
| 1 | 0 |  1   |   0    |
| 1 | 1 |  0   |   0    |

### Full Subtractor — Diff = A ⊕ B ⊕ Bin

| A | B | Bin | Diff | Bout |
|---|---|-----|------|------|
| 0 | 0 |  0  |  0   |  0   |
| 0 | 0 |  1  |  1   |  1   |
| 0 | 1 |  0  |  1   |  1   |
| 0 | 1 |  1  |  0   |  1   |
| 1 | 0 |  0  |  1   |  0   |
| 1 | 0 |  1  |  0   |  0   |
| 1 | 1 |  0  |  0   |  0   |
| 1 | 1 |  1  |  1   |  1   |

### 4-bit RCA — Key Test Cases

| A (decimal) | B (decimal) | Cin | Sum (decimal) | Cout |
|-------------|-------------|-----|---------------|------|
| 0           | 0           |  0  |      0        |  0   |
| 4           | 3           |  0  |      7        |  0   |
| 9           | 6           |  0  |     15        |  0   |
| 15          | 1           |  0  |      0        |  1   |
| 7           | 7           |  1  |     15        |  0   |
| 15          | 15          |  1  |     15        |  1   |

---

## Simulation Instructions

### Requirements
- [Icarus Verilog](http://iverilog.icarus.com/) — open-source Verilog simulator
- [GTKWave](http://gtkwave.sourceforge.net/) — waveform viewer

### How to simulate any circuit

Replace the module name as needed.

**Step 1 — Compile**
```bash
iverilog -o sim.vvp src/half_adder.v tb/half_adder_tb.v
```

**Step 2 — Run simulation**
```bash
vvp sim.vvp
```

**Step 3 — View waveform**
```bash
gtkwave dump.vcd
```

### Quick reference — all circuits

```bash
# Half Adder
iverilog -o sim.vvp src/half_adder.v    tb/half_adder_tb.v    && vvp sim.vvp

# Full Adder
iverilog -o sim.vvp src/full_adder.v    tb/full_adder_tb.v    && vvp sim.vvp

# Half Subtractor
iverilog -o sim.vvp src/half_sub.v      tb/half_sub_tb.v      && vvp sim.vvp

# Full Subtractor
iverilog -o sim.vvp src/full_sub.v      tb/full_sub_tb.v      && vvp sim.vvp

# 2-bit RCA
iverilog -o sim.vvp src/rca_2bit.v      tb/rca_2bit_tb.v      && vvp sim.vvp

# 4-bit RCA (requires full_adder.v)
iverilog -o sim.vvp src/full_adder.v src/rca_4bit.v tb/rca_4bit_tb.v && vvp sim.vvp

# 16-bit RCA (requires full_adder.v)
iverilog -o sim.vvp src/full_adder.v src/rca_16bit.v tb/rca_16bit_tb.v && vvp sim.vvp
```

### Expected simulation output

Each testbench applies all relevant input combinations and displays input and output values on the terminal. A `.vcd` waveform file is generated and can be opened in GTKWave.

Example output for 4-bit RCA:

```
Time=0    c=0 a=0000 b=0000 sum=0000 carry=0
Time=10   c=0 a=0100 b=0011 sum=0111 carry=0
Time=20   c=0 a=1001 b=0110 sum=1111 carry=0
Time=30   c=0 a=1111 b=0001 sum=0000 carry=1
Time=40   c=1 a=0111 b=0111 sum=1111 carry=0
Time=50   c=1 a=1111 b=1111 sum=1111 carry=1
```

---

## Waveforms and Simulation Results

### Half Adder
![Half Adder Waveform](sim/half_adder_waveform.png)
![Half Adder Terminal Output](sim/half_adder_terminal.png)

### Full Adder
![Full Adder Waveform](sim/full_adder_waveform.png)
![Full Adder Terminal Output](sim/full_adder_terminal.png)

### Half Subtractor
![Half Subtractor Waveform](sim/half_sub_waveform.png)
![Half Subtractor Terminal Output](sim/half_sub_terminal.png)

### Full Subtractor
![Full Subtractor Waveform](sim/full_sub_waveform.png)
![Full Subtractor Terminal Output](sim/full_sub_terminal.png)

### 2-bit Ripple Carry Adder
![2-bit RCA Waveform](sim/rca_2bit_waveform.png)
![2-bit RCA Terminal Output](sim/rca_2bit_terminal.png)

### 4-bit Ripple Carry Adder
![4-bit RCA Waveform](sim/rca_4bit_waveform.png)
![4-bit RCA Terminal Output](sim/rca_4bit_terminal.png)

### 16-bit Ripple Carry Adder
![16-bit RCA Waveform](sim/rca_16bit_waveform.png)
![16-bit RCA Terminal Output](sim/rca_16bit_terminal.png)

---

## Concepts Covered

### Verilog
- `wire` and `reg` data types — when to use each
- `assign` statement — continuous assignment for combinational logic
- Module instantiation — structural modelling by chaining sub-modules
- `always @(*)` block — behavioural combinational logic
- Multi-bit buses — `[3:0]`, `[15:0]` notation
- Concatenation operator `{}` — grouping bits
- `$monitor` — automatic display on signal change
- `$dumpfile` and `$dumpvars` — waveform generation
- `#delay` — time control in testbenches

### Digital Design
- Half Adder — foundation of all binary arithmetic
- Full Adder — extends Half Adder with carry input
- Two's complement subtraction — A - B = A + (~B + 1)
- Carry propagation in Ripple Carry Adder — why it is slow
- Carry lookahead concept — how to overcome RCA delay
- Overflow detection — signed vs unsigned overflow
- Structural modelling — building complex circuits from simple ones
- Hierarchy — how the Full Adder is reused inside every RCA

---

## Tools Used

| Tool | Version | Purpose |
|------|---------|---------|
| Icarus Verilog | 0.9.7 / 1.1 | Compilation and simulation |
| GTKWave | 3.3.x | Waveform viewing and verification |
| VS Code | Latest | Code editor |
| Git | Latest | Version control |

---

## What's Next

This repository is **Step 2** in an 8-step roadmap building up to a complete 16-bit pipelined RISC processor.

| Step | Repository | Status |
|------|-----------|--------|
| 1 | `01-basic-logic-gates` | ✅ Complete |
| 2 | `02-combinational-circuits` | 🔄 In progress |
| 3 | `03-sequential-circuits` | ⏳ Upcoming |
| 4 | `04-finite-state-machines` | ⏳ Upcoming |
| 5 | `05-alu-16bit` | ⏳ Upcoming |
| 6 | `06-processor-components` | ⏳ Upcoming |
| 7 | `07-risc16-pipelined-processor` | ⏳ Upcoming |
| 8 | `08-protocols-and-interfaces` | ⏳ Upcoming |

**Remaining circuits in this repo:**
- [ ] Adder-Subtractor (16-bit)
- [ ] 2:1 MUX and 4:1 MUX
- [ ] 3:8 Decoder
- [ ] 8:3 Priority Encoder
- [ ] 16-bit Magnitude Comparator
- [ ] **16-bit ALU** ← repo capstone

> The 16-bit RCA built here becomes the core arithmetic unit inside the 16-bit ALU, which becomes the Execute (EX) stage of the pipelined RISC processor.

---

## Author

**Abhi** — B.Tech ECE, 3rd Year
Building a complete VLSI design portfolio from logic gates to a pipelined processor.

[![GitHub](https://img.shields.io/badge/GitHub-abhichandra586-181717?style=flat&logo=github)](https://github.com/abhichandra586)

---

*Part of an 8-repository VLSI learning roadmap — from AND gate to 16-bit pipelined RISC processor.*
