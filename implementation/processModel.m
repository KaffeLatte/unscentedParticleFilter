function [x_current] = processModel(x_previous, v_previous, t_previous)
% Description of the function
% Input:
% x_previous -- row-vector with the previous x-values
% v_previous -- row-vector with the previous v-values (process noise)
% t_previous -- the previous timestep
% Output:
% x_current -- row-vector with the current x-values

% Predefine process parameters
omega = 4*exp(1)-2;
phi1 = 0.5;

% Define helping parameters
n_part = size(x_previous,2);
sin_term = sin(omega*pi*t_previous);

x_current = ones(1,n_part) + repmat(sin_term,1,n_part) + phi1.*x_previous + v_previous;

end

