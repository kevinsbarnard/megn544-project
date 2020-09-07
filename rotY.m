% rotY Compute the rotation matrix for a rotation about the y axis
%
%   [R] = rotY(theta)
%
%   R = rotation matrix
%
%   theta = angle (rad)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [R] = rotY(theta)
    R = [
        cos(theta) 0 sin(theta)
        0 1 0
        -sin(theta) 0 cos(theta)
    ];
end