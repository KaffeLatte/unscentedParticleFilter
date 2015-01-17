function [y] = ukf_bsffun(x,u,n,t);

% PURPOSE : Process model function for UKF.
% INPUTS  : - x:  The evaluation point in the domain.
%           - u:  control vector  
%           - n:  process noise
%           - t:  time index  
% OUTPUTS : - y:  The value of the function at x.

% AUTHORS  : Nando de Freitas      (jfgf@cs.berkeley.edu)
%            Rudolph van der Merwe (rvdmerwe@ece.ogi.edu)
% DATE     : 10 March 2000

if nargin < 3, error('Not enough input arguments.'); end

y = bsffun(x,t) + n;









