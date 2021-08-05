function [k] = LaplaceKernel(a,b,gamma)
%This is Gaussian Kernel: a,b is vector with same size

%-Inputs:
% a (vector)
% b (vector) 
% gamma (given by median heuristic)

%-Outputs:
% k
t = abs(a - b);
t = sum(t);
k = exp(-t / (gamma));

end