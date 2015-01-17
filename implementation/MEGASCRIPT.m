clc
clear all
% Parameters
sigma           = 1e-5;
k               = 3;
theta           = 2;
T               = 60;
P_init          = 3/4;                      %% ?
N               = 10;   %200
Q               = 2*3/4;                    %% ? 
R               = 0.1;                      %% ?
alpha           = 1;
beta            = 0;
kappa           = 2;

number_of_runs  = 2; %100

% Generate data
x0 = 1; % = abs(randn(1,1))*100;
[xt,yt] = generateData(T, x0); % dim(xt) = 61x1, dim(yt) = 60x1

% Initialization
x0 = ones(T, N);
P0 = P_init * ones(T, N);
x_mean = ones(T, 1);
x_predict = ones(T, N);
P_predict = ones(T, N);
y_predict = ones(T, N);
weights = ones(T, N) ./ N;

MSE = zeros(1,number_of_runs);

for run=1:number_of_runs

    for t = 2:T
    % Prediction step



    % Evaluate importance weights

    % Selection step
    end
end    
% Plot generated data
% Plot estimated states



