%allEcrit3
%inputs: A matrix - connectivity matrix
%           c - consumption of single cell
%           p - dissipation of single transport
%outputs: E vector - all critical energies for connectivity matrix A sorted
%in descending order not unique and loops allowed
%description: calculates all critical energies for the given network
%iterating ecrit3 through all the nodes.

%need testing

function [E]=allEcrit3(A,c,p)
format long
M=A;
n=length(M);
E=[];

for j=1:n-1
    F=[];
    for i=2:n
    %     E=[E;[ecrit(M,i,c,p),i]];
    %    E=[E;[ecrit2(M,i,c,p),i]];
        F=[F;[ecrit3(M,i,c,p),i]];
    end
    [G,I]=sort(F(:,1), 'descend');
    F=F(I,:);
    E=[E; F(j,1)];
    M(F(j,2),:)=zeros(1,n);
end
end
