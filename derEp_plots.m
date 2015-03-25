dEp=zeros(l,m-2);
for i=3:m
    for j=1:l
        dEp(j,i-2)=(E(j,i)-E(j,i-1))/(p(i)-p(i-1));
    end
end
% plot((p(2:end-1)+p(3:end))/2,dEp);
hold on
for j=1:26
    plot((p(2:end-1)+p(3:end))/2,dEp(j,:))
end