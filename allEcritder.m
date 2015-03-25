%allEcritder
%inputs: A matrix - connectivity matrix
%           c - consumption of single cell
%           p - dissipation of single transport
%outputs: E vector - all critical energies for connectivity matrix A sorted
%in descending order not unique and loops allowed
%description: calculates all critical energies for the given network
%iterating ecrit3 through all the nodes.

%need testing

function [E,dE]=allEcritder(A,c,p)
format long
M=A;
n=length(M);
E=zeros(n-1,1);
dE=zeros(n-1,1);
for j=1:n-1
    F=zeros(n-1,2);
    dF=zeros(n-1,2);
    for i=2:n
        [tE,tdE]=ecritder(M,i,c,p);
        F(i-1,:)=[tE,i];
        dF(i-1,:)=[tdE,i];
    end
    [~,I]=sort(F(:,1), 'descend');
    F=F(I,:);
    dF=dF(I,:);
    E(j,1)=F(j,1);
    dE(j,1)=dF(j,1);
    M(F(j,2),:)=zeros(1,n);
end
end