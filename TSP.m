function [ dist_totals, paths ] = TSP( filename )
% Main Traveling Salesman Problem
% Brute forces to find every route possible

% Returns distance totals as a n x 1 matrix along with another n x m matrix
% of the order of coordinates passed, where n is indexed the same for each.

tic;
% Parse coordinates from sample .tsp file
coords = ReadFromSample(filename);

% Grab coordinates aside from first city to permute (starting city will
% remain the same)
toPermute = coords(2:end);

routes(1:factorial(size(coords,2)-1),1) = coords(1);
% Find permutations
disp('Starting Permutations');
routes(:,2:size(coords,2)) = perms(toPermute);
disp('Permutations Done');

dist_totals = zeros(size(routes,1),1);

% Calculate distances for each route
for j = 1:size(routes,1)
    dist = 0;
    for k = 1:(size(routes,2))
        if k == size(routes,2)
            coord1 = routes(j,k);
            coord2 = routes(j,1);
        else
            coord1 = routes(j,k);
            coord2 = routes(j,k+1);
        end
        dist = dist + Distance(coord1, coord2);
    end
    dist_totals(j) = dist;
end

% Get path with shortest distance
[~, win_index] = min(dist_totals);
clearvars dist_totals
win = routes(win_index, :);

% Plot points and winning path
PlotPoints(coords, win);

toc;

end

