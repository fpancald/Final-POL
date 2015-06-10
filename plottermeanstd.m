numener=1;%from 1 to nME allowed
mean=zeros(m-1,n2-n1+1);
standdev=zeros(m-1,n2-n1+1);
for in=n1:n2
    number=round(max(max(entxwps{in}(1:nME,:))));
    mean(:,in)=entxwps{in}(numener,:)/number;
    standdev(:,in)=entstdwps{in}(numener,:)/number;
end
set(0,'DefaultAxesLineStyleOrder',{'-','--',':'})
figure(1)
plot(p(2:end),mean(:,n1:n2));
figure(2)
plot(p(2:end),standdev(:,n1:n2));
figure(3)
plot(n1:n2,mean(1:100:1001,n1:n2)');
figure(4)
plot(n1:n2,standdev(1:100:1001,n1:n2)');