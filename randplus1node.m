%add one node randomly so that the resulting topology is connected
function [E]=randplus1node(A)
n=length(A);
N=2*n+1;
add=random('unid',2,1,N)-ones(1,N);
E=[[A,add(1,1:n)'];add(1,n+1:N)];
check=sum(E(1:n,end));
if check==0
    i=random('unid',n);
    E(i,end)=1;
end
end