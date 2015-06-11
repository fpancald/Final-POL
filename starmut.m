function T=starmut(n,N,K)
%n=size
%N=# mutated topologies
%1/K=mutation rate
A=[0,ones(1,n-1);zeros(n-1,n)];
T=[];
for i=1:N
    check=0;
    while (check==0)
    B=A;
    [Y] = datasample(1:n^2,floor(n^2/K),'Replace',false);
    for y=Y
        j=ceil(y/n);
        k=rem(y,n)+1;
        if B(j,k)==0
            B(j,k)=1;
        else
            B(j,k)=0;
        end
    end
    check=connpump(B);
    end
    T{i}=B;
    
end
    
end