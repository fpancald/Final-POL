n1=10;
n2=10;
N=2538;
k=1;
c=1;
p=0:0.001:2;
Q=topelitall(n2);
% T=Q;
T=topelitsizes(Q,n1,n2,N);
%
% Q{1}=T{8};
% tic
[E]=EnergyHM3(T,k,c,p);
% [E]=EnergyHM3(Q,k,c,p);
% toc
% tic
reader;
% toc
% tic 
% plotter;
% toc