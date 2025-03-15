# SIMD-Booth-Multiplier

Overview:

This project implements a SIMD Booth Multiplier using Radix-2 Booth Encoding for efficient floating-point mantissa multiplication in Verilog. It serves as a crucial module within a larger multiple precision floating-point multiplier, specifically handling the mantissa multiplication stage. By leveraging Booth encoding, the design minimizes the number of partial products, improving computational speed and efficiency. This approach is particularly useful for high-speed arithmetic operations in DSPs, AI accelerators, and FPGA-based computing.

Features

Radix-2 Booth Encoding: Reduces the number of partial products for faster and more efficient multiplication.

SIMD-Based Architecture: Supports parallel processing to enhance performance in vectorized computations.

Integration in Floating-Point Multiplier: Designed as a submodule for IEEE-754 floating-point multiplication, focusing on the mantissa operation.

Hardware-Efficient Design: Optimized for FPGA implementation with minimal resource utilization.
