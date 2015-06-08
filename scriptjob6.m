%mean and std in window as energy maximized with respect to mean energy

% in=15;
for in=n1:n2
    entxwps{in}=zeros(nME,m-1);
    entstdwps{in}=zeros(nME,m-1);
    for j=2:m
        [exwp,estdwp]=energymeanstd(10.^(mx/nME:mx/nME:mx),HH{in}(:,j-1),10.^(Es));
        entxwps{in}(:,j-1)=exwp;
        entstdwps{in}(:,j-1)=estdwp;
    end
end
% max(max(HH{in}))
% number=max(max(HH{in}))
% K=1;
% figure(K)
% plot(p(2:end),entxwps(1:nME,:)/number);
% K=K+1;
% xlabel('p','FontSize',20)
% ylabel('N','FontSize',20)
% title('Mean number of surviving species','FontSize',16)
% figure(K)
% plot(p(2:end),entstdwps(1:nME,:)/number);
% K=K+1;
% xlabel('p','FontSize',20)
% ylabel('N','FontSize',20)
% title('Standard deviation for number of surviving species','FontSize',16)