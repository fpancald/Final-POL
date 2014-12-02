%This script compares the graph of the crtitical energy (energy for all the cells to stay alive) for different
%topologies as a function of their number of nodes 
% for each n=#of nodes we consider n-1 topologies depending on the value
% l=#of nodes in the linear part of the network
% I am considering the extended fork with linear part l and part after the
% splitting s.
%note n=l+s
%for example a line will have l=n-1,s=1 (the last node is considered as a fork
%with one path), and the star has l=1,s=n-1 (the pump is considered to be
%the linear part of the star)
%this way E(n,p,l)=c*(p^l+...+p+s)/p^l; therefore we have a general formula
%for a specific topology knowing the number of nodes its linearity and the
%atrition p;
close all
clear all
n=100;
p=0.1:0.1:1;
E=zeros(n,length(p),n-1);
for i=2:n
    for j=1:length(p)
        for l=1:i-1
            for k=1:l
                E(i,j,l)=E(i,j,l)+p(j)^k;
            end
            E(i,j,l)=(E(i,j,l)+i-l)/p(j)^l;
        end
    end
end
%now I am plotting on the same graph the critical energy corresponding to a
%specific p value for all the possible topology with up to n nodes
for j=1:length(p)
    figure(j)
    hold on
    for l=1:n-1
        plot(l+1:n,E(l+1:n,j,l));
    end
end
close all
%here I want to check what are the topology that require less energy than a
%specific one {n,p,l}; ii, jj, ll, here stand for the chosen values for #of
%nodes n, attrition p and linearity l
ii=100;
jj=9;
ll=1;
T=[];
for l=1:n-1
    for i=n:-1:2
        if E(ii,jj,ll)>E(i,jj,l) && E(i,jj,l)>0
            T=[T;i,l,l/(i-1)];
            break;
        end
    end
end
%each row of T contains the i and l values for a topology that has a lower
%critical energy than the selected one
%note that for each value of l we keep only the one with the highest number
%of nodes
    