function [ K,Z ] = create_Z_matrix( n,k,myCell,d )
% Task6- create Z matrix
% the top n elements represent the algaebric sum of currents through nodes
% for each node
% the bottom k elements represent the k independent voltage sources in the circuit

y = zeros(n,1);
e = zeros(k,1);

for i = 1:d
   if findstr(myCell{1,1}{i}, 'I')==1
       
       % call l the third column of I (the 'to node' part)
       l = myCell{1,3}(i);
       
        % call m the second column of I (the 'from node' part)
       m = myCell{1,2}(i);
       
       % add up the term by term the current values entering l'th node
       y(l,1)=y(l,1)+myCell{1,4}(i);
       % if the t'from node' part is not zero we should subtract it from
       % t'th node
       if m ~= 0
           y(m,1)=y(m,1) - myCell{1,4}(i);
       end
    end
end
% we have constructed the y matrix  represent the algaebric sum of currents through nodes

s=0;
% create a new matrice to set up V values if they are mixed
% for example :
% Vo 1 3 15
% V1 1 2 23 
% V2 0 1 24
%  in this case by first voltage source in the matrix should be V2 because
%  it is closest to 0.
% new matrice has only 'from node' 'to node' 'value' parts of voltage
% sources

 newmatrice = zeros(k,3);
 
for i = 1:d
   if findstr(myCell{1,1}{i}, 'V')==1
        s=s+1;
        newmatrice(s,:)=[myCell{1,2}(i) myCell{1,3}(i) myCell{1,4}(i)];  
   end
end
%I have sorted considering the second row in other words according to 'to
%node' parts. So if the voltage source inputs are mixed, it doesn't
%matter now.
K = sortrows(newmatrice,2);
% e matrix has voltage values acoording to increasing node number.
e(:,1)=K(:,3);
% Z matrix is constructed by adding two parts.
Z=[y;e];


end

