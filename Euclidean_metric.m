function [M] = Euclidean_metric(X,Y,p)

%  pairwise distances between elements of X and Y raised to the power p

% -Inputs:
% X: sample X
% Y: sample Y
% p: power

% -Outputs:
% M: pairwise distances

[n d] = size(X);
[m d] = size(Y);
M = zeros(n,m);

for (i = 1:n)    
    for (j = 1:m)       
        temp = X(i,:) - Y(j,:);
        temp = abs(temp);
        temp = temp.^p;
        temp = sum(temp);
        M(i,j) = temp;
    end
end

end

