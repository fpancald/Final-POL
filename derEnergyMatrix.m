%Finds k-th critical energy for matrix M cell cost c and fractional
%transport p (can be a vector). Uses allEcrit to determine all critical
%energies and takes the k-th one.
function [Ec,dEc]=derEnergyMatrix(M,k,c,p)
l=length(p);
Ec=zeros(1,l);
dEc=zeros(1,l);
for i=1:l
    [E,dE]=allEcritder(M,c,p(i));
    Ec(i)=E(k);
    dEc(i)=dE(k);
end
end