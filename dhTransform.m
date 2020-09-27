% dhTransform Generate a DH transform
%
%   [H] = dhTransform(a, d, alpha, theta)
%
%   H = homogeneous transformation (4x4 matrix)
%
%   a = distance along x_i axis
%   d = distance along z_{i-1} axis
%   alpha = angle about x_i axis (rad)
%   theta = angle about z_{i-1} axis (rad)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [H] = dhTransform(a, d, alpha, theta)
    d_z = [0 0 d]';
    d_x = [a 0 0]';
    
    T_z = [eye(3) d_z; 0 0 0 1];
    T_x = [eye(3) d_x; 0 0 0 1];
    T_theta = [rotZ(theta) zeros(3,1); 0 0 0 1];
    T_alpha = [rotX(alpha) zeros(3,1); 0 0 0 1];
    
    H = T_z * T_theta * T_x * T_alpha;
end