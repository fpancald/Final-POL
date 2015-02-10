%determines first node in last layer of connectivity matrix A
function [i]=firstll(A)
n=length(A);
for k=1:n
    if A(k,end)==1
        j=k;
        break;
    end
end
for k=1:n
    if A(j,k)==1;
        i=k;
        break;
    end
end
end