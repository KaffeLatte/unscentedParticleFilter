function [x_est, P_est] = UKFilter(x_est, P_est, Q, y_true, R, t, alpha, beta, kappa)
% Input:
% Output:
% x_mean_predict
% P_predict

states          = size(x_est(:),1);
observations    = size(y_true(:),1);
vNoise          = size(Q,2);
wNoise          = size(R,2);

noises          = vNoise+wNoise;

% Augment the state vector with the noise vectors
if (noises)
    N = [Q zeros(vNoise,wNoise); zeros(wNoise,vNoise) R];
    P_a = [P_est zeros(states,noises);zeros(noises,states) N];
    x_mean_a=[x_est;zeros(noises,1)];
    %P_a = [P_prev 0 0; 0 Q 0; 0 0 R];
    %x_mean_a = [x_prev; 0; 0];
else
    P_a = P_est;
    x_mean_a = x_est;
end    


% Calculate the sigma points and the sigma_weights
[sigma_points, sigma_weights, number_of_sigma_points] = ...
    getSigmaPoints(x_mean_a, P_a, alpha, beta, kappa);
% dim(sigma_points) = 3x7,  dim(sigma_weights) = 1x7

W_x = repmat(sigma_weights(:,2:number_of_sigma_points),states,1);
W_y = repmat(sigma_weights(:,2:number_of_sigma_points),observations,1); %%% SAME NOTATION HERE?!

x_sigma_points = f(sigma_points(1:states,:), sigma_points(states+1:states+vNoise,:), t);
y_sigma_points = h(x_sigma_points, sigma_points(states+vNoise+1:states+noises,:), t);

x_mean_pred = sum(W_x .* ...
    (x_sigma_points(:,2:number_of_sigma_points) - repmat(x_sigma_points(:,1),1,number_of_sigma_points-1)),2);
y_mean_pred = sum(W_y .* ...
    (y_sigma_points(:,2:number_of_sigma_points) - repmat(y_sigma_points(:,1),1,number_of_sigma_points-1)),2);

x_mean_pred = x_mean_pred + x_sigma_points(:,1);
y_mean_pred = y_mean_pred + y_sigma_points(:,1);

x_diff = x_sigma_points(:,1) - x_mean_pred;
y_diff = y_sigma_points(:,1) - y_mean_pred;

P_pred = sigma_weights(number_of_sigma_points+1)*x_diff*x_diff';
P_xy = sigma_weights(number_of_sigma_points+1)*x_diff*y_diff';
P_yy = sigma_weights(number_of_sigma_points+1)*y_diff*y_diff';

x_diff = x_sigma_points(:,2:number_of_sigma_points) - ...
    repmat(x_mean_pred,1,number_of_sigma_points-1);
y_diff = y_sigma_points(:,2:number_of_sigma_points) - ...
    repmat(y_mean_pred,1,number_of_sigma_points-1);
P_pred = P_pred + (W_x .* x_diff) * x_diff';
P_yy = P_yy + (W_x .* y_diff) * y_diff';
P_xy = P_xy + x_diff * (W_x .* y_diff)';
 
K = P_xy / P_yy

x_est = x_mean_pred + K* y_true - y_mean_pred

P_est = P_pred - K*P_yy*K'

end

