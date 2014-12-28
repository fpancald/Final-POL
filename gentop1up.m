function [D]=gentop1up(A)
n=length(A);
B=[A,zeros(n,1);zeros(1,n+1)];
D=[];
k=1;
for i=1:n
    for j=1:n
        C=B;
        C(i,n+1)=1;
        if j~=1
            C(n+1,j)=1;
        end
        D(:,:,k)=C;
        k=k+1;
    end
end
end
