function [y] = ffun(x,t);
% PURPOSE : Process model function.
% INPUTS  : - x:  The evaluation point in the domain.
% OUTPUTS : - y: The value of the function at x.
% AUTHORS  : 
% DATE     : 


if nargin < 2, error('Not enough input arguments.'); end

beta = 0.5;                 % Autoregressive parameter.
y = 1 + sin(4e-2*pi*t) + beta*x; 









