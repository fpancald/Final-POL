function [Ec]=EnergyMatrix(M,k,c,p)
l=length(p);
Ec=zeros(1,l);
for i=1:l
    E=allEcrit(M,c,p(i));
    Ec(i)=E(k);
end
end