function [P,dist,output] = Wasserstein_metric( X,Y,p )
% This function calculates the empirical Wasserstein metric between observations
% X and Y using the built-in linear programming function of matlab.
% The weights a and b are set as uniform weights.

% -Inputs:
% X: sample X
% Y: sample Y
% p: power

% -Outputs:
% P: the optimal coulping
% dist: p order of empirical Wasserstein metric
% output: information provided by the built-in linear programming function


[n d] = size(X);
[m d] = size(Y);
M = Euclidean_metric(X,Y,p);  % pairwise distances
M = M'; 

c = M(:);

% Constrains 
a = ones(1,n) / n;
b = ones(1,m) / m;
beta = [a b]';

A = zeros((n+m), (n*m));

for i=1:n     % row constrain
    for j=((i-1)*m + 1): (i*m)
        A(i,j) = 1;
    end
end

for i=(n+1):(n+m)    % col constrain
    for j=1:n
        A(i,(i-n)+m*(j-1)) = 1;
    end
end
options = optimoptions('linprog','Display','none');
[x,dist,exitflag,output,lambda] = linprog(c,[],[],A,beta,zeros((n*m),1),[],options);
P = reshape(x, m, n);
P = P';
               
end

