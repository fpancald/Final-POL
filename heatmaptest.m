n=100;
p=0:1/n:1;
E=(p.^-1+ones(size(p))).*p.^-1+ones(size(p));
Eend=max(E(2:end));
Er=0:(Eend/n):Eend;
H=zeros(length(p),length(Er));
for i=1:length(p)
    for j=1:length(Er)
        if E(1,j)<Er(i)
           H(i,j)=H(i,j)+1;
        end
    end
end
E=[E;p.^-1+ones(size(p))];
for i=1:length(p)
    for j=1:length(Er)
        if E(2,j)<Er(i)
           H(i,j)=H(i,j)+1;
        end
    end
end
HeatMap(H)
H