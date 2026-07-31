#include "VALU.h"
#include "verilated.h"
#include <iostream>

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    // Create an instance of the ALU
    valu top;

    // Apply inputs
    top.A = 2;
    top.B = 5;
    top.Op = 0b001;      // Use your SUB opcode

    // Evaluate the hardware
    top.eval();

    // Print outputs
    std::cout << "A = " << (int)top.A << std::endl;
    std::cout << "B = " << (int)top.B << std::endl;
    std::cout << "Result = " << (int)top.Result << std::endl;
    std::cout << "Carry = " << (int)top.Carry << std::endl;
    std::cout << "Overflow = " << (int)top.Overflow << std::endl;
    std::cout << "Zero = " << (int)top.Zero << std::endl;

    return 0;
}