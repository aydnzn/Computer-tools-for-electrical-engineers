# Project1.a Circuit Simulator - MATLAB-based

This project implements a MATLAB-based circuit simulator capable of simulating circuits with Resistors, Independent voltage sources, and Independent current sources.

## Project Overview
This circuit simulator reads a text input file representing the circuit and determines the node voltages using the algorithm for Modified Node Analysis.

## Rules for Text File
- Each element is entered in a single row.
- The first column is the unique identifier for the element whose first letter indicates the type of the element: R, I, or V, and the rest is an integer. The second and third columns denote the node numbers of the element. The last column denotes the value of the element in Ohms, Amperes, or Volts.
- NodeNumber@SecondColumn < NodeNumber@ThirdColumn.
- Positive value for the current source means that the current is entering the Node@ThirdColumn.
- Positive value for the voltage source means: Voltage of Node@SecondColumn < Voltage of Node@ThirdColumn.
- Example: See [Project Description](Project1a.pdf)


## Implementation
The program prompts the user for the name of the text file and displays the solution (i.e., the node voltages) on the screen. The program is modular and includes a function that takes the file name as an input argument and returns the node voltages.

## Submission
The files can be found in the repository:
- [ProjectDescription](Project1a.pdf)
- [MainScript](myscript.m) : This script implements a MATLAB-based circuit simulator. It takes a text file as input, which represents a circuit, and returns the node voltages as output.
- [Example Text File](tcct1.txt) : The input file should be a text file with each element of the circuit represented on a single line.

