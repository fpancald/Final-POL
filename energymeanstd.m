function [entmean,entstd]=energymeanstd(meanE,x,delta,E)
entmean=0;
entstd=0;
l=length(x);
lambda=1/meanE;
for i=1:l
    entmean=entmean+lambda*exp(-lambda*E(i))*x(i);
end
entmean=entmean*delta;
for i=1:l
    entstd=entstd+lambda*exp(-lambda*E(i))*(x(i)-entmean)^2;
end
entstd=entstd*delta;
entstd=sqrt(entstd);
end