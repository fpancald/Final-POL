function [E]=gentop(A,n)
N=length(A(1,1,:));
E=[];
k=1;
for i=1:N
    B=A(:,:,i);
    l=length(B);
    C=gentop1up(B);
    l=l+1;
    if l<n
        D=gentop(C,n);
    else
        D=C;
    end
    for j=1:length(D(1,1,:))
        E(:,:,k)=D(:,:,j);
        k=k+1;
    end
    clear C D;
end
end