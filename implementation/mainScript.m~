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

gamma1 = 3;
gamma2 = 2;

number_of_runs  = 2; %100
MSE = zeros(1,number_of_runs);

for run=1:number_of_runs
    
    % Generate data
    x0 = 1; % = abs(randn(1,1))*100;
    [xt,yt] = generateData(T, x0); % dim(xt) = 61x1, dim(yt) = 60x1

    % Initialization
    x = ones(T, N);
    P = P_init * ones(T, N);
    x_predict = ones(T, N);
    P_predict = ones(T, N);
    x_mean_predict = ones(T, 1);
    y_predict = ones(T, N);
    weights = ones(T, N) ./ N;
    
    for t = 2:T
        % Prediction step
        for i=1:N
            [x_mean_predict(t,i), P_predict(t,i)] = ...
                UKF(x(t-1,i), P(t-1,i), [], Q, yt(t), R, t, alpha, beta, kappa);
            %[x_mean(t,i), P_predict(t,i)] = ...
            %    ukf(x(t-1,i), P(t-1,i), [], Q, 'ukf_ffun', yt(t), R, 'ukf_hfun', t, alpha, beta, kappa);
            
            % Sample x-hat
            %------------------------------
            % TODO: Try to generate x_predict with P_predict directly, without
            % the use of sqrtm().
            x_predict(t,i) = normrnd(x_mean_predict(t,i), sqrtm(P_predict(t,i)), 1, 1)
            %x_predict(t, i) = x_mean(t, i) + sqrtm(P_predict(t, i)) * randn(1, 1);
            
        end
        
        % Evaluate importance weights up to a normalizing constant
        for i=1:N,
            % TODO fix this term
            y_predict(t, i) = predictY(x_predict(x, i), t);
            
            % Calculate likelihood
            likelihood_exponent = -0.5 * inv(sigma) * ((yt(t) - y_predict(t, i))^2) 
            likelihood = 1e-50 + inv(sqrt(sigma)) * exp(likelihood_exponent);
            
            % Calculate prior
            prior_exponent = -gamma2*(x_predict(t, i)) - x(t-1, i);
            prior_term = x_predict(t, i) - x(t-1, i)^(gamma1)
            prior = prior_term * exp(prior_exponent)
            
            % Calculate proposal
            proposal_term = inv(sqrt(P_predict(t, i)));
            proposal_exponent = -0.5 * inv(P_predict(t, i)) * ( x_predict(t, i)-x_mean_predict(t, i) )^2;
            proposal = proposal_term * exp(proposal_exponent);
            
            % Assign a value to the weight
            weights(t, :) = likelihood * prior / proposal;
            
            
        end
        % Normalize weights
        weightSum = sum(weights(t, :));
        weights(t, :) = weights(t, :) ./ weightSum;
        
        % Selection step
        % We resample points according to multinomial resampling (a SIR variant), this
        % differs from the resampling in the original paper, but is said to
        % not matter that much. Our resampling procedure has higher
        % variance.
        resampledPoints = randsample(N,N,true,w(t,:));
        x(t, :) = x(t, resampledPoints);
        P(t, :) = P(t, resampledPoints);
        
        
    end
end    
% Plot generated data
% Plot estimated states



