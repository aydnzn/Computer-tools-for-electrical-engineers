function [ G ] = G_matrix_part2( d,n,G,myCell )
% how to create the G matrix----2nd part-nondiagonal part
% call 'from node' part q
% call 'to node' part x
% G(x,q) negative conductance of the element connected to (x,q)
% pair
x=2;
q=1;


for x = 2:n
   i=1;
   for q=1:x-1
   for i = 1:d
        if findstr(myCell{1,1}{i}, 'R')==1
            if (myCell{1,2}(i)==q) 
              
                if (myCell{1,3}(i)==x)
                 
                G(x,q)=(-1./double(myCell{1,4}(i)))+G(x,q);
                    G(q,x)=G(x,q);
                end
            end
        end
   end
   end
   q=1;
end

end

