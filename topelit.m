function [T]=topelit(M,n)
T{1}=M;
m=length(M);
if m<n
    l=n-m;
    for nn=1:l
        L=length(T);
        LL=L;
        for r=1:L
            A=T{r};
            lr=length(A);
            N=nn-(lr-m);
            i=firstll(A);
            B=[A,[zeros(i-1,N);ones(lr-i+1,N)];zeros(N,lr+N)];
            LL=LL+1;
            T{LL}=B;
        end
    end
            
end
end