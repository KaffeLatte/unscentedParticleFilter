function [y] = ukf_hfun(x,u,n,t);

% PURPOSE : Measurement model function fpr UKF.
% INPUTS  : - x:  Hidden state
%         : - u:  control vector  
%           - n:  Measurement noise
%           - t:  time index or itegration constant
% OUTPUTS : - y:  Observation of state
% AUTHORS  : 
% DATE     : 

if nargin < 3, error('Not enough input arguments.'); end

y = hfun(x,t) + n;









