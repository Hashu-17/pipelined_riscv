Project: Pipelined RISC Processor in Verilog
=================================================

## 🧠 Overview
This project implements a **5-stage pipelined RISC processor** in Verilog. It includes instruction fetch (IF), decode (ID), execute (EX), memory access (MEM), and write-back (WB) stages. The design integrates hazard detection, data forwarding, and basic branch prediction mechanisms. An instruction tracer and hazard logger are included for deeper architectural analysis.

---

## 📁 Directory Structure
```
pipelined_risc_processor/
├── src/
│   ├── if_stage.v
│   ├── id_stage.v
│   ├── ex_stage.v
│   ├── mem_stage.v
│   ├── wb_stage.v
│   ├── hazard_unit.v
│   ├── forwarding_unit.v
│   ├── branch_predictor.v
│   ├── control_unit.v
│   ├── register_file.v
│   ├── alu.v
│   └── top.v
├── testbench/
│   ├── test_top.v
│   ├── program.mem         # Assembled machine code to run
├── tools/
│   ├── assembler.py        # Converts custom ASM to binary
│   ├── tracer.py           # Logs pipeline stages and hazards
├── docs/
│   └── architecture.md     # Design overview and diagrams
├── Makefile
├── README.md
└── .gitignore
```

---

## 🔧 Features
- **5-Stage Pipeline:** IF, ID, EX, MEM, WB
- **Hazard Detection Unit:** Stalls pipeline on RAW hazards
- **Data Forwarding Unit:** Avoids unnecessary stalls
- **Branch Predictor:** Static (always-taken) or configurable
- **Instruction Set:** Simple custom ISA with R-type, I-type, and branch instructions
- **Tracer:** Pipeline visualizer showing instruction movement and hazard triggers
- **Assembler:** Console tool to convert assembly to memory image

---

## ▶️ Getting Started
### Prerequisites
- Icarus Verilog / ModelSim / Vivado Simulator
- Python 3.x (for assembler + tracer)

### Build & Run
```bash
make run       # Compiles Verilog and runs testbench
python tools/assembler.py test.asm -o testbench/program.mem
python tools/tracer.py testbench/output.log
```

---

## ✅ Sample Output
```
Cycle 3:  ADD x1, x2, x3       (IF)
Cycle 4:  ADD x1, x2, x3       (ID)
          LW x4, 0(x1)         (IF)
Cycle 5:  ADD x1, x2, x3       (EX)
          LW x4, 0(x1)         (ID) - Hazard detected → Stalled
```

---

## 🚀 Future Improvements
- Out-of-order execution
- Support for interrupts/exceptions
- Integration with a simple compiler

---

## 📜 License
MIT License

---

> Designed to demonstrate architectural thinking, RTL design skills, and performance-oriented coding in Verilog.
