function [y] = ukf_bshfun(x,u,n,t);

% PURPOSE : Measurement model function for UKF
% INPUTS  : - x:  The evaluation point in the domain.
%         : - u:  exogenous inputs
%         : - n:  measurement noise
%         : - t: time index
% OUTPUTS : - y:  The observed value of the function at x.

% AUTHORS  : Nando de Freitas      (jfgf@cs.berkeley.edu)
%            Rudolph van der Merwe (rvdmerwe@ece.ogi.edu)
% DATE     : 10 March 2000

if nargin < 4, error('Not enough input arguments.'); end

y = bshfun(x,u,t) + n;