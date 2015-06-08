n1=11;
n2=15;
n3=31;
n4=35;
N=50;
k=1;
c=1;
p=0:0.001:2;

T=[randsettopsizes(n1,n2,N),randsettopsizes(n3,n4,N)];

[E]=EnergyHM3(T,k,c,p);

reader;
