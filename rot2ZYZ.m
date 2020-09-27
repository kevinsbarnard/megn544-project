function [psi,theta,phi] = rot2ZYZ(R)
    cos_theta = R(3,3);
    theta = atan2(sqrt(R(3,1)^2 + R(3,2)^2), cos_theta);
    sin_theta = sin(theta);
    if theta == 0
        psi = atan2(R(3,2), -R(3,1));
        phi = atan2(R(2,3), R(1,3));
    else
        psi = atan2(R(3,2)/sin_theta, -R(3,1)/sin_theta);
        phi = atan2(R(2,3)/sin_theta, R(1,3)/sin_theta);
    end
end

