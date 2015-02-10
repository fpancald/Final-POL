%builds "all" topologies up to size n keeping a fixed core M
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
            %vers 0.0 before this point
            
            %start vers 0.1
            if N>1
                for j=1:(lr-i)
                    B=[A,[zeros(i-1,N);ones(lr-i+1,N-1),[zeros(j,1);ones(lr-i-j+1,1)]];zeros(N,lr+N)];
                    LL=LL+1;
                    T{LL}=B; 
                end
            end
            %end vers 0.1
        end
    end
            
end
end