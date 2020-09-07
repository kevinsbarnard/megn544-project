% rotX Compute the rotation matrix for a rotation about the x axis
%
%   [R] = rotX(theta)
%
%   R = rotation matrix
%
%   theta = angle (rad)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [R] = rotX(theta)
    R = [
        1 0 0
        0 cos(theta) -sin(theta)
        0 sin(theta) cos(theta)
    ];
end