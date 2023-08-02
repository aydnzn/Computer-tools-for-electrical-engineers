function [ k ] = number_of_voltage( myCell,d )
% Task4-Determine number of Voltage sources in input text
% k=number of voltage sources
% i = index
% findstr = Find string within another, longer string
% findstr returns the starting index of each such occurrence in the double array k
% so it should be 1 if there is a voltage source
k=0;
for i = 1:d
    if findstr(myCell{1,1}{i}, 'V')==1
        k = k+1;
    end
end


end

