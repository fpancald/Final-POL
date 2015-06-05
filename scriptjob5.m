%mean and std in window as energy maximized with respect to mean energy
% entxwps=zeros(nME,m-1);
% entstdwps=zeros(nME,m-1);
% for j=2:m
%     [exwp,estdwp]=energymeanstd(10.^(mx/nME:mx/nME:mx),HH{7}(:,j-1),10.^(Es));
%     entxwps(:,j-1)=exwp;
%     entstdwps(:,j-1)=estdwp;
% end
number=4;
figure(1)
plot(p(2:end),entxwps(1:nME,:)/number);
K=K+1;
xlabel('p','FontSize',20)
ylabel('N','FontSize',20)
title('Mean number of surviving species','FontSize',16)
figure(K)
plot(p(2:end),entstdwps(1:nME,:)/number);
K=K+1;
xlabel('p','FontSize',20)
ylabel('N','FontSize',20)
title('Standard deviation for number of surviving species','FontSize',16)