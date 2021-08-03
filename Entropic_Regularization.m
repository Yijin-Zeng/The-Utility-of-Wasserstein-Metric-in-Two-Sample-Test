function [ P, dist, it ] = EntropicRegularization(X,Y,p,lambda,phi, epsilon )
% Wasserstein metric between two samples with entropic regularization using  skinhorn algorithm under same weights

%-Inputs:
% X: sample X (n*d)
% Y: sample Y (m*d)
% p: power
% lamda: strength of the Wasserstein term
% phi: strength of the entropic regularization term
% epsilon: convergence parameter

%-Outputs:
% P: optimal transport matrix (n*m)
% dist: Sinkhorn distance
% it: number of iteration 
M = Euclidean_metric(X,Y,p);
[n d] = size(X);
[m d] = size(Y);
r = ones(n,1) * (1/n);
c = ones(m,1) * (1/m);
[P dist it] = Sinkhorn( M, r, c, lambda,phi,epsilon );

end

