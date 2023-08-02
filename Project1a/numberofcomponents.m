function [ d ] = numberofcomponents( myCell )
% Task3-Determine the number of components
% returns a row vector whose elements contain the length of the corresponding dimension of A. 
% For example, if A is a 3-by-4 matrix, then size(A) returns the vector [3 4].
dimension_myCell=size(myCell{1,1});
d=dimension_myCell(1);

end

