% rot2RPY Compute the sets of roll, pitch, yaw angles from a rotation matrix
%
%   [roll, pitch, yaw] = rot2RPY(R)
%
%   roll = roll angles (rad, 2x1 vector)
%   pitch = pitch angles (rad, 2x1 vector)
%   yaw = yaw angles (rad, 2x1 vector)
%
%   R = rotation matrix (3x3 matrix)
%
%   Kevin Barnard
%   10827168
%   MEGN 544
%   9/7/2020

function [roll, pitch, yaw] = rot2RPY(R)
    cos_pitch = sqrt(R(1,1)^2 + R(2,1)^2);
    pitch = [
        atan2(-R(3,1), cos_pitch)
        atan2(-R(3,1), -cos_pitch)
    ];
    
    if pitch(1) == pi/2 || pitch(2) == pi/2
        roll = atan2(R(1,2), R(2,2)) * ones(2,1);
        pitch = pi/2 * ones(2,1);
        yaw = zeros(2,1);
    else
        roll = [
            atan2(R(3,2) / cos_pitch, R(3,3) / cos_pitch)
            atan2(R(3,2) / -cos_pitch, R(3,3) / -cos_pitch)
        ];
        yaw = [
            atan2(R(2,1) / cos_pitch, R(1,1) / cos_pitch)
            atan2(R(2,1) / -cos_pitch, R(1,1) / -cos_pitch)
        ];
    end
end

