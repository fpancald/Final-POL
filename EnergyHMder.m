%EnergyHMder is a function that provides many plots and data outputs on the
%set ot topologies T given as an input with respect to a specific critical
%energy Ek (determined through the parameter k), the cost per cell c and
%the transport portion p (p can be a vector with values in ascending
%order).

%Inputs:    T: set of topologies
%           k: index of desired critical energy
%           c: constant cell energy cost
%           p: transport fraction (p can be a vector with values in ascending order)

%Outputs:   H: provides for each point on the grid x-axis=p, y-axis=Energy the
%               number of surviving topologies at that grid point (used to get complete
%               colormap)
%           E: is a matrix of critical energies Ek (each row corresponds to a topology
%               in T and each column to a value of p)
%           LE: is log10 version of E (needed for plotting purpose)
%
function [E,dE]=EnergyHMder(T,k,c,p)
warning('off','MATLAB:singularMatrix');         %turn off warnings for singular
warning('off','MATLAB:nearlySingularMatrix');   %and nearly singular matrices happens when p close to 0 (is expected)

l=length(T);
m=length(p);
E=zeros(l,m);
dE=zeros(l,m);

%compute the der-energy matrix dE line by line through function EnergyMatrix
for i=1:l
    %n=length(T{i});
    [E(i,:),dE(i,:)]=derEnergyMatrix(T{i},k,c,p);
end




warning('on','MATLAB:singularMatrix');          %turn on again warnings 
warning('on','MATLAB:nearlySingularMatrix');
end