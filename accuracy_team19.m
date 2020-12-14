function p = accuracy_team19(theta, x, y) % cette fonction calcule le pourcentage de precision de l'algorithme
    
    h = x * theta; % calcule de l'hypothese
    p = round(h); % round si h >= 0.5 -> 1 si h < 0.5 -> 0 
    p = mean(double(p == y)*100); % calcule de pourcentage ou p == y -> si notre prediction et juste
    
end