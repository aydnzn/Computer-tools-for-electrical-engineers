function [ A ] = C_A_matrices( B,G,D )
% the C matrix is the transpose of the B matrix
% The A matrix is developed as the combination of 4 smaller matrices, G, B,
% C, and D which are already constructed.
C = transpose(B);
A = [ G, B; C,D ];

end

