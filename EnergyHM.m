function [LE,E,H]=EnergyHM(T,k,c,p)
l=length(T);
E=[];

for i=1:l
    n=length(T{i});
    E=[E ; EnergyMatrix(T{i},k,c,p)];
end
m=length(p);
mx=log10(min(max((E(:,2:end))')));
Es=0:mx/(10*(m-1)):mx;
LE=log10(E);
mm=length(Es);
H=zeros(mm-1,m-1);
for i=2:mm
    for j=2:m
        for h=1:l
            if Es(i)>LE(h,j)
                H(i-1,j-1)=H(i-1,j-1)+1;
            end
        end
    end
end
figure
colormap('jet')
imagesc(p(2:end),Es(2:end),H)
set(gca,'YDir','normal')
colorbar
end