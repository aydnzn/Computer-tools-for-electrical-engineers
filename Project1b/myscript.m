clear all
prompt = 'What is the input file? \n';
filename = input(prompt,'s');
% For more information, see ('http://www.swarthmore.edu/NatSci/echeeve1/Ref/mna/MNA3.html')">the reference site</a>.
%input(prompt,'s') returns the entered text
% You should write the file name exactly. For example : tcct1.txt
myCell = readfile(filename);
% read the input file
n = find_node(myCell);
% find node number
d = numberofcomponents(myCell);
% find the number of components
k = number_of_voltage(myCell,d);
% find voltage source number
[X] = solution_matrix(n,k);
% create a solution matrix with zeros
[K,Z] = create_Z_matrix(n,k,myCell,d);
% create the Z matrix
[G,D,B]=G_matrix_part1(n,k,myCell,d);
% create G matrix part1
[G]=G_matrix_part2( d,n,G,myCell);
% create G matrix part2
[B]=B_matrix(k,K,B);
% create B matrix
[A]=C_A_matrices(B,G,D);
% create A matrix which is combination of G,B,C,D.
[X_new]=solution(A,Z,X,n);
% solve the circuit and return the value of node voltages