% angleAxis2Rot Convert an angle-axis rotation to a rotation matrix
%
%   [R] = angleAxis2Rot(k, theta)
%
%   R = rotation matrix (3x3 matrix)
%
%   k = rotation axis (unit 3x1 vector)
%   theta = angle (rad)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [R] = angleAxis2Rot(k, theta)
    R = cos(theta) * eye(3) + (1 - cos(theta)) * k * k' + sin(theta) * cpMap(k);
end