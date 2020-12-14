%nettoyer et fermer les figures
clear all;clc;close all;

%% Load Data et  Initialisation des variables
data = load('trip_lasvegas_team19.txt');
X = data(:, 1:3); % Features
X = [X data(: , 5:16)];
y = data(:, 4);% score

alpha = 0.03; % Learning rate
iterations = 1000; %numbre d'itération combien de fois le gradient desent doit il boucler

m = length(y); % nombre de training examples
d = size(X,2); % Nombre d'attributs
theta = zeros(d+1,1); % Initialiser theta à zero

%% Calculate Theta from Normal Equation
XNormEqn = [ones(m,1) X];
thetaNormEqn = NormalEquation_team19(XNormEqn,y);

%% Feature Normalization
[X, mu, stddev] = featureNormalize_team19(X);

%% Compute the Cost Function
X = [ones(m,1) X]; %ajouter la colone de x0=1 associer a theta 0 
[theta, J_History] = gradientDescent_team19(X, theta, y, alpha, iterations);

%% Plot the convergence graph
figure;
plot(1:numel(J_History), J_History, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');


%%
% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', thetaNormEqn);
fprintf('\n');


%% Predeiction of score hotel with one example 

fprintf('Predicting the score for this example: \n');
exp = [1,20,19,112,1,3,1,1,0,1,1,1,20,4,826,5];
disp(exp(:,2:end))
fprintf('Score via Normal Equation:');
score = (exp)*thetaNormEqn;

fprintf(['Predicted score  ' ...
         '(using gradient descent):\n %f\n'], score);
clear score;
fprintf('\n');
fprintf('Score via Gradient Descent:');
score = predictScore_team19(theta,exp,mu,stddev);
fprintf(['Predicted the score ' ...
         '(using normal equations):\n %f\n'], score);
%%
fprintf('score via gradient descente:');
X * theta
fprintf('score via normal equation:');
XNormEqn * thetaNormEqn


% Affichage du Cost
fprintf([' Cost = \n %f\n '], J_History(1000));

precision = accuracy_team19(theta, X, y);
display([' precision = ', num2str(precision),' %']);


