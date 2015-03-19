n1=7;
n2=10;
N=100;
k=1;
c=1;
p=0:0.001:2;
T=randsettopsize(n1,N);
% T{1}=[0 1 0;0 0 1;0 0 1];
%T=randsettopsizes(n1,n2,N);
% Q{1}=T{8};
tic
[E]=EnergyHM3(T,k,c,p);
% [E]=EnergyHM3(Q,k,c,p);
toc
tic
reader;
toc
tic 
plotter;
toc