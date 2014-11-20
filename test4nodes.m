%Characterizing the 4-node (3 cell, 1 pump) networks with respect to
%efficiency of energy transport.

%Possible networks
conM1=[0 1 1 1;0 0 0 0; 0 0 0 0;0 0 0 0];
conM2=[0 1 1 0;0 0 0 1; 0 0 0 0;0 0 0 0];
conM3=[0 1 0 0;0 0 1 1; 0 0 0 0;0 0 0 0];
conM4=[0 1 0 0;0 0 1 0; 0 0 0 1;0 0 0 0];

%All combined
conM(:,:,1)=[0 1 1 1;0 0 0 0; 0 0 0 0;0 0 0 0];
conM(:,:,2)=[0 1 1 0;0 0 0 1; 0 0 0 0;0 0 0 0];
conM(:,:,3)=[0 1 0 0;0 0 1 1; 0 0 0 0;0 0 0 0];
conM(:,:,4)=[0 1 0 0;0 0 1 0; 0 0 0 1;0 0 0 0];
alpha=1.4;
b=.1;

sn=4;
beta=(1-(b/sn^(1/4)));
p=1;
sNs=zeros([1 4]);
for i=1:4
    [sNs(i),alive]=lifeform2(sn,p,conM(:,:,i),alpha,beta);
end

Erem=zeros([1 4]);
aCrit(1)=(1/(sn-p))*((3*sn^(1/4))/(sn^(1/4)-b)+1);
aCrit(2)=(1/(sn-p))*((2/beta)*((1/beta)+1)+1);
aCrit(3)=(1/(sn-p))*((2/beta^2)+(1/beta)+1);
aCrit(4)=(1/(sn-p))*((1/beta^3)+(1/beta^2)+(1/beta)+1);

sNs
aCrit