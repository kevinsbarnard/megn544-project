% rpy2Rot Convert a roll, pitch, yaw to a rotation matrix
%
%   [R] = rpy2Rot(roll, pitch, yaw)
%
%   R = rotation matrix
%
%   roll = roll angle (rad)
%   pitch = pitch angle (rad)
%   yaw = yaw angle (rad)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [R] = rpy2Rot(roll, pitch, yaw)
    R = rotZ(yaw)*rotY(pitch)*rotX(roll);
end