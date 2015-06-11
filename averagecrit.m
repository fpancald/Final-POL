count=zeros(1,n2);
avcre=zeros(m-1,n2); %n2 should be max size, for some script need to change to n4
% count=zeros(1,n4);
% avcre=zeros(m-1,n4);
for h=1:l
    s=length(T{h});
    count(s)=count(s)+1;
    for j=2:m
%         avcre(j-1,s)=avcre(j-1,s)+E(h,j)/s;
        avcre(j-1,s)=avcre(j-1,s)+LE(h,j)-log10(s);%gives energy per cell
    end
end

for ns=2:n2
% for ns=2:n4
    if count(ns)~=0
        avcre(:,ns)=avcre(:,ns)/count(ns);
    end
end

set(0,'DefaultAxesLineStyleOrder',{'-','--',':'})

figure(1)
plot(p(2:end),avcre(:,n1:n2))
% hold on
% plot(p(2:end),avcre(:,n3:n4))
% hold off

figure(2)
plot(n1:n2,avcre(1:100:1001,n1:n2)')
% hold on
% plot(n3:n4,avcre(1:100:1001,n3:n4)')
% hold off
