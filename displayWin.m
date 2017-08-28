function [ ] = displayWin( pathIndices, winningPath, distMin, time )
% Prints the winning path to the console
disp('Winning Path is as follows:');

% Make Deliverables folder if it doesn't exist
if exist('Deliverables') ~= 7
    mkdir('Deliverables');
end

% Open text file to print output to
filename = ['Deliverables/output_' char(string(size(winningPath,2)-1)) 'cities.txt'];
f = fopen(filename, 'wt');

for i = 1:size(winningPath,2)
    xString = char(string(winningPath(i).x));
    yString = char(string(winningPath(i).y));
    cityNum = char(string(pathIndices(i)));
    coordinate = ['(' xString ',' yString ')'];
    line = [char(string(i)) '.' coordinate '(City no. ' cityNum ')'];
    disp(line);
    fprintf(f, line);
    fprintf(f, '\n');
end

distString = ['Distance of shortest path: ' char(string(distMin))];
disp(distString); 
fprintf(f, [distString '\n']);

timeString = ['Program took ' char(string(time)) ' seconds.'];
disp(timeString);
fprintf(f, timeString);

fclose(f);

end

