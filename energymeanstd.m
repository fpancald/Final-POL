function [entmean,entstd]=energymeanstd(meanE,x,E)
N=length(meanE);
entmean=zeros(N,1);
entstd=zeros(N,1);
for k=1:N
    l=length(x);
    lambda=1/meanE(k);
    zeta=0;
    for i=1:l
        zeta=zeta+exp(-lambda*E(i));
    end
    for i=1:l
        entmean(k,1)=entmean(k,1)+exp(-lambda*E(i))/zeta*x(i);
    end
    for i=1:l
        entstd(k,1)=entstd(k,1)+exp(-lambda*E(i))/zeta*(x(i)-entmean(k,1))^2;
    end
    entstd(k,1)=sqrt(entstd(k,1));
end
end