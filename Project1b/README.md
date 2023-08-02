# Project1.b GUI FOR CIRCUIT SIMULATOR

## Description

This project involves creating a Graphical User Interface (GUI) for a MATLAB-based circuit simulator. The GUI is designed to:

- Load a user-selected file.
- Display the circuit elements as a table including identifier, connections, and value of each element.
- Display the circuit simulation results.
- Allow the user to modify the element values and rerun the simulation.
- Allow the user to specify a range of values for a single element and plot the voltage at a node as a function of the element's value.

## Submission
The files can be found in the repository:
- [ProjectDescription](Project1b.pdf)
- [GUI](myproject1partb.m) : This script takes care of the GUI interactions.
- [Example Text File](example.txt) : The input file should be a text file with each element of the circuit represented on a single line.

## Instructions to Run the Program

In order to run the program:

1. Clone the repository.
2. Open MATLAB.
3. Navigate to the repository's directory.
4. Run [myproject1partb.m](myproject1partb.m).

Remember to include comments in your code and provide some “help” information to guide the users.

## Code Overview

The main script [myproject1partb.m](myproject1partb.m) takes care of the GUI interactions. Functions for reading files, calculating solutions, and handling GUI events are all defined here. Callback functions are used extensively to respond to user actions.

For detailed comments and explanations on the code, please check the script files directly.

## Report

The project is structured in multiple parts, with the filename initially obtained using the uigetfile function, followed by reading the file with a function specified in part A. Post-reading, cell arrays are created and individual handles are assigned to each array. These handles are then stored, marking the end of the first callback function.

For the second callback function, the stored handles are converted into strings, making it possible to display the elements on the screen. The solution pushbutton's callback function primarily incorporates functions from part A of the project. However, it should be noted that the solution is a matrix. Thus, it is converted into a string, stored in handles.text2, and subsequently displayed.

Task four deals with user interaction, specifically the ability to modify component values. Users can select the component type ('V', 'I', or 'R') from the popup menu. Users are then prompted to enter the component number, which must be an integer, followed by the new values, also required to be integers. These values are subsequently stored in the handles.

In the saving pushbutton, a new handle, handle.data2, is created to store the new component values and identifications. Upon clicking the 'finishing modifying' button, the component type and number are concatenated to create the exact name of the component. The program then checks for identical component names between the newly stored and previously stored components in handles.data. If a match is found, the value in the older handle is updated. After all changes are executed, the updated values are stored in a text file, replacing the previous version. To prevent potential issues in subsequent function runs, all fields in handles are cleared. The new values can be verified by opening the new file and using the buttons to display and solve it.

The final task involves choosing an element type so that the node voltage can be expressed as a function of this element. All necessary values, such as minimum value, step size, maximum value, the number of node voltages to be examined, the component type, and the number, are obtained from the user and stored in handles.

The final pushbutton callback function is responsible for plotting. To avoid confusion, the handles are converted into variables. A row vector is created, beginning from the minimum value and incrementing by the specified step size in each iteration. The solution matrix is determined using functions from part A, but requires careful manipulation as the component's values change continuously. The solution is then extracted from the appropriate row of the matrix and stored. The X-axis matrix is specified at the beginning of the callback function, and the solution matrix forms the Y-axis.

This process comprises all tasks required by the GUI.