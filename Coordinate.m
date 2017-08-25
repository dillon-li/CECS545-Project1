% Class to contain coordinates for the cities
classdef Coordinate
    properties
        name
        x
        y
    end
    methods
        function obj = Coordinate(name,a,b)
            obj.name = name;
            obj.x = a;
            obj.y = b;
        end
    end
end