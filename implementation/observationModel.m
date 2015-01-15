function [current_y] = observationModel(current_x, previous_n, current_t)
%Summary of this function goes here
% Input:
% current_x --  a row-vector with the current sigma point x:s
% previous_n -- a row-vector with the previous n:s (measurement noise)
% current_t --  the current time step
% Output:
% current_y --  a row-vector with each sigma point propagated through the
%               observation model.

% Pre-defined parameters
phi2 = 0.2;
phi3 = 0.5;

n_part = size(current_x,2);

if current_t <= 30
    current_y = phi2*(current_x.^2) + previous_n;
else
    current_y = phi3*xt - 2*ones(1,n_part) + previous_n;
end


end

