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
n=20;
p=0.1:0.1:1;
E=zeros(n,length(p),n-1);
for i=2:n
    for j=1:length(p)
        for s=1:i-1
            for k=0:i-s-1
                E(i,j,s)=E(i,j,s)+p(j)^k;
            end
            E(i,j,s)=(E(i,j,s)*s+p(j)^(i-s))/p(j)^(i-s);
        end
    end
end
%now I am plotting on the same graph the critical energy corresponding to a
%specific p value for all the possible topology with up to n nodes
for j=1:length(p)
    figure(j)
    hold all
    for s=1:n-1
        plot(s+1:n,E(s+1:n,j,s));
    end
    xlabel('Number of nodes N')
    ylabel('Critical energy')
    title('Critical energy for all values of s')
end
% jj=3;
nn=n;
for jj=1:length(p)
    EE=squeeze(E(nn,jj,1:nn-1));
    figure
    plot(1:nn-1,EE(nn-1:-1:1))
    xlabel('Length of line l')
    ylabel('Critical energy')
    title('Critical energy change as we go from a line to a star')
end
%here I want to check what are the topology that require less energy than a
%specific one {n,p,l}; ii, jj, ll, here stand for the chosen values for #of
%nodes n, attrition p and linearity l
ii=n;
jj=9;
ss=1;E(ii,jj,n-1)
T=[];
for s=n-1:-1:1
    for i=n:-1:2
        if E(ii,jj,ss)>E(i,jj,s) && E(i,jj,s)>0
            T=[T;i,s,s/(i-1),E(i,jj,s)];
            break;
        end
    end
end
T