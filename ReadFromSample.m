function [ coords ] = ReadFromSample( filename )
% Reads from data that is formatted the same way the given sample data is:
% i.e. with Name, type, ... Dimension, NODE_COORD_SECTION.
% This assumes Coordinates will begin displaying at line 8

f = fopen(filename, 'r');

% Set filepointer at line 8
for i = 1:7
    fgetl(f);
end

i = 1;
% Janky string splitting stuff to get coords
while ~feof(f)
    line = fgetl(f);
    c = strsplit(line);
    x = single(str2double(c(2)));
    y = single(str2double(c(3)));
    coords(i) = Coordinate(x,y);
    i = i + 1;
end
fclose(f);
