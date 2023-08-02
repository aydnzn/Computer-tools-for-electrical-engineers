function [ n ] = find_node( myCell )
% Task2-Determine the number of nodes(n) because NodeNumber@SecondColumn<
%NodeNumber@ThirdColumn so easily I took the maximum of third column
n=max(myCell{1,3});


end

