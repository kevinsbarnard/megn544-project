% quat2Rot Convert a quaternion to a rotation matrix
%
%   [R] = quat2Rot(Q)
%
%   R = rotation matrix (3x3 matrix)
%
%   Q = quaternion (4x1 vector)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [R] = quat2Rot(Q)
    q = Q(2:4);
    R = (Q(1)^2 - q'*q)*eye(3) + 2*Q(1)*cpMap(q) + 2*(q*q');
end

