function [y] = ukf_ffun(x,u,n,t);

% PURPOSE : Process model function for UKF
% INPUTS  : - x:  prior state
%           - u:  control vector  
%           - n:  process noise    
%           - t:  time index
% OUTPUTS : - y:  state after time update
% AUTHORS  : 
% DATE     : 


if nargin < 3, error('Not enough input arguments.'); end

y = ffun(x,t) + n;









