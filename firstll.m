%determines first node in last layer of connectivity matrix A
function [i]=firstll(A)
n=length(A);
%vers0.2
for k=n:-1:1
    if(sum(A(k,:)~=0))
        i=k+1;
        break;
    end
end
end