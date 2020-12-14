function score = predictScore_team19(theta, expl, mu, stddev)
%appliquer la normalisation pour les exemples à prédire
expl = expl(:,2:end);
expl = ((expl-mu)./stddev);
expl = [ones(size(expl,1),1) expl];%ajouter la colonne de x1=1
score = expl*theta;
end