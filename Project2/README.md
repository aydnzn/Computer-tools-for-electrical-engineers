# Project 2 : ANALOG COMPUTER

This repository contains the submission for Project-2 of the course Computer Tools for Electrical Engineers.

## Project Description
This project involves the design of an analog computer using PSPICE to solve a specific differential equation. An analog computer is a form of computer that leverages the continuously changeable aspects of physical phenomena to model the problem being solved. Electronic analog computers typically use OPAMPs, voltage sources, and oscilloscopes to solve differential equations modeling a physical system.

## Assignment
The task is to solve the following differential equation:

\```
d^2x/dt^2 + 2 dx/dt + 5x = 1; x(0) = 0.1; x'(0) = 0.05
\```

The assignment is divided into three parts:
1. Building a Simulink model including gain, summer, and integrator elements to solve eqn. See [Task 1](/Project2/Task1_simulink/)
2. Designing an OPAMP circuit using PSPICE that includes all the elements present in the Simulink model. The OPAMP(s) should be implemented using voltage controlled voltage sources with the following values: Rin=1 MΩ, Rout=100 Ω, gain=10^4 V/V. See [Task 2](/Project2/Task2_circuit_with_opamps_usingVCVS/)
3. Replacing the OPAMP(s) with AD8608 from Analog Devices. The SPICE model of AD8608 can be obtained from http://www.analog.com. See [Task 3](/Project2/Task3_useAD8608/)

Visit [Task 1](/Project2/Task1_simulink/) [Task 2](/Project2/Task2_circuit_with_opamps_usingVCVS/) and [Task 3](/Project2/Task3_useAD8608/) to see the screenshots of the Simulink model and time trace of variable x, schematics of the PSPICE design and its time trace of variable x, and a [discussion](Discussion.pdf) regarding any discrepancies between the outputs of the Simulink and PSPICE models.

## Discussion

There are some discrepancies between the outputs of the Simulink and PSPICE models, primarily due to the behavior of capacitors in each system. These differences are discussed in detail in the [report](Discussion.pdf).
