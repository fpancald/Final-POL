%allEcrit2
%inputs: A matrix - connectivity matrix
%           c - consumption of single cell
%           p - dissipation of single transport
%outputs: E vector - all critical energies for connectivity matrix A sorted
%in descending order not unique
%description: calculates all critical energies for the given network
%iterating ecrit3 through all the nodes.

function [E]=allEcrit2(A,c,p)
format long
n=length(A);
E=zeros(n-1,1);
for i=2:n
%     E=[E;ecrit(A,i,c,p)];
%    E=[E;ecrit2(A,i,c,p)];
%     E(i-1)=ecrit3(A,i,c,p);
    E(i-1)=ecrit4(A,i,c,p);
end
E=sort(E, 'descend');
end
