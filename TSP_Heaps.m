function [ distMin, winningPath ] = TSP_Heaps( filename )
% Main Traveling Salesman Problem
% Brute forces to find every route possible

% Returns distance totals as a n x 1 matrix along with another n x m matrix
% of the order of coordinates passed, where n is indexed the same for each.

tic;
% Parse coordinates from sample .tsp file
coords = ReadFromSample(filename);

% Try making single matrix instead of class matrix
for i = 1:size(coords,2)
    x(i) = coords(i).x;
    y(i) = coords(i).y;
end

% Create indexes for permutations for everything aside from the first city
for i = 2:size(coords,2)
    toPermute(i-1) = i;
end

% Instead of storing all coordinates, do permuations of the index
% Find permutation indices
disp('Starting Permutations');
% subroutes = single(perms(toPermute));

% Arbitrarily large number to begin with
distMin = inf(1);

% Implement Heap's Algorithm
c = ones(size(toPermute,2),1);
i = 1;
% Calculate distances for each route as they are found 
while i < size(toPermute,2)+1
    % Loop througuh permutation to calculate distances
    dist = 0;
    for k = 1:size(toPermute,2)+1
        if k == 1
            x1 = x(1); y1 = y(1);
            x2 = x(toPermute(k)); y2 = y(toPermute(k));
        elseif k == size(toPermute,2)+1
            x1 = x(toPermute(k-1)); y1 = y(toPermute(k-1));
            x2 = x(1); y2 = y(1);
        else
            x1 = x(toPermute(k-1)); y1 = y(toPermute(k-1));
            x2 = x(toPermute(k)); y2 = y(toPermute(k));
        end             
        dist = dist + Distance(x1,y1,x2,y2);
    end
    % Replace lowest distance if better path found
    if dist < distMin
        distMin = dist;
        minPerm = toPermute;
    end
    % Next permutation using Heap's Algorithm
    if c(i) < i
        if mod(i+1,2) == 0
            temp = toPermute(1);
            toPermute(1) = toPermute(i);
            toPermute(i) = temp;
        else
            temp = toPermute(c(i));
            toPermute(c(i)) = toPermute(i);
            toPermute(i) = temp;
        end
        % toPermute is now in format of next permutation
        c(i) = c(i) + 1;
        i = 1;
    else
        c(i) = 1;
        i = i + 1;
    end

end

% Use minimum distance and path indices to create path for plotting
pathIndices = [1 minPerm];
for i = 1:size(pathIndices,2)
    winningPath(i) = coords(pathIndices(i));
end

disp('Permutations Done');

% Slap starting city on the end
winningPath = [winningPath coords(1)];

% Append starting city to end
pathIndices = [pathIndices 1];


time = toc; % Time after distance and permutations calculated

% Write winning path to console
displayWin(pathIndices, winningPath, distMin, time);

% Plot points and winning path
PlotPoints(coords, winningPath);

end

