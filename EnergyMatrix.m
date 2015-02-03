function [Ec]=EnergyMatrix(M,k,c,p)
l=length(p);
Ec=zeros(1,l);
for i=1:l
    Ec(i)=ecrit3(M,k,c,p(i));
end
end