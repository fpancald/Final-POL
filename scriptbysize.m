for ns=2:n2
    HH{ns}=zeros(mm-1,m-1); 
end
for i=2:100:mm
    for j=2:100:m
        for h=1:l
            s=length(T{h});
%             if Es(i)>LE(h,j)
            if Es(i)>LE(h,j)-log10(s)%gives energy per cell
                HH{s}(i-1,j-1)=HH{s}(i-1,j-1)+1;
            end
        end
    end
end