function [ myCell ] = readfile(filename)
% %Task1 reads the file
% create a 1x4 cell array in the form [dx1 cell](with strings) dx1 vector with int. dx1 vector with int. dx1 vector with int.  
read=fopen(filename,'r');
myCell=textscan(read, '%s %d %d %d');

end

