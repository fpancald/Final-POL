function [T]=topelitsizes(Q,n1,n2,N)
l=length(Q);
k=1;
QQ=[];
T=[];
for i=1:l
    d=length(Q{i});
    if d>=n1 && d<=n2
        QQ{k}=Q{i};
        k=k+1;
    end
end     
n=length(QQ);
if n>N
    R=randsample(n,N);
    for j=1:N
       T{j}=QQ{R(j)};
    end
else
    T=QQ;
end
end