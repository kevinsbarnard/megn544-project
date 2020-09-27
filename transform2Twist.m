% transform2Twist Convert a transformation matrix to a twist
%
%   [t] = transform2Twist(T)
%
%   t = twist (v, Omega; 6x1 vector)
%
%   T = homogeneous transformation matrix
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [t] = transform2Twist(T)
    R = T(1:3, 1:3);
    d = T(1:3, 4);
    
    [k, theta] = rot2AngleAxis(R);
    if theta == 0
        Omega = zeros(3, 1);
        v = d;
    else
        Omega = k*theta;
        v = (sin(theta)/(2*(1-cos(theta)))*eye(3) + (2*(1-cos(theta)-theta*sin(theta)))/(2*theta*(1-cos(theta)))*k*k'-0.5*cpMap(k))*d;
    end
    
    t = [v; Omega];
end