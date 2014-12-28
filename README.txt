ALU 

Designed by Chi ZHOU

1) This project is written by VHDL structural style. Only basic gates are allowed to use behavioral style.

2) All files with name containing "testbench" are the simulation files.

3) All .png files are the screen-shots of simulation.

4) Control Signals:
ctrl0	ctrl1	ctrl2	ctrl3	operation
  0	  	  0	  	  0	  	  0	  	  and
  0	  	  1 	  	  0 	  	  0	  	  add
  1	  	  0	  	  0	  	  0	  	  or
  1	  	  1	  	  0 	  	  0 	  	  sub
  x	  	  x	  	  1	  	  0	  	  sll
  x	  	  x	  	  1	  	  1	  	  sltu
  x	  	  x	  	  0	  	  1	  	  slt	