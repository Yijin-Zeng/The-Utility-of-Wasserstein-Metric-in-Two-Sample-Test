function [P,dist,it] = Skinhorn( M, r, c, lambda, phi, epsilon )
% Skinhorn Algorithm

% -inputs:
% M: cost matrix(n*m)
% r: vector of marginals (initialize as 1/n)
% c: vector of marginals (initialize as 1/m)
% lamda: strength of the Wasserstein term
% phi: strength of the entropic regularization term
% epsilon: convergence parameter

% -outputs:
% P: optimal transport matrix (n*m)
% dist: Sinkhorn distance
% it: number of iteration 

[n,m] = size(M);
K = exp(-M/phi);
P = K;  % Initialize P with u = v = 1
u = ones(n,1);
v = ones(m,1);
decide = 1;
it = 0;
while (decide > epsilon) && (it < 100)
    last_u = u;
    u = r ./ (K*v);
    
    last_v = v;
    v = c ./ (K' * u);
    
    max_u = max(u - last_u);
    max_v = max(v - last_v);
    decide = max(max_u, max_v);
    it = it + 1;
end

dist = 0;
for i = 1:n
    for j = 1:m
        P(i,j) = u(i) * P(i,j) * v(j);
        dist = dist + lambda*M(i,j)*P(i,j) + phi* P(i,j) * log(P(i,j));
    end
end

end

