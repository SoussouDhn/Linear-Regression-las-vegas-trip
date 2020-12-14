function j = cost(X,y,theta)
m = length(y);
s=0;
for i=2:length(theta)
   s=s+theta(i);
end
j = (1/(2*m))*sum((X*theta - y).^2)+0.03*s;
end