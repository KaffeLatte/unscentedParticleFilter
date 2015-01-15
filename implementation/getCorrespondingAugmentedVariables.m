function [x_a, estimated_x_a, P_a] = getCorrespondingAugmentedVariables(particles, v, n )
%Function that generates P_a, estimated_x_a and x_a according to the
%procedure described on page 9 in the paper.
% Input:
% particles --      the set of particles. dim: 1xN
% v --              the original process noise variable. dim: 1x1
% n --              the original measurement noise variable. dim: 1x1
% Output:
% x_a --            a concatenation of the original state and noise variables
% estimated_x_a --  E [x_a]
% P_a --            the P_a matrix

% This is definitly the machinery in the Initialization step
N = size(particles,2);
x_a = [particles', v', n']'; % 3xN
estimated_x_a = [mean(particles), mean(v), mean(n)]'; % 3x1
estimated_x_a_duplicates = repmat(estimated_x_a,1,N); % 3xN
diffs = x_a - estimated_x_a_duplicates; % 3xN
P_a = diffs*diffs'; %3x3

% But I think the P element in P_a in the following steps, for t>0 is
% different. Since we have generated a new P, ^P. But is ^P the same P that
% is in the P_a matrix....?


end

