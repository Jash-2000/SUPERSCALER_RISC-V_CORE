# SUPERSCALER_RISC-V_CORE
Added an superscaler implementation of ALU that can help with parallel computation for encryption.
The main ALU supports 32 operations while the slave ALU-cluster supports only MUL and ADD operations, as per the need of the application. We have implemented Full Custom flow with custom memory design using Cadence FreePDK45

Current implementation is single-cycle. WIP for pipelined architecture...
