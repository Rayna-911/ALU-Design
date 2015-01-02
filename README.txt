ALU 

Designed by Chi ZHOU

Description:
This project is designing a 32-bit ALU. It will be part of a single-cycle processor and will handle a small portion of the MIPS instruction set. This portion of the MIPS instruction set is:

arithmetic: add, sub
logical: and, or, sll
conditional: slt, sltu


NOTE: This project has the following input/output signals:
Input: Operand A (32 bits), Operand B (32 bits), Control signals (at least 3 bits)
Output: Carryout, Overflow, Zero, Result (32 bits)


1) This project is written by VHDL structural style. Only basic gates are allowed to use behavioral style.

2) All files with name containing "testbench" are the simulation files.

3) All .png files are the screen-shots of simulation.

4) Control Signals:
ctrl0		ctrl1		ctrl2		ctrl3		operation
  0	  	  0	  	  0	  	  0	  	  and
  0	  	  1 	  	  0 	  	  0	  	  add
  1	  	  0	  	  0	  	  0	  	  or
  1	  	  1	  	  0 	  	  0 	  	  sub
  x	  	  x	  	  1	  	  0	  	  sll
  x	  	  x	  	  1	  	  1	  	  sltu
  x	  	  x	  	  0	  	  1	  	  slt	