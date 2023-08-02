function [ G,D,B ] = G_matrix_part1( n,k,myCell,d)
% %Task 7 G matrix 
%The D matrix is an kxk matrix composed entirely of zeros.
%The G matrix is an nxn matrix formed in two steps.
%The B matrix is an nxk matrix with only 0, 1 and -1 elements.
%Each location in the matrix corresponds
%to a particular voltage source or a node. 
D = zeros(k,k);
G = zeros(n,n);
B = zeros(n,k);
% how to create the G matrix----1st part-diagonal part
for x = 1:n
    i=1;
    % i =node number (here)
    % for each node number make 'd' loop to determine which resistors are
    % connected to i'th node
for i = 1:d
    % d = dimension
    if  findstr(myCell{1,1}{i}, 'R')==1
        %for resistors
        
        if myCell{1,2}(i)==x 
            % if node number = a then G(a,a) will be 1/(Resistor connected
            % to a) Here I check 'from node' part.
            G(x,x)=(1./double(myCell{1,4}(i)))+G(x,x);
        end
          if myCell{1,3}(i)==x  
              % Here I check 'to node' part.
            G(x,x)=(1./double(myCell{1,4}(i)))+G(x,x);
          end
    end
end
end
% diagonal part is done

end

