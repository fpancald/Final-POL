n=5:5:25;
N=100;
k=1;
c=1;
p=0:0.001:2;
Kmut=8;

T=[];
for cnt=n
    T=[T starmut(cnt,N,Kmut)];
end

[E]=EnergyHM3(T,k,c,p);

reader;