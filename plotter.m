%plot colormap based on H,p and Es
K=1;
figure(K)
colormap('jet')
imagesc(p(2:end),Es(2:end),H)
set(gca,'YDir','normal')
colorbar
K=K+1;
plotstep=500;   %plot step for the p-cross section of H
for j=2:m
    if mod(j,plotstep)==1
        figure(K)
        plot(Es(2:end),H(:,j-1));
        title(num2str(p(j)));
        K=K+1;
    end
end
   %plot remaining ouputs
figure(K)
plot(p(2:end),delta);
figure(K+1)
plot(p(2:end),lowedge);
hold on
plot(p(2:end),upedge);
hold off
figure(K+2)
plot(p(2:end),xp);
figure(K+3)
plot(p(2:end),sp);
figure(K+4)
plot(p(2:end),xwp);
figure(K+5)
plot(p(2:end),swp);

%plot colormap based on subH
figure(K+6)
    colormap('jet')
    imagesc(p(2:end),Es(2:end),subH)
    set(gca,'YDir','normal')
    colorbar
K=K+7;
for h=1:nME
    figure(K)
    plot(p(2:end),entxwp(h,:));
    K=K+1;
    figure(K)
    plot(p(2:end),entstdwp(h,:));
    K=K+1;
end

figure(K)
plot(Es(2:end),xe);
figure(K+1)
plot(Es(2:end),se);