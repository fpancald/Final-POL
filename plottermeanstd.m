numener=1;%from 1 to nME allowed
mean=zeros(m-1,n2-n1+1);
standdev=zeros(m-1,n2-n1+1);
Legendp=cell(10,1);
LegendN=cell(n2-n1+1,1);
for in=n1:n2
    number=round(max(max(entxwps{in}(1:nME,:))));
    mean(:,in)=entxwps{in}(numener,:)/number;
    standdev(:,in)=entstdwps{in}(numener,:)/number;
    LegendN{in-n1+1}=['N = ' num2str(in)] ;
end
for pin=1:100:1000
    Legendp{ceil(pin/100)}=['p = ' num2str(p(pin+1))] ;
end
set(0,'DefaultAxesLineStyleOrder',{'-','--',':'})

figure(1)
plot(p(2:end),mean(:,n1:n2));
legend(LegendN);
xlabel('parameter p','FontSize',20)
ylabel('P fraction of surviving species','FontSize',20)
title('Normalized mean number of Surviving species by size N','FontSize',16)

figure(2)
plot(p(2:end),standdev(:,n1:n2));
legend(LegendN);
xlabel('parameter p','FontSize',20)
ylabel('P fraction of surviving species','FontSize',20)
title('Normalized standard deviation for number of Surviving species by size N','FontSize',16)

figure(3)
plot(n1:n2,mean(1:100:1000,n1:n2)');
legend(Legendp);
xlabel('Size N','FontSize',20)
ylabel('P fraction of surviving species','FontSize',20)
title('Normailzed mean number of Surviving species for different p values','FontSize',16)

figure(4)
plot(n1:n2,standdev(1:100:1000,n1:n2)');
legend(Legendp);
xlabel('Size N','FontSize',20)
ylabel('P fraction of surviving species)','FontSize',20)
title('Normalized standard deviation for number of Surviving species for different p values','FontSize',16)