function [X_Norm, mu, sigma] = featureNormalize_team19(X)
X_Norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));
%calculer la moyenne et le standard deviation   pour chaque attributs
for i=1:size(mu,2)
    mu(1,i) = mean(X(:,i)); 
    sigma(1,i) = std(X(:,i));
    X_Norm(:,i) = (X(:,i)-mu(1,i))/sigma(1,i);
end

