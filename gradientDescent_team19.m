function [theta, J_History] = gradientDescent_team19(X, theta, y, alpha, numIters)
% la taille des données
m = length(y); 
size_theta = length(theta);
J_History = zeros(numIters, 1);

T = theta; % une variable temporaire pour stocker la valeur de theta 
% repeter l'algorithme jusqu'a n iterations
for iter=1:numIters
    temp = (X*theta - y);
    
    for i=1:size_theta
        T(i,1) = sum(temp.*X(:,i));
    end
    
    theta = theta - (alpha/m)*T;
    
    J_History(iter,1) = cost_team19(X,y,theta);
 end
end 