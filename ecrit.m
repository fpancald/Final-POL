function [Ec]=ecrit(A,k,c,p)
n=length(A);
M=zeros(1,n);
M(1,k)=1;
B=eye(n);
for i=1:n
    s=sum(A(i,:));
    if s~=0
        B(i,i)=1/s;
    else
        B(i,i)=0;
    end
end
T=[zeros(n-1,1),eye(n-1)];
A1=A(:,2:n);
M=[M;T-p*A1'*B];
v=[c;-p*A1'*B*c*ones(n,1)];
E=M\v;
Ec=E(1);
end
