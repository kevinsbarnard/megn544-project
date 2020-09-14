% twist2Transform Convert a twist to a homogeneous transformation matrix
%
%   [T] = twist2Transform(t)
%
%   T = homogeneous transformation matrix
%
%   t = twist (v, Omega; 6x1 vector)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [T] = twist2Transform(t)
    v = t(1:3);
    Omega = t(4:6);
    
    if Omega == 0
        R = eye(3);
        d = v;
    else
        theta = norm(Omega);
        k = Omega/theta;
        R = angleAxis2Rot(k, theta);
        d = ((eye(3) - R)*cpMap(k) + Omega*k')*v;
    end
    
    T = [R d; 0 0 0 1];
end