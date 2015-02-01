%ranker
%inputs: A tensor, fixing each last index gives a connectivity matrix
%           c - consumption of single cell
%           p - dissipation of single transport
%outputs: r matrix - each row lists the critical energies for the
%corresponding connectivity matrix in A
%           rk orders r by column
%           I gives indeces of the ordering done with rk
%           rk2, I2 same as rk,I after eliminating element greater than minimum
%           in previous columns
%description: generates ranking for networks described by A through the
%values of their critical energies.

%line 21-22:use allEcrit for death events (multiple cell can die in one death event), use allEcrit2 to count each cell as a single death 
function [r,rk,I,rk2,I2]=ranker(A,c,p)
l=length(A(1,1,:));
n=length(A(:,:,1));
r=Inf(l,n-1);
for i=1:l
    M=sparse(A(:,:,i));
%     temp=allEcrit(M,c,p);
    temp=allEcrit2(M,c,p);
    nn=length(temp);
    for j=1:nn
        r(i,j)=temp(j,1);
    end
end
[rk,I]=sort(r,1);
r2=r;
mn=inf;
for j=2:n-1
    for i=1:l
        mn=min(mn,min(r2(:,j-1)));
        if (mn<r2(i,j)+1e-14)
            r2(i,j)=Inf;
        end
    end
end
[rk2,I2]=sort(r2,1);
end