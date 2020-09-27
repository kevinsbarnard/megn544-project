function [R] = zyz2Rot(psi, theta, phi)
    R = rotZ(phi)*rotY(theta)*rotZ(psi);
end

