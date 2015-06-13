n1=10;
n2=20;
N=100;
k=1;
c=1;
p=0:0.001:2;
Kmut=5;

T=[];
for cnt=n1:n2
    T=[T starmut(cnt,N,Kmut)];
end

[E]=EnergyHM3(T,k,c,p);

reader;