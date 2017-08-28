function [ distMin, winningPath ] = TSP( filename )
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
subroutes = single(perms(toPermute));
disp('Permutations Done');

% Arbitrarily large number to begin with
distMin = inf(1);

% Calculate distances for each route
for j = 1:size(subroutes,1)
    dist = 0;
    for k = 1:(size(subroutes,2)+1)
        if k == 1
            x1 = x(1); y1 = y(1);
            x2 = x(subroutes(j,1)); y2 = y(subroutes(j,1));
            % coord1 = coords(1);
            % coord2 = coords(subroutes(j,1));
        elseif k == size(subroutes,2)+1
            x1 = x(subroutes(j,k-1)); y1 = y(subroutes(j,k-1));
            x2 = x(1); y2 = y(1);
            % coord1 = coords(subroutes(j,k-1));
            % coord2 = coords(1);
        else
            x1 = x(subroutes(j,k-1)); y1 = y(subroutes(j,k-1));
            x2 = x(subroutes(j,k)); y2 = y(subroutes(j,k));
            % coord1 = coords(subroutes(j,k-1));
            % coord2 = coords(subroutes(j,k));
        end             
        dist = dist + Distance(x1,y1,x2,y2);
    end
    % Replace lowest distance if better path found
    if dist < distMin
        distMin = dist;
        minPerm = subroutes(j,:);
    end
end

% Use minimum distance and path indices to create path for plotting
pathIndices = [1 minPerm];
for i = 1:size(pathIndices,2)
    winningPath(i) = coords(pathIndices(i));
end

% Slap starting city on the end
winningPath = [winningPath coords(1)];

% Append starting city to end
pathIndices = [pathIndices 1];
% Write winning path to console
displayWin(pathIndices, winningPath, distMin);

% Plot points and winning path
PlotPoints(coords, winningPath);

toc;

end

