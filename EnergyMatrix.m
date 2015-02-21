%Finds k-th critical energy for matrix M cell cost c and fractional
%transport p (can be a vector). Uses allEcrit to determine all critical
%energies and takes the k-th one.
function [Ec]=EnergyMatrix(M,k,c,p)
l=length(p);
Ec=zeros(1,l);
for i=1:l
%     E=allEcrit(M,c,p(i));
%     E=allEcrit2(M,c,p(i));%not unique Es
    E=allEcrit3(M,c,p(i));%not unique Es and loops allowed
    Ec(i)=E(k);
end
end