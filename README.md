# Disasm
Machine code disassembler written in Intel x8086 assembly language as the final VU MIF Computer Architecture class project

This disassembler recognizes all Intel x8086 codes

An excel document that I made with every machine code is also provided in this repository

## Compilation
Both codes.asm and disasm.asm are required
Compiler used is TASM

Commands:
  tasm disasm.asm
  tlink disasm.obj

## Usage
disasm.exe InputComFile.COM OutputAsmFile.ASM
