# Bit Checker Projects – RISC-V Assembly & SystemVerilog

This repository contains two implementations of a **10-bit binary bit checker**, written in:

- ✅ **RISC-V Assembly** (tested using [Venus RISC-V Simulator](https://venus.cs61c.org/))
- ✅ **SystemVerilog** (simulated on [EDA Playground](https://www.edaplayground.com/))

Both implementations were created for educational purposes as part of a Computer Architecture and Hardware Design course, and are conceptually linked to the final TCC proposal: a **DMA controller targeting an RV32I processor**.

---

## 📁 Repository Structure

```text
.
├── riscv/
│   └── bit_checker.asm         # Bit checker in RISC-V Assembly (Venus-compatible)
├── systemverilog/
│   ├── bit_checker.sv          # SystemVerilog module (sequential logic)
│   └── bit_checker_tb.sv       # Testbench for simulation
├── README.md
