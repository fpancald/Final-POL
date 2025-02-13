function [Ec]=ecrit2(A,k,c,p)
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
C=ones(n,1)*c;
v=[c;-p*A1'*B*C];
E=M\v;
if all(E>=c-1e-15)==0
    C(E<c)=0;
    v=[c;-p*A1'*B*C];
    E=M\v;
    Ec=E(1);
else
    Ec=E(1);
end
end
