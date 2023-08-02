function [ B ] = B_matrix( k,K,B )
% B matrix
for i = 1:k
    % increasing loop of voltage sources
    %K is the sorted voltage source matrix which has 3 column from node,to node
%and value part. It is calculated already
 % If the positive terminal of the ith voltage source (which is K(i,2)) 
 %is connected to node k, then the element (K(i,1),i) in the B matrix is a 1. 
    B(K(i,2),i)=1;
    if K(i,1) ~= 0
        %if to from part  ~= 0
       % the element (K(i,1),i) in the B matrix is a -1.
    B(K(i,1),i)=-1;
    end
end

end

