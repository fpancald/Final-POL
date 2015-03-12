%EnergyHM3 is a function that provides many plots and data outputs on the
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
function [LE,E,H]=EnergyHM3(T,k,c,p)
warning('off','MATLAB:singularMatrix');         %turn off warnings for singular
warning('off','MATLAB:nearlySingularMatrix');   %and nearly singular matrices happens when p close to 0 (is expected)

l=length(T);
m=length(p);
E=zeros(l,m);

%compute the energy matrix E line by line through function EnergyMatrix
for i=1:l
    n=length(T{i});
    E(i,:)=EnergyMatrix(T{i},k,c,p);
end

mx=log10(max(max((E(:,2:end)),2)));      %determine if visualize all the energies in E on y-axis (max-max) or troncate at the minimum one for the smallest non-zero p value
%mx=log10(min(max((E(:,2:end)),2)));     % (min-max). We take the max only on non-zero p values (2:end)
dE=mx/(10*(m-1));
Es=0:dE:mx;                  %the log10 energy axis grid is taken 10 times finer than the p grid (can be changed in the future)
% Es=Es*n;
% LE=log10(E)-log10(n)*ones(size(E)); %gives energy per cell
LE=log10(E);                           %gives energy independent of size
mm=length(Es);
H=zeros(mm-1,m-1);                      %H does not consider the very first log10 energy level (Es=0) and the very first p value (p=0)

%compute H value for each grid point
for i=2:mm
    for j=2:m
        for h=1:l
            if Es(i)>LE(h,j)
                H(i-1,j-1)=H(i-1,j-1)+1;
            end
        end
    end
end

warning('on','MATLAB:singularMatrix');          %turn on again warnings 
warning('on','MATLAB:nearlySingularMatrix');
end