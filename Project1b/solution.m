function [ X_new ] = solution( A,Z,X,n )
%solution X
% solution matrix has size (n+k,1). But my solution matrix X_new should
% have the size (n,1) because my task is only to find node voltages.
% so I make it shorter and define a new solution matrix X_new.
X = A\Z;
X_new = zeros(n,1);
for i=1:n
    X_new(i,1)=X(i,1);
end
display(X_new);

end

