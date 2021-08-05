function [k] = GaussianKernel(a,b,gamma)
%This is Gaussian Kernel: a,b is vector with same size

%-Inputs:
% a (vector)
% b (vector) 
% gamma (given by median heuristic)

%-Outputs:
% k
t = abs(a - b);
t = t.^2;
t = sum(t);
k = exp(-t / (gamma*gamma));

end

