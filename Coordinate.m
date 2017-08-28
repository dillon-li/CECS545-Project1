% Class to contain coordinates for the cities
classdef Coordinate
    properties
        x
        y
    end
    methods
        function obj = Coordinate(a,b)
            obj.x = single(a);
            obj.y = single(b);
        end
    end
end