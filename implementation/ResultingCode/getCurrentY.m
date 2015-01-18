function [current_y] = getCurrentY(xt,t,phi2,phi3,nt)
% Observation model from eq. (31) on page 32, in the paper.
% Input:
% xt        --
% t         --
% phi2      --
% phi3      --
% nt        --
% Output:
% current_y --

if t <= 30
    current_y = phi2*xt^2 + nt;
else
    current_y = phi3*xt - 2 + nt;
end

end

