% gentop1up function:
% inputs: A matrix (or sparse matrix)- connectivity matrix
% outputs: D tensor, fixing each last index gives a connectivity matrix generated by the function starting with the inputs 
% description: takes connectivity matrix A and generates all the possible
% connectivity matrix with one more nodes with 1 inward connection from one
% of the previous nodes and 1 outward connection to 1 of the previous
% nodes, but not the pump, or no outward connection.

function [D]=gentop1up(A)
A=sparse(A);
n=length(A);
B=[A,sparse(n,1);sparse(1,n+1)];
B=sparse(B);
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
