% rot2Quat Convert a rotation matrix to a quaternion
%
%   [q] = rot2Quat(R)
%
%   q = quaternion (4x1 vector)
%
%   R = rotation matrix (3x3 matrix)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [q] = rot2Quat(R)
    r1 = R(1,1);
    r2 = R(2,2);
    r3 = R(3,3);
    tr = r1 + r2 + r3;

    if tr > eps
        q0 = sqrt((1 + tr) / 4);
        q1 = (R(3,2) - R(2,3)) / 4;
        q2 = (R(1,3) - R(3,1)) / 4;
        q3 = (R(2,1) - R(1,2)) / 4;
    elseif r1 > r2 && r1 > r3
        q1 = sqrt((1 + r1 - r2 - r3) / 4);
        q0 = (R(3,2) - R(2,3))/(4*q1);
        q2 = (R(1,2) + R(2,1))/(4*q1);
        q3 = (R(1,3) + R(3,1))/(4*q1);
    elseif r2 > r1 && r2 > r3
        q2 = sqrt((1 - r1 + r2 - r3) / 4);
        q0 = (R(1,3) - R(3,1))/(4*q2);
        q1 = (R(1,2) + R(2,1))/(4*q2);
        q3 = (R(2,3) + R(3,2))/(4*q2);
    else
        q3 = sqrt((1 - r1 - r2 + r3) / 4);
        q0 = (R(2,1) - R(1,2))/(4*q3);
        q1 = (R(1,3) + R(3,1))/(4*q3);
        q2 = (R(2,3) + R(3,2))/(4*q3);
    end
    
    q = [q0 q1 q2 q3]';
end