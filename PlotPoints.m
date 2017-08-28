function [] = PlotPoints( coords, winning_path )
% Plot points given a list of coordinates
% Also plots lines showing the shortest path

for i = 1:size(coords,2)
    x(i) = coords(i).x;
    y(i) = coords(i).y;
end

% Plot points
figure;
plot(x(1),y(1), '*'); % Start
hold on; % Keep starting point marker
plot(x(2:end),y(2:end),'o');
plotTitle = ['TSP: ' char(string(size(coords,2))) ' cities'];
title(plotTitle);

for i = 1:(size(winning_path,2))
    if i == size(winning_path,2)
        coord1 = winning_path(i);
        coord2 = winning_path(1);
    else
        coord1 = winning_path(i);
        coord2 = winning_path(i+1);
    end
    xcoords = [coord1.x coord2.x];
    ycoords = [coord1.y coord2.y];
    line(xcoords, ycoords);
end

end

