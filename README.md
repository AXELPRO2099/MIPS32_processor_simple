# MIPS32 5-Stage Pipelined Processor (Simple Implementation)

## Overview
A simplified Verilog implementation of a 5-stage pipelined MIPS32 processor, designed for clarity and educational purposes. Synthesizable in Xilinx Vivado with included testbench for verification.

## Key Features
- **Clean 5-stage pipeline**: IF, ID, EX, MEM, WB
- **Basic hazard handling**: Forwarding and stall logic
- **Essential MIPS instructions**: Supports core R/I/J-type ops
- **Simple memory interface**: Separate instruction/data memory
- **Lightweight design**: < 1K lines of Verilog


## Quick Start
### 1. Clone & Open in Vivado
```bash
git clone https://github.com/yourusername/MIPS32_processor_simple.git
vivado -source setup.tcl  # Creates Vivado project
```

### 2. Run Testbench
```tcl
# In Vivado TCL console:
launch_simulation -script_mode
run_all  # Executes sample test programs
```

### 3. Sample Output
```
[TEST] ADD/SUB Test: PASS
[TEST] LW/SW Test: PASS
[TEST] Branch Test: PASS
Pipeline Stalls: 3
CPI: 1.07
```

## Instruction Support
| Type        | Instructions              |
|-------------|---------------------------|
| Arithmetic  | ADD, SUB, ADDI, SLT       |
| Logical     | AND, OR, XOR, NOR         |
| Memory      | LW, SW                    |
| Control     | BEQ, BNE, J, JR, JAL      |

## Educational Focus
This implementation emphasizes:
- Clear pipeline stage boundaries
- Minimal external dependencies
- Commented hazard handling logic
- Step-by-step testbench verification

## Limitations
- No caches or MMU
- Basic branch prediction (always not taken)
- No exception handling

## Suggested Improvements
1. Add more test programs
2. Implement cache models
3. Add performance counters
4. Support more instructions

## License
MIT License - Free for academic/educational use
