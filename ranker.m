l=length(A(1,1,:));
c=1;
p=0.9;
n=length(A(:,:,1));
r=Inf(l,n-1);
for i=1:l
    temp=allEcrit(A(:,:,i),c,p);
    nn=length(temp);
    for j=1:nn
        r(i,j)=temp(j,1);
    end
end
r
[rk,I]=sort(r,1);
rk
I
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
rk2
I2