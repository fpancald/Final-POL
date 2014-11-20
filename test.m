function test(N,alpha,beta)
%N=10;
% v=ones(1,N-1);
% M=diag(v,1);
% [sN,alive]=lifeform(M)
% M(N,1)=1;
% [sN,alive]=lifeform(M)
i=1:N;
j=[2:N,1];
v=ones(1,N);
M=sparse(i,j,v,N,N);%circle
[sN,alive,talive]=lifeform2(N,1,M,alpha,beta)
v(1,N)=0;
M=sparse(i,j,v,N,N);%line
[sN,alive,talive]=lifeform2(N,1,M,alpha,beta)
end