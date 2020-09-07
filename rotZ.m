% rotZ Compute the rotation matrix for a rotation about the z axis
%
%   [R] = rotZ(theta)
%
%   R = rotation matrix
%
%   theta = angle (rad)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [R] = rotZ(theta)
    R = [
        cos(theta) -sin(theta) 0
        sin(theta) cos(theta) 0
        0 0 1
    ];
end
