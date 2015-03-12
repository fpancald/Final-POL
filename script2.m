n1=10;
n2=10;
N=100;
k=1;
c=1;
p=0:0.001:1;
Q=topelitall(n2);
T=topelitsizes(Q,n1,n2,N);
%
% Q{1}=T{8};
tic
[LE,E,H]=EnergyHM3(T,k,c,p);
% [LE,E,H]=EnergyHM3(Q,k,c,p);
toc
tic
reader;
toc
tic 
plotter;
toc