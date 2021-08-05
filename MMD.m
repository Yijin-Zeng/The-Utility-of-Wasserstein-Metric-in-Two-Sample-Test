function [ P,dist,it ] = MMD_Gaussian(X,Y,p,Kernel)
%This is  Gaussian Kernel Maximum Mean Discrepancy
% The kernel paramter would be given by median herustic 

%-Inputs:
% X,Y : two samples 
% p : just for standard interface( really doesn't matter)

%-Outputs:
% dist :  Kernel Maximum Mean Discrepancy
% P,it really do not matter, just for standard interface


[n d] = size(X);
[m d] = size(Y);
dist = 0;

M = Euclidean_metric([X;Y], [X;Y],2);
M = reshape(M, [(n+m)*(n+m),1]);
gamma = sqrt(median(M) / 2);  % Median Herustic,
                              % Note some may just choose sqrt(median(M))

a = 1 / (n*(n-1));
b = 1 / (m*(m-1));
c = 2 / (m*n);


for (i = 1:n)  
    for (j = 1:n)
        dist = dist + a*Kernel(X(i,:),X(j,:),gamma);
    end
end

for (i = 1:m)  
    for (j = 1:m)
        dist = dist + b*Kernel(Y(i,:),Y(j,:),gamma);
    end
end


for (i = 1:n)  
    for (j = 1:m)
        dist = dist - c*Kernel(X(i,:),Y(j,:),gamma) ;
    end
end

P = [];
it = 0;
end

