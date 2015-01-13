function [xt, yt] = generateData(t_max)
% Generates the data for our experiment, as instructed at pages 31-32, in
% the paper.
% Input:
% t_max     --  a value, telling us how many timesteps the recursive algorithm
%               will work.
% Output:
% xt        --  the true states. A vector with dimensions 1x(t_max+1).
% yt        --  the measurements. A vector with dimensions 1xt_max.

phi1 = 0.5;
phi2 = 0.2;
phi3 = 0.5;
omega = 4*exp(1)-2;

x0 = 1; % TODO : change to random value.
xt = x0;
yt = []; % I think yt is to start from t=1. /Kelly 2015-01-13, from reading about the Markov process at Wikipedia and thought about it.
%yt = [getCurrentY(xt(1), 0, phi2, phi3, normrnd(0,0.00001))]; % Old
%version, when we thought the dim of yt also was to be 1x(t_max+1).

for t=1:t_max
    current_x = getCurrentX(xt(t), t, phi1, omega, gamrnd(3,2));
    xt = [xt; current_x];
    
    current_y = getCurrentY(xt(t), t, phi2, phi3, normrnd(0,0.00001));
    yt = [yt; current_y];
end  

end

