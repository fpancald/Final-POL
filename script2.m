n1=6;
n2=20;
N=10;
k=1;
c=1;
p=0:0.001:2;
T=topelitall(n1);
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