% Simple Distance function
function [ distance ] = Distance( coord1, coord2 )

distance = sqrt((coord2.x - coord1.x)^2 + (coord2.y - coord1.y)^2);

end

