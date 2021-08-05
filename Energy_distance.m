function [ P,dist,it ] = Energy_distance( X,Y,p )
%Energy distance for samples X and Y

%-Inputs:
% X,Y: Two samples
% p really not matter, just for standard interface

% dist: distance between two samples under energy distance
% P and it really do not matter, just for standard interface

[n1 d] = size(X);
[n2 d] = size(Y);

M1 = Euclidean_metric(X,Y,2);
M1 = M1.^0.5;
M1 = mean(mean(M1));

M2 = Euclidean_metric(X,X,2);
M2 = M2.^0.5;
M2 = mean(mean(M2));

M3 = Euclidean_metric(Y,Y,2);
M3 = M3.^0.5;
M3 = mean(mean(M3));


a = n1*n2 / (n1 + n2);

dist = M1 - M2/2 - M3/2;
dist = a * dist;
P = [];
it = 0;
end

