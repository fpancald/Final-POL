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

Legendp=cell(10,1);
LegendN=cell(n2-n1+1,1);
for ns=n1:n2
% for ns=n3:n4
    if count(ns)~=0
        avcre(:,ns)=avcre(:,ns)/count(ns);
    end
    LegendN{ns-n1+1}=['N = ' num2str(ns)] ;
end
for pin=1:100:1000
    Legendp{ceil(pin/100)}=['p = ' num2str(p(pin+1))] ;
end
set(0,'DefaultAxesLineStyleOrder',{'-','--',':'})

figure(1)
plot(p(2:end),avcre(:,n1:n2))
% hold on
% plot(p(2:end),avcre(:,n3:n4))
% hold off
legend(LegendN);
xlabel('parameter p','FontSize',20)
ylabel('log10(E0)','FontSize',20)
title('Average critical energy by size N','FontSize',16)

figure(2)
plot(n1:n2,avcre(1:100:1000,n1:n2)')
% hold on
% plot(n3:n4,avcre(1:100:1001,n3:n4)')
% hold off
legend(Legendp);
xlabel('Size N','FontSize',20)
ylabel('log10(E0)','FontSize',20)
title('Average critical energy for different p values','FontSize',16)

avgcrit=sum(avcre(:,n1:n2),2)/(n2-n1+1);
figure(3)%need count(s) all equal
plot(p(2:end),avgcrit)
xlabel('parameter p','FontSize',20)
ylabel('log10(E0)','FontSize',20)
title('Average critical energy','FontSize',16)

avgder=zeros(1,m-1);
cost=zeros(1,m-1);
for pin=2:m
    if pin~=m
        avgder(pin-1)=(avgcrit(pin)-avgcrit(pin-1))/(p(pin)-p(pin-1));
    else
        avgder(pin-1)=avgder(pin-2);
    end
    cost(pin-1)=log10(exp(p(pin)/(1-p(pin))));
end

figure(4)%need count(s) all equal
plot(p(2:end),-avgder)
hold on
plot(p(2:end),cost,'Color','r')
xlabel('parameter p','FontSize',20)
ylabel('log10(E0)','FontSize',20)
title('Average maximum p','FontSize',16)
