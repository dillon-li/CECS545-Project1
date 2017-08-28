function [ ] = displayWin( pathIndices, winningPath, distMin )
% Prints the winning path to the console
disp('Winning Path is as follows:\n');

for i = 1:size(winningPath,2)
    xString = char(string(winningPath(i).x));
    yString = char(string(winningPath(i).y));
    cityNum = char(string(pathIndices(i)));
    coordinate = ['(' xString ',' yString ')'];
    line = [char(string(i)) '.' coordinate '(City no. ' cityNum ')'];
    disp(line);

end

