n1=10;
n2=20;
N=50;
k=1;
c=1;
p=0:0.001:2;

T=randsettopsizes(n1,n2,N);

[E]=EnergyHM3(T,k,c,p);

reader;
