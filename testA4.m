function test(alpha)
if nargin==0
    alpha=1.49338;
end

sn=4;
p=1;
%conM=[0 1 1 1;0 0 0 0; 0 0 0 0;0 0 0 0];
beta=.1;

conM(:,:,1)=[0 1 1 1;0 0 0 0; 0 0 0 0;0 0 0 0];
conM(:,:,2)=[0 1 1 0;0 0 0 1; 0 0 0 0;0 0 0 0];
conM(:,:,3)=[0 1 0 0;0 0 1 1; 0 0 0 0;0 0 0 0];
conM(:,:,4)=[0 1 0 0;0 0 1 0; 0 0 0 1;0 0 0 0];


%N=10;
% v=ones(1,N-1);
% M=diag(v,1);
% [sN,alive]=lifeform(M)
% M(N,1)=1;
% [sN,alive]=lifeform(M)
% i=1:N;
% j=[2:N,1];
% v=ones(1,N);
% % M=sparse(i,j,v,N,N);%circle
for i=1:4
    [sN(i),alive, talive]=lifeform2(sn,p,conM(:,:,i),alpha,beta)
end
% v(1,N)=0;
% % M=sparse(i,j,v,N,N);%line
% [sN,alive]=lifeform2(M,alpha)