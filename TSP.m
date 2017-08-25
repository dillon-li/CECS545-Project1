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

% Find permutations
disp('Starting Permutations');
subroutes = perms(toPermute);
disp('Permutations Done');

% Append starting city to start and end of array
routes(1:size(subroutes,1),1) = coords(1);
routes(:,2:(size(subroutes,2)+1)) = subroutes;
routes(:,size(subroutes,2)+2) = coords(1);
paths = routes;

dist_totals = zeros(size(routes,1),1);

% Calculate distances for each route
for j = 1:size(routes,1)
    dist = 0;
    for k = 1:(size(routes,2)-1)
        coord1 = routes(j,k);
        coord2 = routes(j,k+1);
        dist = dist + Distance(coord1, coord2);
    end
    dist_totals(j) = dist;
end

% Get path with shortest distance
[~, win_index] = min(dist_totals);
win = routes(win_index, :);

% Plot points and winning path
PlotPoints(coords, win);

toc;

end

