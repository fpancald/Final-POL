% n=n1:n2;
numener=1;%from 1 to nME allowed
mean=zeros(m-1,length(n));
standdev=zeros(m-1,length(n));
Legendp=cell(10,1);
LegendN=cell(length(n),1);
for in=1:length(n)
    number=round(max(max(entxwps{n(in)}(1:nME,:))));
    mean(:,in)=entxwps{n(in)}(numener,:)/number;
    standdev(:,in)=entstdwps{n(in)}(numener,:)/number;
    LegendN{in}=['N = ' num2str(n(in))] ;
end
for pin=1:100:1000
    Legendp{ceil(pin/100)}=['p = ' num2str(p(pin+1))] ;
end
set(0,'DefaultAxesLineStyleOrder',{'-','--',':'})

figure(1)
plot(p(2:end),mean(:,1:length(n)));
legend(LegendN);
xlabel('parameter p','FontSize',20)
ylabel('P fraction of surviving species','FontSize',20)
title('Normalized mean number of Surviving species by size N','FontSize',16)

figure(2)
plot(p(2:end),standdev(:,1:length(n)));
legend(LegendN);
xlabel('parameter p','FontSize',20)
ylabel('P fraction of surviving species','FontSize',20)
title('Normalized standard deviation for number of Surviving species by size N','FontSize',16)

figure(3)
plot(n,mean(1:100:1000,1:length(n))');
legend(Legendp);
xlabel('Size N','FontSize',20)
ylabel('P fraction of surviving species','FontSize',20)
title('Normailzed mean number of Surviving species for different p values','FontSize',16)

figure(4)
plot(n,standdev(1:100:1000,1:length(n))');
legend(Legendp);
xlabel('Size N','FontSize',20)
ylabel('P fraction of surviving species)','FontSize',20)
title('Normalized standard deviation for number of Surviving species for different p values','FontSize',16)