﻿# MIPS32_processor_simple

## Overview
This repository contains a Verilog implementation of a 5-stage pipelined MIPS32 processor, synthesized and tested in Xilinx Vivado. The design includes all five classic pipeline stages: Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), and Write Back (WB).

## Features
- 32-bit MIPS32 architecture implementation
- 5-stage pipeline:
  - Instruction Fetch (IF)
  - Instruction Decode (ID)
  - Execute (EX)
  - Memory Access (MEM)
  - Write Back (WB)
- Hazard detection and forwarding unit
- Support for basic MIPS instructions (R-type, I-type, J-type)
- Separate instruction and data memory
- Testbench for functional verification

## Supported Instructions
The processor supports the following MIPS instructions:
- **Arithmetic**: ADD, SUB, ADDI, AND, OR, XOR, NOR, SLT, SLTI
- **Memory**: LW, SW
- **Branch**: BEQ, BNE
- **Jump**: J, JR, JAL

## Getting Started

### Prerequisites
- Xilinx Vivado (tested with 2020.2)
- Verilog simulator (Vivado's built-in xsim or ModelSim)

### Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/mips32-pipeline.git
   cd mips32-pipeline
   ```

2. Open the project in Vivado:
   ```bash
   vivado -source scripts/build.tcl
   ```

### Simulation
1. Open the project in Vivado
2. Run the testbench:
   - In the Flow Navigator, select "Simulation" → "Run Simulation" → "Behavioral Simulation"
   - The testbench will execute a series of test programs to verify processor functionality

### Synthesis
1. In Vivado:
   - Select "Synthesis" in the Flow Navigator
   - Click "Run Synthesis"
2. After synthesis completes, you can proceed to implementation and bitstream generation if targeting an FPGA

## Testbench
The included testbench verifies:
- Basic arithmetic operations
- Memory load/store operations
- Branch and jump instructions
- Pipeline hazards and forwarding
- Data dependencies between instructions

To add your own test programs:
1. Modify the instruction memory initialization in `imem.v`
2. Update expected results in the testbench `mips_tb.v`

## Pipeline Hazards Handling
The processor implements:
- **Data forwarding**: For EX/MEM and MEM/WB to EX dependencies
- **Stall detection**: For load-use hazards
- **Branch prediction**: Simple "always not taken" approach with flushing

## Performance
The design achieves:
- 1 CPI (Cycles Per Instruction) for ideal cases
- Pipeline stalls only for unavoidable hazards
- Maximum clock frequency dependent on target FPGA (reported after synthesis)

## Future Work
- Add support for more MIPS instructions
- Implement caches for instruction and data memory
- Add exception handling
- Optimize for higher clock frequencies

## Contributors
- [Your Name] - Initial work

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments
- Based on the classic MIPS architecture
- Inspired by Patterson and Hennessy's "Computer Organization and Design"
