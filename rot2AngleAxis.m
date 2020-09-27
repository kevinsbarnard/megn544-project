% rot2AngleAxis Convert a rotation matrix to an angle-axis rotation
%
%   [k, theta] = rot2AngleAxis(R)
%
%   k = rotation axis (unit 3x1 vector)
%   theta = angle (rad)
%
%   R = rotation matrix (3x3 matrix)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [k, theta] = rot2AngleAxis(R)
    r1 = R(1,1);
    r2 = R(2,2);
    r3 = R(3,3);

    cos_theta = (r1 + r2 + r3 - 1) / 2;
    axis_vec = [R(3,2)-R(2,3) R(1,3)-R(3,1) R(2,1)-R(1,2)]';
    theta = atan2(norm(axis_vec)/2, cos_theta);
    
    if abs(theta - pi) < 1e-12
        S = (R + eye(3)) / 2;
        k1 = sqrt(S(1,1));
        k2 = S(1,2)/k1;
        k3 = S(1,3)/k1;
        k = [k1 k2 k3]';
    else
        k = axis_vec ./ (2 * sin(theta));
    end
end