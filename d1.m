function [s, T] = d1()

load('points2D.mat');

% Get desired start/end points
Pi_d = [-0.01 -0.3 0.48]';
Pf_d = [0.14 -0.3 0.4]';

% Compute desired displacement vector
d_d = Pf_d - Pi_d;

% Get original start/end points
Pi_o = [points_all(1,:)'; 0];
Pf_o = [points_all(end,:)'; 0];

% Compute original displacement vector
d_o = Pf_o - Pi_o;

% Scale down original points
s = norm(d_d)/norm(d_o);
points_all_scaled = s * points_all;

Pi_s = [points_all_scaled(1,:)'; 0];
Pf_s = [points_all_scaled(end,:)'; 0];

% Rotation between xy planar points and xz points is simply swapping y and
% z axes
R = [1 0 0; 0 0 1; 0 1 0];

% Compute transformation to get from Pi_d to Pi_s
T = [R Pi_d-R*Pi_s; 0 0 0 1];

% Transform all points into desired frame
n_points = size(points_all, 1);
points_all_scaled_homogeneous = [points_all_scaled'; zeros(1, n_points); ones(1, n_points)];
points_all_d = T*points_all_scaled_homogeneous;
points_all_d = points_all_d(1:3, :);

% Compute local frames for all points
local_frames = cell(n_points, 1);
for idx = 1:n_points
    d_idx = points_all_d(:, idx);
    if idx < n_points
        dvec = points_all_d(:, idx+1) - d_idx;
        x_idx = dvec/norm(dvec); % Normalize displacement to next point to get x axis
        z_idx = [0 1 0]'; % y axis is world z unit
        y_idx = cross(z_idx, x_idx); % y = z cross x
        R_idx = [x_idx y_idx z_idx];
    else
        R_idx = local_frames{idx-1}(1:3, 1:3);
    end
    local_frames{idx} = [R_idx d_idx; 0 0 0 1];
end

local_frames_mat = cell2mat(local_frames);

xs = local_frames_mat(1:4:end, 4)';
ys = local_frames_mat(2:4:end, 4)';
zs = local_frames_mat(3:4:end, 4)';
us = [local_frames_mat(1:4:end, 1) local_frames_mat(1:4:end, 2) local_frames_mat(1:4:end, 3)]';
vs = [local_frames_mat(2:4:end, 1) local_frames_mat(2:4:end, 2) local_frames_mat(2:4:end, 3)]';
ws = [local_frames_mat(3:4:end, 1) local_frames_mat(3:4:end, 2) local_frames_mat(3:4:end, 3)]';

quiver3(xs, ys, zs, us(1,:), vs(1,:), ws(1,:), 'r')
hold on
quiver3(xs, ys, zs, us(2,:), vs(2,:), ws(2,:), 'g')
hold off
hold on
quiver3(xs, ys, zs, us(3,:), vs(3,:), ws(3,:), 'b')
hold off
title('Local Coordinate Frames for Scaled/Transformed Points')
xlabel('x')
ylabel('y')
zlabel('z')
axis equal

end