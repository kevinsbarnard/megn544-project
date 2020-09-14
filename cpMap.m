% cpMap Compute the skew-symmetric cross product map for a 3x1 vector
%
%   [X] = cpMap(w)
%
%   X = cross product map (3x3 matrix)
%
%   w = vector to map (3x1 vector)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [X] = cpMap(w)
    X = [
        0 -w(3) w(2)
        w(3) 0 -w(1)
        -w(2) w(1) 0
    ];
end